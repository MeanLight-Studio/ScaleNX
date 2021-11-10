extends TextureRect

onready var main : Control = get_tree().get_root().get_node("Main")

func _process(delta):
	var camera := $"../../ViewportContainer/Viewport/Camera2D"
	rect_position = -camera.global_position / main.zoom + get_viewport().size/2
