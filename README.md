# TextureCutter (Godot 4)

TextureCutter is an editor plugin that adds an export button to AtlasTexture in the Inspector.
It lets you export the selected region as a PNG file directly from the editor.

## Features

- Adds Export Region button for AtlasTexture resources.
- Exports current AtlasTexture region to PNG.
- Works inside the Godot editor (tool plugin).

## Requirements

- Godot 4.x

## Installation

1. Copy the folder addons/texture_cutter into your project.
2. Open Project > Project Settings > Plugins.
3. Enable TextureCutter.

## Usage

1. Create or open an AtlasTexture resource.
2. Set Atlas and Region.
3. In the Inspector, click Export Region.
4. Choose a save path in res:// and confirm.

## Folder Structure

- addons/texture_cutter/plugin.cfg
- addons/texture_cutter/texture_cutter.gd
- addons/texture_cutter/inspector.gd
- addons/texture_cutter/icon.svg

## Publishing Notes (Godot Asset Library)

1. Create a Git tag, for example v1.0.0.
2. Publish a GitHub release from that tag.
3. Submit the repository URL to Godot Asset Library.
4. Keep plugin files under addons/texture_cutter only.
5. Use .gitattributes export-ignore rules to exclude development-only files.

## License

MIT. See LICENSE.
