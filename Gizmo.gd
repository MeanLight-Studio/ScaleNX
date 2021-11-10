extends TextureRect

onready var main : Control = get_tree().get_root().get_node("Main")

func _process(delta):
	rect_position = -main.camera.global_position / main.zoom + get_viewport().size/2
