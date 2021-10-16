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
		scale3X(image3X, image)
		scale3X(image9X, image3X)
		texture.create_from_image(image,0)
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
	scale3X(image3X, image)
	scale3X(image9X, image3X)
	texture.create_from_image(image,0)
	scaled_sprite.texture = texture
	$ColorRect.hide()
	$PopupDialog.hide()
	

func scale3X(scaled : Image, image : Image):
	scaled.create(image.get_width()*3, image.get_height()*3, false, Image.FORMAT_RGBA8)
	scaled.lock()
	image.lock()
	var a : Color
	var b : Color
	var c : Color
	var d : Color
	var e : Color
	var f : Color
	var g : Color
	var h : Color
	var i : Color

	for x in range(1,image.get_width()-1):
		for y in range(1,image.get_height()-1):
			var xs : float = 3*x
			var ys : float = 3*y

			a = image.get_pixel(x-1,y-1)
			b = image.get_pixel(x,y-1)
			c = image.get_pixel(x+1,y-1)
			d = image.get_pixel(x-1,y)
			e = image.get_pixel(x,y)
			f = image.get_pixel(x+1,y)
			g = image.get_pixel(x-1,y+1)
			h = image.get_pixel(x,y+1)
			i = image.get_pixel(x+1,y+1)

			var db : bool = d == b
			var dh : bool = d == h
			var bf : bool = f == b
			var ec : bool = e == c
			var ea : bool = e == a
			var fh : bool = f == h
			var eg : bool = e == g
			var ei : bool = e == i

			scaled.set_pixel(xs-1, ys-1, d if (db and !dh and !bf) else e )
			scaled.set_pixel(xs, ys-1, b if (db and !dh and !bf and !ec) or
			(bf and !db and !fh and !ea) else e)
			scaled.set_pixel(xs+1, ys-1, f if (bf and !db and !fh) else e)
			scaled.set_pixel(xs-1, ys, d if (dh and !fh and !db and !ea) or
			 (db and !dh and !bf and !eg) else e)
			scaled.set_pixel(xs, ys, e);
			scaled.set_pixel(xs+1, ys, f if (bf and !db and !fh and !ei) or
			(fh and !bf and !dh and !ec) else e)
			scaled.set_pixel(xs-1, ys+1, d if (dh and !fh and !db) else e)
			scaled.set_pixel(xs, ys+1, h if (fh and !bf and !dh and !eg) or
			(dh and !fh and !db and !ei) else e)
			scaled.set_pixel(xs+1, ys+1, f if (fh and !bf and !dh) else e)

	scaled.unlock()
	image.unlock()
	return scaled


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
	scaled_sprite.texture = texture
	
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
