@tool
extends EditorPlugin

var inspector_plugin

func _enable_plugin() -> void:
    # Add autoloads here.
    pass


func _disable_plugin() -> void:
    # Remove autoloads here.
    pass


func _enter_tree() -> void:
    inspector_plugin = preload("res://addons/texture_cutter/inspector.gd").new()
    add_inspector_plugin(inspector_plugin)


func _exit_tree() -> void:
    remove_inspector_plugin(inspector_plugin)
