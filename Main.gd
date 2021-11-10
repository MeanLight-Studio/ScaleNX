extends Control

signal selection_changed(selection)

var selected_sprites := []
var sprites_to_delete := []

var moving_camera := false
var last_movement := Vector2.ZERO
var last_mouse_position := Vector2.ZERO

var zoom := 1.0 setget set_zoom

onready var camera := $ViewportContainer/Viewport/Camera2D

onready var file_menu : PopupMenu = $ToolBar/VBoxContainer/FileMenu.get_popup()
onready var view_menu : PopupMenu = $ToolBar/VBoxContainer/ViewMenu.get_popup()
onready var help_menu : PopupMenu = $ToolBar/VBoxContainer/HelpMenu.get_popup()

onready var checkboard := $CheckBoard

onready var viewport := $ViewportContainer/Viewport
onready var sprites_container := $ViewportContainer/Viewport/Sprites
onready var file_dialog := $FileDialog

onready var unselect_timer := $UnselectTimer

onready var spinboxes := $SpinboxesContainer

onready var info_container := $ScrollContainer/VBoxContainer

onready var delete_warning := $DeleteWarning

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			var multi = event.control
			if event.is_pressed() and not multi:
				clear_selection()
			var clicked_sprite := get_clicked_sprite()
			if clicked_sprite != null:
				if event.is_pressed():
					if clicked_sprite.selected:
						if multi:
							unselect_timer.start()
					else:
						set_selected_sprite(clicked_sprite)
				else:
					if not unselect_timer.is_stopped() and multi:
						set_unselected_sprite(clicked_sprite)
			
		moving_camera = false
		if event.button_index == BUTTON_MIDDLE and event.is_pressed():
			moving_camera = true
		elif event.button_index == BUTTON_WHEEL_UP:
			self.zoom = clamp(zoom * 0.9, 0.01, 50)
		elif event.button_index == BUTTON_WHEEL_DOWN:
			self.zoom = clamp(zoom * 1.1, 0.01, 50)
			
	if event.is_action_pressed("delete"):
		delete_sprites(selected_sprites.duplicate())
		clear_selection()

func get_clicked_sprite() -> Sprite:
	var mouse_position : Vector2 = viewport.get_mouse_position() - viewport.size / 2
	var clicked_sprite : Sprite = null
	
	for i in range(sprites_container.get_child_count()-1, -1, -1):
		var sprite = sprites_container.get_child(i)
		if not sprite.texture:
			continue
		var s : Vector2 = sprite.texture.get_size()
		var d : Vector2 = mouse_position - sprite.global_position
		var r := Rect2((sprite.global_position-camera.position)/zoom, s/zoom)
		if r.has_point(mouse_position):
			clicked_sprite = sprite
			break
	return clicked_sprite

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
		camera.position -= (get_global_mouse_position() - last_mouse_position)*zoom
	
	
	if not selected_sprites.empty() and Input.is_action_pressed("left_click"):
		var delta = (get_global_mouse_position() - last_mouse_position)*zoom
		last_movement += delta
		for sprite in selected_sprites:
			sprite.position += delta
	
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
		
		add_sprite(sprite)
		
		$ColorRect.hide()
		$PopupDialog.hide()
	else:
		file_dialog.popup()



func save_images():
	if sprites_container.get_child_count() == 0:
		return
	
	for sprite in selected_sprites:
		
		if sprite.texture:
			var output_name : String = sprite.image_path
			var extension := output_name.get_extension()
			var ext_position = output_name.find_last(extension)
			output_name = output_name.insert(ext_position - 1, "_"+str(sprite.factor)+"X")
			sprite.texture.get_data().save_png(output_name)


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
			delete_sprites(sprites_container.get_children())
		3:
			get_tree().quit()
	
func _on_view_menu_id_pressed(id):
	match id:
		0:
			self.zoom = 1
		1:
			if sprites_container.get_child_count() == 0:
				return
			var rect := Rect2(0,0,0,0)
			for sprite in sprites_container.get_children():
				var s : Vector2 = sprite.texture.get_size()
				var r := Rect2((sprite.global_position), s)
				if rect.size == Vector2.ZERO:
					rect = r
				else:
					rect = rect.merge(r)
			if rect.size != Vector2.ZERO:
				camera.position = rect.position + rect.size/2
				var ratio = rect.size / (get_viewport().size-Vector2(0.0,100.0))
				self.zoom = clamp(max(ratio.x, ratio.y), 0.01, 50)
				
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


func set_selected_sprite(sprite : Sprite):
	if not sprite in selected_sprites:
		sprite.selected = true
		selected_sprites.append(sprite)
	
	emit_signal("selection_changed", selected_sprites)
	
func set_unselected_sprite(sprite: Sprite):
	if sprite in selected_sprites:
		sprite.selected = false
		selected_sprites.remove(selected_sprites.find(sprite))
	emit_signal("selection_changed", selected_sprites)

func clear_selection():
	for sprite in selected_sprites:
		sprite.selected = false
	selected_sprites.clear()
	emit_signal("selection_changed", selected_sprites)

func _on_FileDialog_files_selected(paths):
	$PopupDialog.popup()
	$ColorRect.show()
	
	for path in paths:
		var sprite = preload("res://ScaledSprite.tscn").instance()
		sprites_container.add_child(sprite)
		sprite.set_image_path(path)
		add_sprite(sprite)
	
	$ColorRect.hide()
	$PopupDialog.hide()

func add_sprite(sprite):
	var scale_spinbox := preload("res://ScaleSpinBox.tscn").instance()
	scale_spinbox.sprite = sprite
	spinboxes.add_child(scale_spinbox)
	
	var info_label : Label = preload("res://InfoLabel.tscn").instance()
	info_label.sprite = sprite
	$ScrollContainer/VBoxContainer.add_child(info_label)
	
func delete_sprite(sprite):
	for spinbox in spinboxes.get_children():
		if spinbox.sprite == sprite:
			spinbox.queue_free()
			break
	for label in info_container.get_children():
		if label.sprite == sprite:
			label.queue_free()
			break
	if sprite in selected_sprites:
		selected_sprites.remove(selected_sprites.find(sprite))
	sprite.queue_free()
	
func set_zoom(z):
	zoom = z
	camera.zoom = Vector2.ONE*zoom
	$HBoxContainer/ZoomIndicator.text = "Zoom: %.2f" % (1.0/zoom)


func _on_ResetZoom_pressed():
	self.zoom = 1

func delete_sprites(sprites : Array):
	sprites_to_delete = sprites
	var sprites_names := ""
	for sprite in sprites:
		sprites_names += sprite.image_path + "\n"
	delete_warning.get_node("TextEdit").text = sprites_names
	delete_warning.popup_centered()

func _on_DeleteWarning_confirmed():
	for sprite in sprites_to_delete:
		delete_sprite(sprite)
