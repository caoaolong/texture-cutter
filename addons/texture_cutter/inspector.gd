@tool
extends EditorInspectorPlugin

var texture: Texture2D
var region: Rect2

func _can_handle(object: Object) -> bool:
    return object is AtlasTexture

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass


func _parse_end(object):
    var btn = Button.new()
    btn.text = "Export Region"

    btn.pressed.connect(func():
        _export_region(object)
    )

    add_custom_control(btn)

func _export_region(atlas_tex: AtlasTexture):
    if atlas_tex.atlas == null:
        push_error("没有设置 Atlas")
        return

    texture = atlas_tex.atlas
    region = atlas_tex.region

    if region.size == Vector2.ZERO:
        push_error("Region 为空")
        return

    var dialog = EditorFileDialog.new()
    dialog.file_mode = EditorFileDialog.FILE_MODE_SAVE_FILE
    dialog.access = EditorFileDialog.ACCESS_RESOURCES
    dialog.add_filter("*.png")

    dialog.file_selected.connect(func(path):
        _save_texture_region(path)
    )

    var tree := Engine.get_main_loop() as SceneTree
    if tree == null:
        push_error("无法获取 SceneTree")
        return

    tree.root.add_child(dialog)
    dialog.popup_centered_ratio(0.8)

func _save_texture_region(path: String):
    # 获取 Image
    var img = texture.get_image()

    # 裁剪
    var cropped = Image.create(
        region.size.x,
        region.size.y,
        false,
        img.get_format()
    )

    cropped.blit_rect(
        img,
        Rect2(region.position, region.size),
        Vector2.ZERO
    )

    var err = cropped.save_png(path)

    if err == OK:
        print("导出成功:", path)
    else:
        push_error("导出失败")