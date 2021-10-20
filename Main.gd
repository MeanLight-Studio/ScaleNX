extends Control

onready var panel := $Panel
onready var scaled_sprite := $ViewportContainer/Viewport/Scaled
onready var file_dialog := $FileDialog

var image_path := ""
var texture := ImageTexture.new()
var image3X := Image.new()
var image9X := Image.new()

var moving_camera := false
var last_mouse_position := Vector2.ZERO

var zoom := 1.0

onready var image := Image.new()
onready var spin_box := $Panel/VBoxContainer/HBoxContainer/SpinBox
onready var thread := Thread.new()
onready var mutex := Mutex.new()
onready var camera := $ViewportContainer/Viewport/Camera2D

onready var viewport3X := $Scale3X
onready var viewport9X := $Scale9X
onready var viewport27X := $Scale27X

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			moving_camera = event.pressed
		elif event.button_index == BUTTON_WHEEL_UP:
			zoom = clamp(zoom * 0.9, 0.1, 5)
			camera.zoom = zoom * Vector2.ONE
		elif event.button_index == BUTTON_WHEEL_DOWN:
			zoom = clamp(zoom * 1.1, 0.1, 5)
			camera.zoom = zoom * Vector2.ONE
		

func _ready():
	$ColorRect.hide()


func _process(_delta):
	panel.rect_size = panel.get_child(0).rect_size + Vector2(20,20)
	if moving_camera:
		camera.position -= (get_global_mouse_position() - last_mouse_position)*zoom

	last_mouse_position = get_global_mouse_position()
	
func _on_OpenButton_pressed():
	if OS.get_name() == "HTML5":
		$PopupDialog.popup()
		$ColorRect.show()
		HtmlFiles.load_image()
		yield(HtmlFiles, "loaded")
		image = HtmlFiles.loaded_image.duplicate()
		
		yield(get_tree(), "idle_frame")
		yield(get_tree(), "idle_frame")
		yield(get_tree(), "idle_frame")
		
		texture.create_from_image(image,0)
		
		viewport3X.size = texture.get_size()*3;
		viewport9X.size = texture.get_size()*9;
		viewport27X.size = texture.get_size()*27;
		
		viewport3X.get_node("Sprite").position = viewport3X.size/2
		viewport9X.get_node("Sprite").position = viewport9X.size/2
		viewport27X.get_node("Sprite").position = viewport27X.size/2
		
		viewport3X.get_node("Sprite").texture = texture.duplicate()
		yield(get_tree(), "idle_frame")
		image3X = viewport3X.get_texture().get_data()
		
		
		var texture9x := ImageTexture.new()
		texture9x.create_from_image(image3X, 0)
		viewport9X.get_node("Sprite").texture = texture9x.duplicate()
		yield(get_tree(), "idle_frame")
		image9X = viewport9X.get_texture().get_data()

		
		scaled_sprite.texture = texture
		$ColorRect.hide()
		$PopupDialog.hide()
	else:
		file_dialog.popup()


func _on_FileDialog_file_selected(path):
	spin_box.value = 1
	var _error := image.load(path)
	file_dialog.hide()
	$PopupDialog.popup()
	$ColorRect.show()
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	
	texture.create_from_image(image,0)
	
	viewport3X.size = texture.get_size()*3;
	viewport9X.size = texture.get_size()*9;
	viewport27X.size = texture.get_size()*27;
	
	viewport3X.get_node("Sprite").position = viewport3X.size/2
	viewport9X.get_node("Sprite").position = viewport9X.size/2
	viewport27X.get_node("Sprite").position = viewport27X.size/2
	
	viewport3X.get_node("Sprite").texture = texture.duplicate()
	viewport3X.render_target_update_mode = Viewport.UPDATE_ONCE
	yield(VisualServer,"frame_post_draw")
	image3X = viewport3X.get_texture().get_data().duplicate()
	
	
	var texture9x := ImageTexture.new()
	texture9x.create_from_image(image3X, 0)
	viewport9X.get_node("Sprite").texture = texture9x.duplicate()
	viewport9X.render_target_update_mode = Viewport.UPDATE_ONCE
	yield(VisualServer,"frame_post_draw")
	yield(get_tree(), "idle_frame")
	image9X = viewport9X.get_texture().get_data().duplicate()

	
	scaled_sprite.texture = texture
	$ColorRect.hide()
	$PopupDialog.hide()
	


func _on_SpinBox_value_changed(value):
	
	if not scaled_sprite.texture:
		return
	var times := 0
	while value > pow(3,times):
		times += 1
	var result : Image 
	
	spin_box.editable = false
	
	match times:
		0:
			result = image.duplicate()
		1:
			result = image3X.duplicate()
		2:
			result = image9X.duplicate()

	result.resize(value * image.get_width(), value * image.get_height(), Image.INTERPOLATE_NEAREST)

	texture.create_from_image(result,0)
	scaled_sprite.texture = texture.duplicate()
	
	spin_box.editable = true


func _on_SaveDialog_file_selected(path):
	if scaled_sprite.texture:
		scaled_sprite.texture.get_data().save_png(path)


func _on_SaveButton_pressed():
	if not scaled_sprite.texture:
		return
	if OS.get_name() == "HTML5":
		HtmlFiles.save_image(scaled_sprite.texture.get_data())
	else:
		$SaveDialog.popup()
