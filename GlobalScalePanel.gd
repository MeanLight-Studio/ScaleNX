extends PanelContainer

export (NodePath) var sprites_container_path
export (NodePath) var main_path

onready var sprites_container := get_node(sprites_container_path)
onready var main := get_node(main_path)
onready var all_button := $VBoxContainer/All
onready var selected_button := $VBoxContainer/Selected
onready var spin_box := $VBoxContainer/HBoxContainer/SpinBox

func _process(delta):
	visible = sprites_container.get_child_count() > 1
	selected_button.disabled = main.selected_sprites.size() <= 1


func _on_All_pressed():
	for sprite in sprites_container.get_children():
		sprite.set_factor(spin_box.value)


func _on_Selected_pressed():
	for sprite in main.selected_sprites:
		sprite.set_factor(spin_box.value)
