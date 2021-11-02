extends Label

var sprite : Sprite = null setget set_sprite

func sprite_selected(selected : bool):
	visible = selected
	update_text()

func set_sprite(s : Sprite):
	sprite = s
	sprite.connect("scaled", self, "update_text")
	sprite.connect("selected_changed", self, "sprite_selected")
			
func update_text():
	if sprite.texture:
		text = \
				"Name: " + sprite.image_path.get_file() + "\n" + \
				"Original Size: " + str(sprite.original_texture.get_size()) + "\n" + \
				"Scaled Size: " + str(sprite.texture.get_size())
