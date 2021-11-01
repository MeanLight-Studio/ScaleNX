extends Sprite

var image_path := "" setget set_image_path
var original_texture := ImageTexture.new()
var image3X := Image.new()
var image9X := Image.new()

var factor := 1 setget set_factor
var selected := false setget set_selected

onready var viewport3X := $Scale3X
onready var viewport9X := $Scale9X

onready var image := Image.new()

func set_image_path(path : String) -> bool:
	image_path = path
	var error := image.load(path)
	if error:
		return false
	
	update_image()
	return true

func update_image():
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	
	original_texture.create_from_image(image,0)
	
	viewport3X.size = original_texture.get_size()*3;
	viewport9X.size = original_texture.get_size()*9;
	
	viewport3X.get_node("Sprite").position = viewport3X.size/2
	viewport9X.get_node("Sprite").position = viewport9X.size/2
	
	viewport3X.get_node("Sprite").texture = original_texture.duplicate()
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

	
	
	texture = original_texture
	adjust_reference_rect()
	
func adjust_reference_rect():
	$ReferenceRect.rect_size = texture.get_size()
	$ReferenceRect.rect_position = -texture.get_size()/2


func set_factor(value):
	if value == factor:
		return
	factor = value
	var times := 0
	while value > pow(3,times):
		times += 1
	var result : Image 
	
	match times:
		0:
			result = image.duplicate()
		1:
			result = image3X.duplicate()
		2:
			result = image9X.duplicate()

	result.resize(value * image.get_width(), value * image.get_height(), Image.INTERPOLATE_NEAREST)

	original_texture.create_from_image(result,0)
	texture = original_texture.duplicate()
	adjust_reference_rect()

func set_selected(s : bool):
	selected = s
	$ReferenceRect.visible = s
