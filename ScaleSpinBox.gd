extends PanelContainer

var sprite : Sprite setget set_sprite

var selected := false setget set_selected

onready var main := get_tree().get_root().get_node("Main")

func set_selected(s : bool):
	selected = s
	visible = s
	
func _process(delta):
	if sprite.texture:
		var s := sprite.texture.get_size()
		rect_position = (sprite.global_position)/main.zoom + get_viewport_rect().size/2 - Vector2(0, rect_size.y + 5)

func set_sprite(s : Sprite):
	sprite = s
	$HBoxContainer/SpinBox.connect("value_changed", sprite, "set_factor")
	sprite.connect("selected_changed", self, "set_selected")
	
