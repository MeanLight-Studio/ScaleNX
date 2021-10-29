extends Control


var image_path := ""
var texture := ImageTexture.new()
var image3X := Image.new()
var image9X := Image.new()

var selected_sprite : Sprite = null setget set_selected_sprite

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

onready var file_menu : PopupMenu = $ToolBar/VBoxContainer/FileMenu.get_popup()
onready var view_menu : PopupMenu = $ToolBar/VBoxContainer/ViewMenu.get_popup()
onready var about_menu : PopupMenu = $ToolBar/VBoxContainer/AboutMenu.get_popup()

onready var checkboard := $CheckBoard

onready var panel := $Panel
onready var viewport := $ViewportContainer/Viewport
onready var sprites_container := $ViewportContainer/Viewport/Sprites
onready var file_dialog := $FileDialog

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.is_pressed():
			var mouse_position : Vector2 = viewport.get_mouse_position() - viewport.size / 2
			set_selected_sprite(null)
			for sprite in sprites_container.get_children():
				var s : Vector2 = sprite.texture.get_size()
				var d : Vector2 = mouse_position - sprite.global_position
				var r := Rect2((sprite.global_position - s/2)/zoom, s/zoom)
				if r.has_point(mouse_position):
					set_selected_sprite(sprite)
		moving_camera = false
		if event.button_index == BUTTON_MIDDLE and event.is_pressed():
			moving_camera = true
		elif event.button_index == BUTTON_WHEEL_UP:
			zoom = clamp(zoom * 0.9, 0.01, 50)
			camera.zoom = zoom * Vector2.ONE
		elif event.button_index == BUTTON_WHEEL_DOWN:
			zoom = clamp(zoom * 1.1, 0.01, 50)
			camera.zoom = zoom * Vector2.ONE

func _ready():
	$ColorRect.hide()
	get_tree().connect("files_dropped", self, "_on_files_dropped")
	file_menu.connect("id_pressed", self, "_on_file_menu_id_pressed")
	view_menu.connect("id_pressed", self, "_on_view_menu_id_pressed")
	about_menu.connect("id_pressed", self, "_on_about_menu_id_pressed")
	
	if OS.get_name() == "HTML5":
		file_menu.remove_item(2)



func _on_files_dropped(files, screen):
	_on_FileDialog_file_selected(files[0])


func _process(_delta):
	if moving_camera:
		sprites_container.position += (get_global_mouse_position() - last_mouse_position)*zoom
	if selected_sprite != null and Input.is_action_pressed("left_click"):
		selected_sprite.position += (get_global_mouse_position() - last_mouse_position)*zoom
	last_mouse_position = get_global_mouse_position()
	
func _on_import_files():
	if OS.get_name() == "HTML5":
		$PopupDialog.popup()
		$ColorRect.show()
		HtmlFiles.load_image()
		yield(HtmlFiles, "loaded")
		image = HtmlFiles.loaded_image.duplicate()
		
		import_file()
		
		$ColorRect.hide()
		$PopupDialog.hide()
	else:
		file_dialog.popup()


func _on_FileDialog_file_selected(path):
	spin_box.value = 1
	var error := image.load(path)
	if error:
		return
	file_dialog.hide()
	
	$PopupDialog.popup()
	$ColorRect.show()
	import_file()
	
	$ColorRect.hide()
	$PopupDialog.hide()
	
func import_file():
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

	var sprite = preload("res://ScaledSprite.tscn").instance()
	sprites_container.add_child(sprite)
	
	sprite.texture = texture
	adjust_reference_rect(sprite)
	

func _on_SpinBox_value_changed(value):
	if sprites_container.get_child_count() == 0:
		return
	if selected_sprite == null:
		set_selected_sprite(sprites_container.get_child(0))
		
	if not selected_sprite.texture:
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
	selected_sprite.texture = texture.duplicate()
	adjust_reference_rect(selected_sprite)
	
	spin_box.editable = true


func _on_SaveDialog_file_selected(path):
	#TODO need to fix for multiple images
	if sprites_container.get_child_count() == 0:
		return
	if selected_sprite == null:
		set_selected_sprite(sprites_container.get_child(0))
		
	if selected_sprite.texture:
		selected_sprite.texture.get_data().save_png(path)


func _on_export_file():
	if sprites_container.get_child_count() == 0:
		return
	if selected_sprite == null:
		set_selected_sprite(sprites_container.get_child(0))
		
	if not selected_sprite.texture:
		return
	if OS.get_name() == "HTML5":
		HtmlFiles.save_image(selected_sprite.texture.get_data())
	else:
		$SaveDialog.popup()

func _on_file_menu_id_pressed(id):
	match id:
		0:
			_on_import_files()
		1:
			_on_export_file()
		2:
			get_tree().quit()
	
func _on_view_menu_id_pressed(id):
	match id:
		0:
			zoom = 1
			camera.zoom = Vector2.ONE
		1:
			pass
		2:
			sprites_container.position = Vector2.ZERO
		4:
			view_menu.toggle_item_checked(view_menu.get_item_index(id))
			view_menu.toggle_item_checked(view_menu.get_item_index(5))
			checkboard.material.set_shader_param("brightness", 0.35)
	
		5:
			view_menu.toggle_item_checked(view_menu.get_item_index(id))
			view_menu.toggle_item_checked(view_menu.get_item_index(4))
			checkboard.material.set_shader_param("brightness", 0)
	
func _on_about_menu_id_pressed(id):
	print(id)

func adjust_reference_rect(sprite : Sprite):
	sprite.get_node("ReferenceRect").rect_size = texture.get_size()
	sprite.get_node("ReferenceRect").rect_position = -texture.get_size()/2

func set_selected_sprite(sprite : Sprite):
	if selected_sprite != null:
		selected_sprite.get_node("ReferenceRect").visible = false
	
	if sprite != null:
		sprite.get_node("ReferenceRect").visible = true
	selected_sprite = sprite
