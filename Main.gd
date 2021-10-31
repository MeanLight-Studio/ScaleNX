extends Control

var selected_sprites := []

var moving_camera := false
var last_mouse_position := Vector2.ZERO

var zoom := 1.0

onready var camera := $ViewportContainer/Viewport/Camera2D

onready var file_menu : PopupMenu = $ToolBar/VBoxContainer/FileMenu.get_popup()
onready var view_menu : PopupMenu = $ToolBar/VBoxContainer/ViewMenu.get_popup()
onready var help_menu : PopupMenu = $ToolBar/VBoxContainer/HelpMenu.get_popup()

onready var spin_box := $Panel/VBoxContainer/HBoxContainer/SpinBox

onready var checkboard := $CheckBoard

onready var viewport := $ViewportContainer/Viewport
onready var sprites_container := $ViewportContainer/Viewport/Sprites
onready var file_dialog := $FileDialog

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.is_pressed():
			var mouse_position : Vector2 = viewport.get_mouse_position() - viewport.size / 2
			var multi = event.control
			var selected := false
			for sprite in sprites_container.get_children():
				var s : Vector2 = sprite.texture.get_size()
				var d : Vector2 = mouse_position - sprite.global_position
				var r := Rect2((sprite.global_position - s/2)/zoom, s/zoom)
				if r.has_point(mouse_position):
					selected = true
					set_selected_sprite(sprite, multi)
			if not selected:
				clear_selection()
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
	help_menu.connect("id_pressed", self, "_on_help_menu_id_pressed")
	
	if OS.get_name() == "HTML5":
		file_menu.remove_item(2)



func _on_files_dropped(files, screen):
	_on_FileDialog_files_selected(files)


func _process(_delta):
	if moving_camera:
		sprites_container.position += (get_global_mouse_position() - last_mouse_position)*zoom
	
	
	if not selected_sprites.empty() and Input.is_action_pressed("left_click"):
		var global_mouse_position = get_global_mouse_position()
		for sprite in selected_sprites:
			sprite.position += (global_mouse_position - last_mouse_position)*zoom
	
	last_mouse_position = get_global_mouse_position()
	
func _on_import_files():
	if OS.get_name() == "HTML5":
		$PopupDialog.popup()
		$ColorRect.show()
		
		HtmlFiles.load_image()
		yield(HtmlFiles, "loaded")
		
		var sprite = preload("res://ScaledSprite.tscn").instance()
		
		sprites_container.add_child(sprite)
		sprite.image = HtmlFiles.loaded_image.duplicate()
		sprite.update_image()
		
		$ColorRect.hide()
		$PopupDialog.hide()
	else:
		file_dialog.popup()


func _on_FileDialog_file_selected(path):
	$PopupDialog.popup()
	$ColorRect.show()
	
	var sprite = preload("res://ScaledSprite.tscn").instance()
	sprites_container.add_child(sprite)
	sprite.set_image_path(path)
	
	$ColorRect.hide()
	$PopupDialog.hide()


func save_images():
	#TODO need to fix for multiple images
	if sprites_container.get_child_count() == 0:
		return
	
	for sprite in selected_sprites:
		
		if sprite.texture:
			var output_name : String = sprite.image_path
			var extension := output_name.get_extension()
			var ext_position = output_name.find_last(extension)
			output_name.insert(ext_position - 1, "_"+str(sprite.factor)+"X")
			sprite.texture.get_data().save_png(sprite.image_path)


func _on_export_file():
	if sprites_container.get_child_count() == 0:
		return
		
	if OS.get_name() == "HTML5":
		# TODO FIX THIS
		HtmlFiles.save_image(selected_sprites[0].texture.get_data())
	else:
		save_images()

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
			if sprites_container.get_child_count() == 0:
				return
			var rect := Rect2(0,0,0,0)
			for sprite in sprites_container.get_children():
				var s : Vector2 = sprite.texture.get_size()
				var r := Rect2((sprite.global_position - s/2), s)
				if rect.size == Vector2.ZERO:
					rect = r
				else:
					rect = rect.merge(r)
			if rect.size != Vector2.ZERO:
				
				sprites_container.position -= rect.position + rect.size / 2
				var ratio = rect.size / get_viewport().size
				zoom = clamp(max(ratio.x, ratio.y), 0.01, 50)
				camera.zoom = zoom * Vector2.ONE
				
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
	
func _on_help_menu_id_pressed(id):
	match id:
		0:
			pass
		1:
			$AboutDialog.popup_centered()


func set_selected_sprite(sprite : Sprite, multi := false):
	if not multi:
		clear_selection()
	
	if sprite != null:
		selected_sprites.append(sprite)
		sprite.selected = true
		spin_box.editable = true
		if not multi:
			spin_box.value = selected_sprites[0].factor
	else:
		spin_box.editable = false
	



func _on_SpinBox_value_changed(value):
	if sprites_container.get_child_count() == 0:
		return
	for sprite in selected_sprites:
		sprite.factor = value

func clear_selection():
	for sprite in selected_sprites:
		sprite.selected = false
	selected_sprites.clear()


func _on_FileDialog_files_selected(paths):
	$PopupDialog.popup()
	$ColorRect.show()
	
	for path in paths:
		var sprite = preload("res://ScaledSprite.tscn").instance()
		sprites_container.add_child(sprite)
		sprite.set_image_path(path)
	
	$ColorRect.hide()
	$PopupDialog.hide()
