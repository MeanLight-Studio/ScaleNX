GDPC                                                                               @   res://.import/favicon.png-ad684d17faa662133229b6300264136f.stex @,     G      ����l6��T�o�|�<   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex��     G      ����l6��T�o�|�@   res://.import/icons.svg-e71f5c4b2b1eb5bc3e203deee0781907.stex   0     t      ��Z��o5ƕ?����1�@   res://.import/index.png-917645f878b7eae3bd8162743181f2e0.stex   05     
]      տ��Lq:\�ŵ���<   res://.import/n.png-081d70e52f42ed435f724b65b4a1128c.stex   `�     &:      c�x�Pn�'o�{
   res://HTMLFiles.gd.remap�     $       �N_~�۳Ī�>�4�   res://HTMLFiles.gdc �      "      G�y"S�����=�3   res://Main.gd.remap @�            �(@Er�#��K�F�[   res://Main.gdc         '      ��P�-f�>seɊ����   res://Main.tscn 02      �      ����) .a�-��    res://MinimalUI/MinimalUI.tres  �F      �P      ���P�(��<o�%��$   res://MinimalUI/OpenSans-Regular.ttf��      �z     >�W]�H�>:[�f ���    res://MinimalUI/icons.svg.import�)     �      ��W���fo;�!    res://builds/favicon.png.import �2     �      u��-;���0��2>�+    res://builds/index.png.import   @�     �      ���K�C�g��L�2   res://default_env.tres  Д     �       um�`�N��<*ỳ�8   res://icon.png  `�     �      �f�$�&��� `�N~?e   res://icon.png.import   Л     �      �`�8�D�Ւ�(�1��   res://n.png.import  ��     y      ��]�_���QԸ�~~�   res://project.binaryP�     *      �p�H��p��l��g    GDSC   #      L   �     ���Ӷ���   ������Ŷ   �����Ҷ�   �����������Ӷ���   ����Ӷ��   �����϶�   �嶶   �������Ӷ���   ����������Ӷ   ���������Ŷ�   ������������ض��   �����������ض���   �������ƶ���   ����������������������������   ����������ڶ   ���������¶�   ���ڶ���   ���������Ӷ�   �������Ӷ���   �����������Ķ���   ���������׶�   ���������Ӷ�   ���������Ӷ�   ����Ӷ��   ����   ����������Ķ   �������������������Ķ���   �������������������Ķ���   ��������������������Ķ��   �����������Ӷ���   ��������Ӷ��   ���������Ӷ�   ��������Ӷ��   �������׶���   �����������������Ķ�      HTML5      
   JavaScript        InFocus    3	  
	var fileData;
	var fileType;
	var fileName;
	var canceled;
	function upload_image() {
		canceled = true;
		var input = document.createElement('INPUT');
		input.setAttribute("type", "file");
		input.setAttribute("accept", "image/png, image/jpeg, image/webp");
		input.click();
		input.addEventListener('change', event => {
			if (event.target.files.length > 0){
				canceled = false;}
			var file = event.target.files[0];
			var reader = new FileReader();
			fileType = file.type;
			fileName = file.name;
			reader.readAsArrayBuffer(file);
			reader.onloadend = function (evt) {
				if (evt.target.readyState == FileReader.DONE) {
					fileData = evt.target.result;
				}
			}
		  });
	}
	function upload_palette() {
		canceled = true;
		var input = document.createElement('INPUT');
		input.setAttribute("type", "file");
		input.setAttribute("accept", "application/json, .gpl, .pal, image/png, image/jpeg, image/webp");
		input.click();
		input.addEventListener('change', event => {
			if (event.target.files.length > 0){
				canceled = false;}
			var file = event.target.files[0];
			var reader = new FileReader();
			fileType = file.type;
			fileName = file.name;
			if (fileType == "image/png" || fileType == "image/jpeg" || fileType == "image/webp"){
				reader.readAsArrayBuffer(file);
			}
			else {
				reader.readAsText(file);
			}
			reader.onloadend = function (evt) {
				if (evt.target.readyState == FileReader.DONE) {
					fileData = evt.target.result;
				}
			}
		  });
	}
	function upload_shader() {
		canceled = true;
		var input = document.createElement('INPUT');
		input.setAttribute("type", "file");
		input.setAttribute("accept", ".shader");
		input.click();
		input.addEventListener('change', event => {
			if (event.target.files.length > 0){
				canceled = false;}
			var file = event.target.files[0];
			var reader = new FileReader();
			fileType = file.type;
			fileName = file.name;
			reader.readAsText(file);
			reader.onloadend = function (evt) {
				if (evt.target.readyState == FileReader.DONE) {
					fileData = evt.target.result;
				}
			}
		  });
	}
	function download(fileName, byte, type) {
		var buffer = Uint8Array.from(byte);
		var blob = new Blob([buffer], { type: type});
		var link = document.createElement('a');
		link.href = window.URL.createObjectURL(blob);
		link.download = fileName;
		link.click();
	};
	             upload_image();       ?      timeout    	   canceled;      	   fileData;            �?   	   fileType;      	   fileName;      	   image/png      
   image/jpeg     
   image/webp        Invalid type:      4   An error occurred while trying to display the image.      loaded        export         download('%s', %s, 'image/png');                                                    	      
               ,      0      1      2      =      E      J      K      L      T      U      Z   h   ^   i   _   j   `   k   f   l   x   m   z   n   {   o   |   p   �   q   �   r   �   s   �   t   �   u   �   v   �   w   �   x   �   y   �   z   �   {   �   |   �   }   �   ~   �      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �     �   
  �     �     �     �   "  �   &  �   -  �   /  �   3  �   8  �   :  �   B  �   G  �   H  �   Y  �   k  �   m  �   n  �   z  �   �  �   3YYYYB�  YB�  YY;�  V�  YYY0�  PQX=V�  &�  T�  PQ�  T�  P�  QV�  �	  PQYYY0�
  P�  V�  QX=V�  &�  �  T�  V�  �  P�  QYYY0�	  PQX=V�  �  �  T�  P�  R�  QYYY0�  PQV�  &�  T�  PQ�  T�  P�  QV�  .Y�  �  �  T�  P�  R�  QY�  APR�  QY�  AP�  PQT�  P�  QR�  QY�  &�  T�  P�  R�  QV�  .Y�  �  ;�  �  *�  V�  �  �  T�  P�	  R�  Q�  &�  �
  V�  +�  AP�  PQT�  P�  QR�  QY�  ;�  �  T�  P�  R�  Q�  ;�  �  T�  P�  R�  QY�  ;�  �  T�  PQ�  ;�  �  /�  V�  �  V�  �  �  T�  P�  Q�  �  V�  �  �  T�  P�  Q�  �  V�  �  �  T�  P�  Q�  ;�  V�  �?  P�  �  Q�  .�  &�  V�  �?  P�  Q�  .�  �  �  T�  PQ�  �  P�  QYY0�  P�  V�  R�   V�  �  QX=V�  &�  T�  PQ�  T�  P�  QV�  .Y�  ;�!  �  P�  T�"  PQQ�  �  T�  P�  L�   R�>  P�!  QMR�  QY`              GDSC   k      �   y     ������ڶ   ����ڶ��   ����ڶ��   ������������Ӷ��   ����������������Ķ��   �������¶���   �����Ҷ�   ����������Ѷ   ���������Ѷ�   ���������޶�   ������Ӷ   �����������Ӷ���   ����   ����Ӆ�   ����Ӷ��   ����ӏ�   ������������׶��   ������������������ض   ��������   ���۶���   ����Ӷ��   �������ζ���   ������������Ķ��   ������������Ķ��   ������ζ   �����Ҷ�   �����Ҷ�   ����ζ��   ����ζ��   �����׶�   �����ׄ򶶶�   ���������������¶���   ����¶��   ��������������������ض��   �����������ζ���   �����������   ������Ҷ   ���������������   ���   ��������������������   �����϶�   ��������¶��   ���Ӷ���   �������Ŷ���   �����׶�   ��������Ӷ��   ��������Ҷ��   �������ض���   ������������������������ض��   ���������������������Ҷ�   �嶶   �������Ӷ���   ����������Ѷ   ����ƶ��   ��������   ��������Ŷ��   ���������Ӷ�   �����������Ӷ���   ��������Ӷ��   �������Ӷ���   ����Ӆ�   ����������������Ӷ��    ���������������������������Ҷ���   ���޶���   ����Ӷ��   �����Ķ�   �����Ҷ�   �����Ӷ�   ��������޶��   ���������¶�   ����������������   ���ݶ���   ׶��   Զ��   ն��   Ҷ��   Ӷ��   ж��   Ѷ��   ޶��   ߶��   ζ��   ϶��   �Ŷ�   �Ŷ�   ��������ڶ��   �Զ�   �޶�   �ж�   �ն�   �׶�   �޶�   �Ѷ�   �߶�   ��������ڶ��   �����ݶ�   ������������������������Ҷ��   ����Ŷ��   �����¶�   �������Ӷ���   �����Ӷ�   �������������������    ���������������������������Ҷ���   �������׶���   �������Ѷ���   ���������������������Ҷ�   ���������Ӷ�                   �?  �������?  �������?        �������?                   HTML5         loaded     
   idle_frame                                                                      &      0   	   :   
   D      E      K      S      T      Z      [      f      t            �      �      �      �      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %      &     '     (     )   -  *   .  +   4  ,   :  -   D  .   K  /   R  0   X  1   _  2   i  3   j  4   s  5   |  6   �  7   �  8   �  9   �  :   �  ;   �  <   �  =   �  >   �  ?   �  @   �  A   �  B   �  C   �  D   �  E   �  F   �  G   �  H      I     J     K     L     M   $  N   %  O   &  P   3  Q   N  R   T  S   Z  T   _  U   d  V   i  W   n  X   s  Y   x  Z   }  [   �  \   �  ]   �  ^   �  _   �  `   �  a   �  b   �  c   �  d   �  e   �  f   �  g      h     i     j   )  k   8  l   9  m   B  n   K  o   T  p   ]  q   f  r   o  s   x  t   �  u   �  v   �  w   �  x   �  y   �  z   �  {     |     }   2  ~   B     ]  �   w  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �     �     �     �     �   &  �   '  �   0  �   6  �   7  �   =  �   >  �   ?  �   F  �   L  �   Y  �   Z  �   [  �   a  �   h  �   j  �   w  �   3YY5;�  VW�  Y5;�  VW�  �  �  Y5;�  VW�  YY;�	  VY;�
  V�  T�  PQY;�  V�  T�  PQY;�  V�  T�  PQYY;�  V�  Y;�  V�  T�  YY;�  V�  YY5;�  V�  T�  PQY5;�  VW�  �  �  �  Y5;�  V�  T�  PQY5;�  V�  T�  PQY5;�  VW�  �  �  YY0�  P�   QV�  &�   4�!  V�  &�   T�"  �#  V�  �  �   T�$  �  '�   T�"  �%  V�  �  �5  P�  �  R�  R�  Q�  �  T�  �  �  T�&  �  '�   T�"  �'  V�  �  �5  P�  �  R�  R�  Q�  �  T�  �  �  T�&  �  YY0�(  PQV�  W�)  T�*  PQYY0�+  P�,  QV�  �  T�-  �  T�.  P�  QT�-  �  P�  R�  Q�  &�  V�  �  T�/  P�0  PQ�  Q�  Y�  �  �0  PQY0�1  PQV�  &�2  T�3  PQ�	  V�  W�4  T�5  PQ�  W�)  T�6  PQ�  �7  T�8  PQ�  AP�7  R�
  Q�  �  �7  T�9  T�:  PQ�  �  AP�;  PQR�  Q�  AP�;  PQR�  Q�  AP�;  PQR�  Q�  �<  P�  R�  Q�  �<  P�  R�  Q�  �
  T�=  P�  R�  Q�  �  T�
  �
  �  W�)  T�*  PQ�  W�4  T�*  PQYYY0�>  P�?  QV�  �  T�@  �  �  ;�A  V�  T�L  P�?  Q�  �  T�*  PQ�  W�4  T�5  PQ�  W�)  T�6  PQ�  AP�;  PQR�  Q�  AP�;  PQR�  Q�  AP�;  PQR�  Q�  �<  P�  R�  Q�  �<  P�  R�  Q�  �
  T�=  P�  R�  Q�  �  T�
  �
  �  W�)  T�*  PQ�  W�4  T�*  PQ�  YY0�<  P�B  V�  R�  V�  QV�  �B  T�C  P�  T�D  PQ�  R�  T�E  PQ�  R�  R�  T�F  Q�  �B  T�G  PQ�  �  T�G  PQ�  ;�H  V�  �  ;�I  V�  �  ;�J  V�  �  ;�K  V�  �  ;�L  V�  �  ;�M  V�  �  ;�N  V�  �  ;�O  V�  �  ;�P  V�  Y�  )�Q  �K  P�  R�  T�D  PQ�  QV�  )�R  �K  P�  R�  T�E  PQ�  QV�  ;�S  V�  �  �Q  �  ;�T  V�  �  �R  Y�  �H  �  T�U  P�Q  �  R�R  �  Q�  �I  �  T�U  P�Q  R�R  �  Q�  �J  �  T�U  P�Q  �  R�R  �  Q�  �K  �  T�U  P�Q  �  R�R  Q�  �L  �  T�U  P�Q  R�R  Q�  �M  �  T�U  P�Q  �  R�R  Q�  �N  �  T�U  P�Q  �  R�R  �  Q�  �O  �  T�U  P�Q  R�R  �  Q�  �P  �  T�U  P�Q  �  R�R  �  QY�  ;�V  V�  �K  �I  �  ;�W  V�  �K  �O  �  ;�X  V�  �M  �I  �  ;�Y  V�  �L  �J  �  ;�Z  V�  �L  �H  �  ;�[  V�  �M  �O  �  ;�\  V�  �L  �N  �  ;�]  V�  �L  �P  Y�  �B  T�^  P�S  �  R�T  �  R�K  &P�V  �W  �X  Q(�L  Q�  �B  T�^  P�S  R�T  �  R�I  &P�V  �W  �X  �Y  Q�  P�X  �V  �[  �Z  Q(�L  Q�  �B  T�^  P�S  �  R�T  �  R�M  &P�X  �V  �[  Q(�L  Q�  �B  T�^  P�S  �  R�T  R�K  &P�W  �[  �V  �Z  Q�  P�V  �W  �X  �\  Q(�L  Q�  �B  T�^  P�S  R�T  R�L  QS�  �B  T�^  P�S  �  R�T  R�M  &P�X  �V  �[  �]  Q�  P�[  �X  �W  �Y  Q(�L  Q�  �B  T�^  P�S  �  R�T  �  R�K  &P�W  �[  �V  Q(�L  Q�  �B  T�^  P�S  R�T  �  R�O  &P�[  �X  �W  �\  Q�  P�W  �[  �V  �]  Q(�L  Q�  �B  T�^  P�S  �  R�T  �  R�M  &P�[  �X  �W  Q(�L  QY�  �B  T�_  PQ�  �  T�_  PQ�  .�B  YYY0�`  P�@  QV�  �  &�  T�
  V�  .�  ;�a  V�  �  *�@  �  P�  R�a  QV�  �a  �  �  ;�b  V�  �  �  �  T�c  �  �  �  /�a  V�  �  V�  �b  �  T�:  PQ�  �  V�  �b  �  T�:  PQ�  �  V�  �b  �  T�:  PQY�  �b  T�d  P�@  �  T�D  PQR�@  �  T�E  PQR�  T�e  QY�  �
  T�=  P�b  R�  Q�  �  T�
  �
  �  �  �  T�c  �  YYY0�f  P�?  QV�  &�  T�
  V�  �  T�
  T�g  PQT�h  P�?  QYYY0�i  PQV�  &�  T�
  V�  .�  �7  T�j  P�  T�
  T�g  PQQY`         [gd_scene load_steps=5 format=2]

[ext_resource path="res://MinimalUI/MinimalUI.tres" type="Theme" id=1]
[ext_resource path="res://Main.gd" type="Script" id=2]

[sub_resource type="Shader" id=1]
code = "shader_type canvas_item;

uniform vec2 square_pixels = vec2(32);

void fragment(){
	vec2 rect_size = 1.0/SCREEN_PIXEL_SIZE;
	vec2 square_size = 0.5*rect_size/square_pixels;
	COLOR = 0.35*(abs(vec4(step(fract(SCREEN_UV.x*square_size.x),0.5))-
	vec4(step(fract(SCREEN_UV.y*square_size.y),0.5))));
}"

[sub_resource type="ShaderMaterial" id=2]
shader = SubResource( 1 )
shader_param/square_pixels = Vector2( 32, 32 )

[node name="Main" type="Control"]
anchor_right = 1.0
anchor_bottom = 1.0
mouse_filter = 2
theme = ExtResource( 1 )
script = ExtResource( 2 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="ColorRect2" type="ColorRect" parent="."]
material = SubResource( 2 )
anchor_right = 1.0
anchor_bottom = 1.0
mouse_filter = 2
__meta__ = {
"_edit_use_anchors_": false
}

[node name="ViewportContainer" type="ViewportContainer" parent="."]
anchor_right = 1.0
anchor_bottom = 1.0
mouse_filter = 2
input_pass_on_modal_close_click = false
stretch = true
__meta__ = {
"_edit_use_anchors_": false
}

[node name="Viewport" type="Viewport" parent="ViewportContainer"]
size = Vector2( 1024, 600 )
transparent_bg = true
handle_input_locally = false
render_target_update_mode = 3
gui_disable_input = true

[node name="Scaled" type="Sprite" parent="ViewportContainer/Viewport"]

[node name="Camera2D" type="Camera2D" parent="ViewportContainer/Viewport"]
current = true

[node name="Panel" type="Panel" parent="."]
anchor_left = 1.0
anchor_right = 1.0
margin_left = -210.0
margin_top = 10.0
margin_right = -10.0
margin_bottom = 10.0
grow_horizontal = 0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="VBoxContainer" type="VBoxContainer" parent="Panel"]
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = -90.0
margin_top = -53.5
margin_right = 90.0
margin_bottom = 53.5
grow_horizontal = 2
grow_vertical = 2
__meta__ = {
"_edit_use_anchors_": false
}

[node name="OpenButton" type="Button" parent="Panel/VBoxContainer"]
margin_right = 180.0
margin_bottom = 25.0
text = "Load Image"

[node name="HSeparator" type="HSeparator" parent="Panel/VBoxContainer"]
margin_top = 29.0
margin_right = 180.0
margin_bottom = 33.0

[node name="HBoxContainer" type="HBoxContainer" parent="Panel/VBoxContainer"]
margin_top = 37.0
margin_right = 180.0
margin_bottom = 70.0

[node name="Label" type="Label" parent="Panel/VBoxContainer/HBoxContainer"]
margin_top = 5.0
margin_right = 102.0
margin_bottom = 28.0
size_flags_horizontal = 3
text = "Factor:"

[node name="SpinBox" type="SpinBox" parent="Panel/VBoxContainer/HBoxContainer"]
margin_left = 106.0
margin_right = 180.0
margin_bottom = 33.0
min_value = 1.0
max_value = 9.0
value = 1.0

[node name="HSeparator2" type="HSeparator" parent="Panel/VBoxContainer"]
margin_top = 74.0
margin_right = 180.0
margin_bottom = 78.0

[node name="SaveButton" type="Button" parent="Panel/VBoxContainer"]
margin_top = 82.0
margin_right = 180.0
margin_bottom = 107.0
text = "Save"

[node name="FileDialog" type="FileDialog" parent="."]
visible = true
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = -332.0
margin_top = -184.0
margin_right = 332.0
margin_bottom = 184.0
window_title = "Open a File"
mode = 0
access = 2
filters = PoolStringArray( "*.png", "*.jpg", "*.jpeg", "*.bmp" )
current_dir = "/home/azagaya/GameDev/ScaleNX"
current_file = "icon.png"
current_path = "/home/azagaya/GameDev/ScaleNX/icon.png"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="SaveDialog" type="FileDialog" parent="."]
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = -332.0
margin_top = -184.0
margin_right = 332.0
margin_bottom = 184.0
access = 2
filters = PoolStringArray( "*.png", "*.jpg", "*.jpeg", "*.bmp" )
current_dir = "/home/azagaya/GameDev/ScaleNX"
current_file = "icon.png"
current_path = "/home/azagaya/GameDev/ScaleNX/icon.png"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="ColorRect" type="ColorRect" parent="."]
visible = false
anchor_right = 1.0
anchor_bottom = 1.0
mouse_filter = 2
color = Color( 0, 0, 0, 0.352941 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="PopupDialog" type="PopupDialog" parent="."]
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = -56.0
margin_top = -20.0
margin_right = 72.0
margin_bottom = 28.0

[node name="Label" type="Label" parent="PopupDialog"]
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = -47.5
margin_top = -11.5
margin_right = 47.5
margin_bottom = 11.5
text = "Calculating..."

[connection signal="pressed" from="Panel/VBoxContainer/OpenButton" to="." method="_on_OpenButton_pressed"]
[connection signal="value_changed" from="Panel/VBoxContainer/HBoxContainer/SpinBox" to="." method="_on_SpinBox_value_changed"]
[connection signal="pressed" from="Panel/VBoxContainer/SaveButton" to="." method="_on_SaveButton_pressed"]
[connection signal="file_selected" from="FileDialog" to="." method="_on_FileDialog_file_selected"]
[connection signal="file_selected" from="SaveDialog" to="." method="_on_SaveDialog_file_selected"]
         [gd_resource type="Theme" load_steps=52 format=2]

[ext_resource path="res://MinimalUI/OpenSans-Regular.ttf" type="DynamicFontData" id=1]
[ext_resource path="res://MinimalUI/icons.svg" type="Texture" id=2]

[sub_resource type="StyleBoxFlat" id=1]
content_margin_left = 5.0
content_margin_right = 5.0
content_margin_top = 1.0
content_margin_bottom = 1.0
bg_color = Color( 0, 0, 0, 1 )
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
border_color = Color( 0.282353, 0.282353, 0.282353, 1 )

[sub_resource type="StyleBoxFlat" id=2]
content_margin_left = 5.0
content_margin_right = 5.0
content_margin_top = 1.0
content_margin_bottom = 1.0
bg_color = Color( 1, 1, 1, 0 )
border_width_bottom = 1
border_color = Color( 0.282353, 0.282353, 0.282353, 1 )
expand_margin_bottom = 3.0

[sub_resource type="StyleBoxFlat" id=3]
content_margin_left = 5.0
content_margin_right = 5.0
content_margin_top = 1.0
content_margin_bottom = 1.0
bg_color = Color( 0, 0, 0, 1 )
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
border_color = Color( 1, 1, 1, 1 )

[sub_resource type="StyleBoxFlat" id=4]
content_margin_left = 5.0
content_margin_right = 5.0
content_margin_top = 1.0
content_margin_bottom = 1.0
bg_color = Color( 0.129412, 0.129412, 0.129412, 1 )
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
border_color = Color( 1, 1, 1, 1 )

[sub_resource type="AtlasTexture" id=5]
atlas = ExtResource( 2 )
region = Rect2( 37, 111, 18, 18 )

[sub_resource type="AtlasTexture" id=6]
atlas = ExtResource( 2 )
region = Rect2( 85, 111, 18, 18 )

[sub_resource type="AtlasTexture" id=7]
atlas = ExtResource( 2 )
region = Rect2( 61, 111, 18, 18 )

[sub_resource type="AtlasTexture" id=8]
atlas = ExtResource( 2 )
region = Rect2( 13, 111, 18, 18 )

[sub_resource type="StyleBoxEmpty" id=9]

[sub_resource type="AtlasTexture" id=10]
atlas = ExtResource( 2 )
region = Rect2( 13, 79, 34, 19 )

[sub_resource type="AtlasTexture" id=11]
atlas = ExtResource( 2 )
region = Rect2( 93, 79, 34, 19 )

[sub_resource type="AtlasTexture" id=12]
atlas = ExtResource( 2 )
region = Rect2( 53, 79, 34, 19 )

[sub_resource type="AtlasTexture" id=13]
atlas = ExtResource( 2 )
region = Rect2( 133, 79, 34, 19 )

[sub_resource type="StyleBoxEmpty" id=14]

[sub_resource type="StyleBoxFlat" id=15]
bg_color = Color( 0.129412, 0.129412, 0.129412, 1 )

[sub_resource type="StyleBoxFlat" id=16]
bg_color = Color( 0.129412, 0.129412, 0.129412, 1 )
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
border_color = Color( 1, 1, 1, 1 )

[sub_resource type="StyleBoxFlat" id=17]
bg_color = Color( 0.282353, 0.282353, 0.282353, 1 )
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
border_color = Color( 1, 1, 1, 1 )

[sub_resource type="StyleBoxFlat" id=18]
content_margin_top = 7.0
content_margin_bottom = 7.0
bg_color = Color( 0, 0, 0, 1 )
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
border_color = Color( 0.129412, 0.129412, 0.129412, 1 )

[sub_resource type="StyleBoxFlat" id=19]
content_margin_top = 7.0
content_margin_bottom = 7.0
bg_color = Color( 0, 0, 0, 1 )
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
border_color = Color( 0.282353, 0.282353, 0.282353, 1 )

[sub_resource type="StyleBoxLine" id=20]
color = Color( 0.282353, 0.282353, 0.282353, 1 )

[sub_resource type="AtlasTexture" id=21]
atlas = ExtResource( 2 )
region = Rect2( 80, 10, 12, 28 )

[sub_resource type="AtlasTexture" id=22]
atlas = ExtResource( 2 )
region = Rect2( 112, 10, 12, 28 )

[sub_resource type="AtlasTexture" id=23]
atlas = ExtResource( 2 )
region = Rect2( 144, 10, 12, 28 )

[sub_resource type="StyleBoxFlat" id=24]
bg_color = Color( 0.282353, 0.282353, 0.282353, 1 )
corner_radius_top_left = 2
corner_radius_bottom_left = 2
expand_margin_top = 2.0
expand_margin_bottom = 2.0

[sub_resource type="StyleBoxFlat" id=25]
bg_color = Color( 1, 1, 1, 1 )
corner_radius_top_left = 2
corner_radius_bottom_left = 2
expand_margin_top = 2.0
expand_margin_bottom = 2.0

[sub_resource type="StyleBoxFlat" id=26]
bg_color = Color( 0.129412, 0.129412, 0.129412, 1 )
corner_radius_top_left = 2
corner_radius_top_right = 2
corner_radius_bottom_right = 2
corner_radius_bottom_left = 2
expand_margin_top = 2.0
expand_margin_bottom = 2.0

[sub_resource type="StyleBoxFlat" id=27]
bg_color = Color( 0.129412, 0.129412, 0.129412, 0 )
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
border_color = Color( 1, 1, 1, 1 )

[sub_resource type="StyleBoxFlat" id=28]
content_margin_left = 5.0
content_margin_right = 5.0
content_margin_top = 5.0
content_margin_bottom = 5.0
bg_color = Color( 0, 0, 0, 1 )
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
border_color = Color( 0.282353, 0.282353, 0.282353, 1 )

[sub_resource type="StyleBoxFlat" id=29]
content_margin_left = 5.0
content_margin_right = 5.0
content_margin_top = 5.0
content_margin_bottom = 5.0
bg_color = Color( 0.129412, 0.129412, 0.129412, 1 )
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
border_color = Color( 0.282353, 0.282353, 0.282353, 1 )

[sub_resource type="StyleBoxFlat" id=30]
bg_color = Color( 0.282353, 0.282353, 0.282353, 1 )

[sub_resource type="StyleBoxLine" id=31]
color = Color( 0.282353, 0.282353, 0.282353, 1 )

[sub_resource type="StyleBoxFlat" id=32]
content_margin_left = 7.0
content_margin_right = 7.0
content_margin_top = 7.0
content_margin_bottom = 7.0
bg_color = Color( 0, 0, 0, 1 )
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
border_color = Color( 0.282353, 0.282353, 0.282353, 1 )

[sub_resource type="StyleBoxFlat" id=33]
bg_color = Color( 0.129412, 0.129412, 0.129412, 1 )
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
border_color = Color( 0.282353, 0.282353, 0.282353, 1 )

[sub_resource type="StyleBoxFlat" id=34]
bg_color = Color( 0, 0, 0, 1 )
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
expand_margin_left = 2.0
expand_margin_right = 2.0
expand_margin_top = 2.0
expand_margin_bottom = 2.0

[sub_resource type="StyleBoxFlat" id=35]
content_margin_left = 5.0
content_margin_right = 5.0
content_margin_top = 5.0
content_margin_bottom = 2.0
bg_color = Color( 0.282353, 0.282353, 0.282353, 1 )

[sub_resource type="StyleBoxFlat" id=36]
content_margin_left = 10.0
content_margin_right = 10.0
bg_color = Color( 0, 0, 0, 1 )
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
border_color = Color( 0.129412, 0.129412, 0.129412, 1 )

[sub_resource type="StyleBoxFlat" id=37]
content_margin_left = 10.0
content_margin_right = 10.0
content_margin_top = 0.0
bg_color = Color( 0, 0, 0, 1 )
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_color = Color( 0.282353, 0.282353, 0.282353, 1 )
expand_margin_top = 2.0
expand_margin_bottom = 1.0

[sub_resource type="StyleBoxFlat" id=38]
content_margin_left = 5.0
content_margin_right = 5.0
content_margin_top = 5.0
content_margin_bottom = 5.0
bg_color = Color( 0, 0, 0, 1 )
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
border_color = Color( 0.282353, 0.282353, 0.282353, 1 )

[sub_resource type="StyleBoxFlat" id=39]
content_margin_left = 5.0
content_margin_right = 5.0
content_margin_top = 5.0
content_margin_bottom = 5.0
bg_color = Color( 0.282353, 0.282353, 0.282353, 1 )

[sub_resource type="StyleBoxFlat" id=40]
content_margin_left = 7.0
content_margin_right = 7.0
bg_color = Color( 0, 0, 0, 1 )
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
border_color = Color( 0.129412, 0.129412, 0.129412, 1 )

[sub_resource type="StyleBoxFlat" id=41]
content_margin_left = 7.0
content_margin_right = 7.0
bg_color = Color( 0, 0, 0, 1 )
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
border_color = Color( 0.282353, 0.282353, 0.282353, 1 )

[sub_resource type="StyleBoxLine" id=42]
color = Color( 0.282353, 0.282353, 0.282353, 1 )
vertical = true

[sub_resource type="AtlasTexture" id=43]
atlas = ExtResource( 2 )
region = Rect2( 74, 52, 24, 10 )

[sub_resource type="AtlasTexture" id=44]
atlas = ExtResource( 2 )
region = Rect2( 106, 52, 24, 8 )

[sub_resource type="AtlasTexture" id=45]
atlas = ExtResource( 2 )
region = Rect2( 138, 52, 24, 8 )

[sub_resource type="StyleBoxFlat" id=46]
content_margin_left = 2.0
content_margin_right = 2.0
content_margin_top = 0.0
content_margin_bottom = 0.0
bg_color = Color( 0.282353, 0.282353, 0.282353, 1 )
corner_radius_top_left = 2
corner_radius_bottom_right = 2
corner_radius_bottom_left = 2

[sub_resource type="StyleBoxFlat" id=47]
content_margin_left = 2.0
content_margin_right = 2.0
content_margin_top = 0.0
content_margin_bottom = 0.0
bg_color = Color( 1, 1, 1, 1 )
corner_radius_top_left = 2
corner_radius_bottom_right = 2
corner_radius_bottom_left = 2

[sub_resource type="StyleBoxFlat" id=48]
content_margin_left = 2.0
content_margin_right = 2.0
content_margin_top = 0.0
content_margin_bottom = 0.0
bg_color = Color( 0.129412, 0.129412, 0.129412, 1 )
corner_radius_top_left = 2
corner_radius_bottom_right = 2
corner_radius_bottom_left = 2

[sub_resource type="DynamicFont" id=49]
font_data = ExtResource( 1 )

[resource]
default_font = SubResource( 49 )
Button/colors/font_color = Color( 1, 1, 1, 1 )
Button/colors/font_color_disabled = Color( 0.9, 0.9, 0.9, 0.2 )
Button/colors/font_color_hover = Color( 0.94, 0.94, 0.94, 1 )
Button/colors/font_color_pressed = Color( 1, 1, 1, 1 )
Button/constants/hseparation = 2
Button/fonts/font = null
Button/styles/disabled = SubResource( 1 )
Button/styles/focus = SubResource( 2 )
Button/styles/hover = SubResource( 3 )
Button/styles/normal = SubResource( 1 )
Button/styles/pressed = SubResource( 4 )
CheckBox/colors/font_color = Color( 0.88, 0.88, 0.88, 1 )
CheckBox/colors/font_color_disabled = Color( 0.9, 0.9, 0.9, 0.2 )
CheckBox/colors/font_color_hover = Color( 0.94, 0.94, 0.94, 1 )
CheckBox/colors/font_color_hover_pressed = Color( 1, 1, 1, 1 )
CheckBox/colors/font_color_pressed = Color( 1, 1, 1, 1 )
CheckBox/constants/check_vadjust = 0
CheckBox/constants/hseparation = 4
CheckBox/fonts/font = null
CheckBox/icons/checked = SubResource( 5 )
CheckBox/icons/radio_checked = SubResource( 6 )
CheckBox/icons/radio_unchecked = SubResource( 7 )
CheckBox/icons/unchecked = SubResource( 8 )
CheckBox/styles/disabled = SubResource( 9 )
CheckBox/styles/focus = null
CheckBox/styles/hover = SubResource( 9 )
CheckBox/styles/hover_pressed = SubResource( 9 )
CheckBox/styles/normal = SubResource( 9 )
CheckBox/styles/pressed = SubResource( 9 )
CheckButton/colors/font_color = Color( 0.88, 0.88, 0.88, 1 )
CheckButton/colors/font_color_disabled = Color( 0.9, 0.9, 0.9, 0.2 )
CheckButton/colors/font_color_hover = Color( 0.94, 0.94, 0.94, 1 )
CheckButton/colors/font_color_hover_pressed = Color( 1, 1, 1, 1 )
CheckButton/colors/font_color_pressed = Color( 1, 1, 1, 1 )
CheckButton/constants/check_vadjust = 0
CheckButton/constants/hseparation = 4
CheckButton/fonts/font = null
CheckButton/icons/off = SubResource( 10 )
CheckButton/icons/off_disabled = SubResource( 11 )
CheckButton/icons/on = SubResource( 12 )
CheckButton/icons/on_disabled = SubResource( 13 )
CheckButton/styles/disabled = SubResource( 14 )
CheckButton/styles/focus = null
CheckButton/styles/hover = SubResource( 14 )
CheckButton/styles/hover_pressed = SubResource( 14 )
CheckButton/styles/normal = SubResource( 14 )
CheckButton/styles/pressed = SubResource( 14 )
Dialogs/constants/button_margin = 32
Dialogs/constants/margin = 8
FileDialog/colors/file_icon_modulate = Color( 1, 1, 1, 1 )
FileDialog/colors/files_disabled = Color( 0, 0, 0, 0.7 )
FileDialog/colors/folder_icon_modulate = Color( 1, 1, 1, 1 )
FileDialog/icons/file = null
FileDialog/icons/folder = null
FileDialog/icons/parent_folder = null
FileDialog/icons/reload = null
FileDialog/icons/toggle_hidden = null
HScrollBar/icons/decrement = null
HScrollBar/icons/decrement_highlight = null
HScrollBar/icons/increment = null
HScrollBar/icons/increment_highlight = null
HScrollBar/styles/grabber = SubResource( 15 )
HScrollBar/styles/grabber_highlight = SubResource( 16 )
HScrollBar/styles/grabber_pressed = SubResource( 17 )
HScrollBar/styles/scroll = SubResource( 18 )
HScrollBar/styles/scroll_focus = SubResource( 19 )
HSeparator/constants/separation = 4
HSeparator/styles/separator = SubResource( 20 )
HSlider/icons/grabber = SubResource( 21 )
HSlider/icons/grabber_disabled = SubResource( 22 )
HSlider/icons/grabber_highlight = SubResource( 23 )
HSlider/icons/tick = null
HSlider/styles/grabber_area = SubResource( 24 )
HSlider/styles/grabber_area_highlight = SubResource( 25 )
HSlider/styles/slider = SubResource( 26 )
LineEdit/colors/clear_button_color = Color( 0.88, 0.88, 0.88, 1 )
LineEdit/colors/clear_button_color_pressed = Color( 1, 1, 1, 1 )
LineEdit/colors/cursor_color = Color( 0.94, 0.94, 0.94, 1 )
LineEdit/colors/font_color = Color( 0.88, 0.88, 0.88, 1 )
LineEdit/colors/font_color_selected = Color( 1, 1, 1, 1 )
LineEdit/colors/font_color_uneditable = Color( 0.88, 0.88, 0.88, 0.5 )
LineEdit/colors/selection_color = Color( 0.282353, 0.282353, 0.282353, 1 )
LineEdit/constants/minimum_spaces = 12
LineEdit/fonts/font = null
LineEdit/icons/clear = null
LineEdit/styles/focus = SubResource( 27 )
LineEdit/styles/normal = SubResource( 28 )
LineEdit/styles/read_only = SubResource( 29 )
Panel/styles/panel = SubResource( 1 )
PopupDialog/styles/panel = SubResource( 1 )
PopupMenu/colors/font_color = Color( 0.88, 0.88, 0.88, 1 )
PopupMenu/colors/font_color_accel = Color( 0.7, 0.7, 0.7, 0.8 )
PopupMenu/colors/font_color_disabled = Color( 0.4, 0.4, 0.4, 0.8 )
PopupMenu/colors/font_color_hover = Color( 0.88, 0.88, 0.88, 1 )
PopupMenu/colors/font_color_separator = Color( 0.88, 0.88, 0.88, 1 )
PopupMenu/constants/hseparation = 4
PopupMenu/constants/vseparation = 4
PopupMenu/fonts/font = null
PopupMenu/icons/checked = SubResource( 5 )
PopupMenu/icons/radio_checked = SubResource( 6 )
PopupMenu/icons/radio_unchecked = SubResource( 7 )
PopupMenu/icons/submenu = null
PopupMenu/icons/unchecked = SubResource( 8 )
PopupMenu/styles/hover = SubResource( 30 )
PopupMenu/styles/labeled_separator_left = SubResource( 31 )
PopupMenu/styles/labeled_separator_right = SubResource( 31 )
PopupMenu/styles/panel = SubResource( 32 )
PopupMenu/styles/panel_disabled = SubResource( 33 )
PopupMenu/styles/separator = SubResource( 31 )
PopupPanel/styles/panel = SubResource( 1 )
ProgressBar/colors/font_color = Color( 0.94, 0.94, 0.94, 1 )
ProgressBar/colors/font_color_shadow = Color( 0, 0, 0, 1 )
ProgressBar/fonts/font = null
ProgressBar/styles/bg = SubResource( 34 )
ProgressBar/styles/fg = SubResource( 35 )
TabContainer/colors/font_color_bg = Color( 0.69, 0.69, 0.69, 1 )
TabContainer/colors/font_color_disabled = Color( 0.9, 0.9, 0.9, 0.2 )
TabContainer/colors/font_color_fg = Color( 0.94, 0.94, 0.94, 1 )
TabContainer/constants/hseparation = 4
TabContainer/constants/label_valign_bg = 2
TabContainer/constants/label_valign_fg = 0
TabContainer/constants/side_margin = 8
TabContainer/constants/top_margin = 24
TabContainer/fonts/font = null
TabContainer/icons/decrement = null
TabContainer/icons/decrement_highlight = null
TabContainer/icons/increment = null
TabContainer/icons/increment_highlight = null
TabContainer/icons/menu = null
TabContainer/icons/menu_highlight = null
TabContainer/styles/panel = SubResource( 1 )
TabContainer/styles/tab_bg = SubResource( 36 )
TabContainer/styles/tab_disabled = SubResource( 36 )
TabContainer/styles/tab_fg = SubResource( 37 )
TextEdit/colors/background_color = Color( 0, 0, 0, 0 )
TextEdit/colors/bookmark_color = Color( 0.08, 0.49, 0.98, 1 )
TextEdit/colors/brace_mismatch_color = Color( 1, 0.2, 0.2, 1 )
TextEdit/colors/breakpoint_color = Color( 0.8, 0.8, 0.4, 0.2 )
TextEdit/colors/caret_background_color = Color( 0, 0, 0, 1 )
TextEdit/colors/caret_color = Color( 0.88, 0.88, 0.88, 1 )
TextEdit/colors/code_folding_color = Color( 0.8, 0.8, 0.8, 0.8 )
TextEdit/colors/completion_background_color = Color( 0.17, 0.16, 0.2, 1 )
TextEdit/colors/completion_existing_color = Color( 0.87, 0.87, 0.87, 0.13 )
TextEdit/colors/completion_font_color = Color( 0.67, 0.67, 0.67, 1 )
TextEdit/colors/completion_scroll_color = Color( 1, 1, 1, 1 )
TextEdit/colors/completion_selected_color = Color( 0.26, 0.26, 0.27, 1 )
TextEdit/colors/current_line_color = Color( 0.25, 0.25, 0.26, 0.8 )
TextEdit/colors/executing_line_color = Color( 0.2, 0.8, 0.2, 0.4 )
TextEdit/colors/font_color = Color( 0.88, 0.88, 0.88, 1 )
TextEdit/colors/font_color_readonly = Color( 0.88, 0.88, 0.88, 0.5 )
TextEdit/colors/font_color_selected = Color( 0, 0, 0, 1 )
TextEdit/colors/function_color = Color( 0.4, 0.64, 0.81, 1 )
TextEdit/colors/line_number_color = Color( 0.67, 0.67, 0.67, 0.4 )
TextEdit/colors/mark_color = Color( 1, 0.4, 0.4, 0.4 )
TextEdit/colors/member_variable_color = Color( 0.9, 0.31, 0.35, 1 )
TextEdit/colors/number_color = Color( 0.92, 0.58, 0.2, 1 )
TextEdit/colors/safe_line_number_color = Color( 0.67, 0.78, 0.67, 0.6 )
TextEdit/colors/selection_color = Color( 0.282353, 0.282353, 0.282353, 1 )
TextEdit/colors/symbol_color = Color( 0.94, 0.94, 0.94, 1 )
TextEdit/colors/word_highlighted_color = Color( 0.8, 0.9, 0.9, 0.15 )
TextEdit/constants/completion_lines = 7
TextEdit/constants/completion_max_width = 50
TextEdit/constants/completion_scroll_width = 3
TextEdit/constants/line_spacing = 4
TextEdit/fonts/font = null
TextEdit/icons/fold = null
TextEdit/icons/folded = null
TextEdit/icons/space = null
TextEdit/icons/tab = null
TextEdit/styles/completion = null
TextEdit/styles/focus = SubResource( 27 )
TextEdit/styles/normal = SubResource( 38 )
TextEdit/styles/read_only = SubResource( 29 )
Tree/colors/custom_button_font_highlight = Color( 0.94, 0.94, 0.94, 1 )
Tree/colors/drop_position_color = Color( 1, 0.3, 0.2, 1 )
Tree/colors/font_color = Color( 0.69, 0.69, 0.69, 1 )
Tree/colors/font_color_selected = Color( 1, 1, 1, 1 )
Tree/colors/guide_color = Color( 0, 0, 0, 0.1 )
Tree/colors/relationship_line_color = Color( 0.27, 0.27, 0.27, 1 )
Tree/colors/title_button_color = Color( 0.88, 0.88, 0.88, 1 )
Tree/constants/button_margin = 4
Tree/constants/draw_guides = 1
Tree/constants/draw_relationship_lines = 0
Tree/constants/hseparation = 4
Tree/constants/item_margin = 12
Tree/constants/scroll_border = 4
Tree/constants/scroll_speed = 12
Tree/constants/vseparation = 4
Tree/fonts/font = null
Tree/fonts/title_button_font = null
Tree/icons/arrow = null
Tree/icons/arrow_collapsed = null
Tree/icons/checked = SubResource( 5 )
Tree/icons/select_arrow = null
Tree/icons/unchecked = SubResource( 8 )
Tree/icons/updown = null
Tree/styles/bg = SubResource( 1 )
Tree/styles/bg_focus = null
Tree/styles/button_pressed = null
Tree/styles/cursor = null
Tree/styles/cursor_unfocused = null
Tree/styles/custom_button = null
Tree/styles/custom_button_hover = null
Tree/styles/custom_button_pressed = null
Tree/styles/selected = SubResource( 39 )
Tree/styles/selected_focus = SubResource( 39 )
Tree/styles/title_button_hover = null
Tree/styles/title_button_normal = null
Tree/styles/title_button_pressed = null
VScrollBar/icons/decrement = null
VScrollBar/icons/decrement_highlight = null
VScrollBar/icons/increment = null
VScrollBar/icons/increment_highlight = null
VScrollBar/styles/grabber = SubResource( 15 )
VScrollBar/styles/grabber_highlight = SubResource( 16 )
VScrollBar/styles/grabber_pressed = SubResource( 17 )
VScrollBar/styles/scroll = SubResource( 40 )
VScrollBar/styles/scroll_focus = SubResource( 41 )
VSeparator/constants/separation = 4
VSeparator/styles/separator = SubResource( 42 )
VSlider/icons/grabber = SubResource( 43 )
VSlider/icons/grabber_disabled = SubResource( 44 )
VSlider/icons/grabber_highlight = SubResource( 45 )
VSlider/icons/tick = null
VSlider/styles/grabber_area = SubResource( 46 )
VSlider/styles/grabber_area_highlight = SubResource( 47 )
VSlider/styles/slider = SubResource( 48 )
WindowDialog/colors/title_color = Color( 0, 0, 0, 1 )
WindowDialog/constants/close_h_ofs = 18
WindowDialog/constants/close_v_ofs = 18
WindowDialog/constants/scaleborder_size = 4
WindowDialog/constants/title_height = 20
WindowDialog/fonts/title_font = null
WindowDialog/icons/close = null
WindowDialog/icons/close_highlight = null
WindowDialog/styles/panel = SubResource( 1 )
                GDEF|� wt   .GPOS   w�   GSUB�)� w�  �OS/2�6�� G@   `cmap���� G�  �cvt M� S�   �fpgm~a� K(  �gasp  # wd   glyft8�K   /�head�cp 8H   6hhea�	s G   $hmtx�5<� 8�  �loca)�� 0�  VmaxpC
 0�    name[�� T�  �post�	o X`  prepC��� R�  	  �  
�   �  /2/3/3/310!!7!!�I��hy����Jh�  �����   +@		OY ??+ 9/933310#3432#"&Fi3��x:?@94D�#���FB@G?   ����   @ 	 ?3�2993310#!#?(i)+)h)�����   3  ��   �@U		
 
!
 !NY NYOO
 /3?399//]]33+ 3333+ 339939939939223910!!#!#!5!!5!3!3!!!�B��T�T��R�P��D��+R�R1T�T��/B�������R��R��T��L��L��T  ���   & - f@5'%*!  	./%MY$*LY*+MY* //99//92+ 33+ 33+ 3933333333310#5"&'53&&546753&'4&'6̷�p�CS�Yͥ˧���4����J�Y����Zocf�����#�%/�A������E�;�N2_{eHY,�{L\)�]   h��-� 	  ! - 1 E@$ 
("".(
023+++010% ?3?3??99//33933331032#"#"&5463232654&#"#"&54632#�JS��SJʙ��������JTTPPTTJ˙����������Փ+��TR����������۫�������������� �J�   q����   5 Q@0 #*+.+-#&	673IY3'-0/&** / 	JY  ?+ ?9/99?+93333106654&#"27%467.546326673#'#"&�HW�egVYo���Ko\,�����U=$į�����8C�D�+�v�����E}XKSMa`����DYfAu����f_bj9����k�]�y>�c���ݲj\�   ��?�  �  ?�9310#?(i)���   R��!�  @ 
 ' ??99331073#&R����������1	ή��2���6���   =���  @
 
 
' ??993310#654'3����������1���:���������1  V  0@
		

  ?�29333910%'%7�+������������+�uo���^j��^F�o�   h �)�  (@ 	PY  /]3+ 3933310!!#!5!3���d��f����V���  ?��m �  � 	
  /�9910%#67^b5}A�d��rh2\  T�?q  �   /399105!T�٘�  ���� �  @  	OY	 ?+931074632#"&�=9:AB93CjCEECAF?     ��  �  ??9910#��ߦ!��J�  f��-�   (@  	KY	KY ?+ ?+993310#"3232#"-���������ᖤ�����������r~r�~������';;%��  �  �� 
 $@	 		 ??9/9993310!#47'3ˢ4�X���t.�r+  d  %�  +@ 
KYLY ?+ ?+93310!!5>54&#"'632!%�?��p8�~[�dX�������������Su�<Oq�Ӳ������   ^��� ' C@$  "()KY
%%KY%
KY
 ?+ ?+ 9/+ 993310!"&'53 !#532654&#"'6632������t�[_�`{�^���ȓ~`�mTZ���^������#,�/1)
���kz4FpGQ�   +  j� 
  <@	 LY	 ??9/93+ 393333310##!533!47#jٟ�9�����
0*�7P��P���)援`?�v  ����  :@ KY  LYKY ?+ ?+ 9/+933102 #"'53265!"'!!6-�	�����F�e����_�V7���%s}�����O�-3��27���I   u��/�  $ D@#!!  &%MYKYMY ?+ ?+ 9/9+ 3933310 !2&#"3632#" 2654&#"uOHqAMc��n��������뎝��Z�YP�q������Ƭ�����Uȳ���J�Fg�h  ^  +�  @ LY  ??+9310!!5!^���������  h��)�  " . M@)&,		/0) ) KY)) MY #MY  ?+ ?+ 9/+ 9993333102#"&54%&&54632654&'"6654&H�ꆓ������2�x�w������:}�v��w�˺�l�IU�{��ͼ��N�p����x��za�G@�gxd\�B<�\ew   j��%�  % A@""

  &'MYKYMY ?+ ?+ 9/9+933310!"'532##"&5432"326654&&%�htDPf��7�r���Е�x�����[�XR�F���)3SW������0����J�Fi�f   ����d   (@  OY	OY	 ?+ ?+93331074632#"&432#"&�=9:AB93Cv{B93CjCEECAF?���AF?  ?���d   "@		OY  /�?+933310%#67432#"&^b5}Aw{B9:=�d��rh2\AFF   h �)�  @	   //910%5)�?�����bߕ����   w��   *@  	PY PY /]+ /+9933105!5!w��^�Z���g��   h �)�  @	  //9105h����?�Fu��!b�Z   ��9�  & 9@!  '(  $$OY$
IY ?+ ?+ 9/93331054676654&#"'632432#"&!Hb�G�{O�a;�ο�'L~eA�x:?@94D�6u�TstRfo%1�c��IocnVr_!�׈FB@G?  y�F�� 5 ? E@"#.6;  ).@A88=+2&+ /3?399//9233393333310#"&'##"&5463232654$#" !27#  $!232&#"�X�hVv(�f����D�E�[r�������B/�������o�� �O�����HU��َ�hQWbͰ���*�׬����������V�T�f�ߵ�����9�     �   9@  IY  ?3?9/9+9933910!!#3&'`�����B�?�e�!#)���/��Dj�V}`s�;  �  ��     I@&

!"JY JY JY  ?+ ?+ 9/+ 99333310! #!!2654&##!2654&#��#��M����������1���������
9����Dq�{m���݉���   }����  &@	 IYIY ?+ ?+9310"  327#  4$32&;�����Ę������?��H�3��������7�9�i�T�T�N   �  X�   (@	  JYJY ?+ ?+993310 !!!   !#3  X�w���k�Uz�������02����������"�p+   �  ��  :@

 	IYIY
IY ?+ ?+ 9/+93310!!!!!!!���/�{^������)���  �  �� 	 2@  
	IYIY ??+ 9/+93310!#!!!!s�/�{^������   }��=�  :@ IY  IYIY ?+ ?+ 9/+93310!#  4$32&#   !27!L�t������X���BƷ����!������9%&�d�W�V�T��������#�  �  �  3@	  IY
 ?3?39/+99333310!#!#3!3��������P���n   T  V�  7@
  	JY
JY ?+ 3?+ 3933310!!57'5!V������b#�%bb%�V# �`�h�  @	 IY " ?+ ?9310"'532653^6GMcg����xq��X��   �  ��  *@
 	 ?3?39993310!##33���뙪�����ň����+���  �  ��  @   IY  ?+ ?9931033!ɪ����  �  q�  2@
  ?33?3999333310!##!33#47#P�� ��������^��J��J�����  �  ?�  .@	   ?3?39999333310!###33&73?�������ش����:%?G   }����   (@  	IY	IY ?+ ?+993310 !   !  32#"���������`D;b�s������������n�he��p������2*'1��  �  h� 	  4@
  
JY

JY ??+ 9/+9933310!##! 32654&##h���欪{$���ʾɾ����������   }����   4@
  
IYIY ?�+ ?+ 993310#   !  32#"���\���7����`D;b�s�������������B��J�he��p������2*'1��  �  ��   H@%	

		  JYIY ?3?+ 9/+ 993333310#! #%32654&##s����������鴨���`�������f�o`�����  j��� $ 4@  %&IY	IY ?+ ?+ 9993310# '532654&&'&&54632&#"������Z�h��=��̯��ڷ5����8������C�&,�sLaR4Iȡ��P�LtgLaQ1R�     Z�  $@ 	IY ??+ 39310!#!5!!���1H�1��   ����  %@
IY ?+ ?3993310 !  533265�������ߪ�¹���N��� ���F��Ÿ�     �� 
 @  ??3999103#367������P:"$:��J��N����    L�  $@
	
	 ?3?339939910!#&&'#3673673Ũ��40���{��05�0!5��A����3��y����y��Î��     ��  #@
 	 ?3?399910!##33���w�p���;�kn��;��}����C�L      {�   @	
  ??3993103#3=������������/�  R  ?� 	 +@ 
IYIY ?+ ?+93310!!5!5!!?����������i  ���o�   @  	' ?3?3993310!!!!o�7���!�����!     ��  � ??9910#�#�����J�   3����   @  	 ' ?3?3993310!!5!!3!����7�ߍ�   1'#�  @	   //3999103#1�cݘ����'��f�� ������H  �  /33310!5!��b��Ń ��! 	 � 
� /�9910#&&'53nA�(� r,�4�?E�5  ^���Z  $ G@%"%&GY FYFY  ??+ ?+ 9/9+ 3933310!'##"&5%754&#"'6632%2655R!R�z���oz��3Q�aĽ����Ưm�gI��LD�{T,2���u��cmsZ^  ���u   D@"
 ! 
 FY FY  ?+ ?+ 993??993333102#"&'##336"32654&�����k�<#w�t̪������Z��������OR���e����������   s���\  &@	FY FY  ?+ ?+9310"  32&&# 327f���	�O�-37�2������n%,"��V��;�9  s��7   B@!  !  		FY	FY ?+ ?+ 993??99333310%##"323''3#%26554&#"�	s������w�������������&,�OM���w��#������  s��\   ;@

FY FY FY  ?+ ?+ 9/+933310"  32!327"!4&�����������X����=�(	8���i��J�&!嬘��       9@
FY
 FY ??3+ 3?+993333910!##575!2&#"!�����aWu+`D^Z��9�K<=�#�}�G   '�1\ * 7 A n@>+8%=1*"%
BC55FY;GY
"***GY*(?GY(.GY ?+ ?+ ?+ 99//99++ 993333310#"'332!"&5467&&5467&&5463232654&##"3254#"1�,��1+jJZ²�������t*9@EUk��VE�����n��q~Z�t��u~Hi#qG��8U-+������d�P5<Z*#�l��� Y\}kYEl<sv��~  �  D  3@	 		FY
  	 ?3??+ 999333310!4&#"#336632�z�����
1�t��ņ������)U8O[���5   �  f�   #@
  HY ??�+933310!#34632#"&V���8*(::(*8H)9568877  ���f�   ,@HY@	 FY  ?+ ?�+933310"'5326534632#"&+_;ECNI��8*(::(*8��UW����]9568877  �    6@

   ??39/93?9933310673##3T+Xb��D���}}��1=cw�-��l�f��7s  �  V  @	   ??9310!#3V��  �  �\ # F@#	 #	#$%FY	  ?33??3+ 39/339333310!4&#"#4&#"#33663 36632%pv���pw����/�jO1�w��Ƀ�����Ƀ�����H�PZ�Vd���5   �  D\  1@ 			FY
 	 ?3??+ 99933310!4&#"#336632�z�����3�q��ņ�����H�QY���5  s��b\   (@  
FY
FY ?+ ?+993310 #"&5 32 32654&#"b����|������������%���ӊ�+�����������  ��u\  ! ?@ "# FY	 FY  ?+ ???+ 99993333310"&'##336632"32654&�k�<��@�n��������OR`V�=4�ZP����������%������  s�7\   D@"
 !FY FY ?+ ?+ 993??993333310%26754&#""32373#47#N�������}�����y	��sw��%�����ً*.�����dF�  �  '\  *@		

 
 FY  ?+ ?9?9933102&#"#3366�I:D4����=�\�ء��H�kt  j��s\ $ 6@  %&FY	FY ?+ /?+ 9993310#"'532654&'.54632&#"s���zO�T��o���?ھ��;��vx-d�É+��E�(.SU@[>9UlK��H�DJA,>85G�  ���F  4@		
GY@ FY ?+ ?�+ 393310%267# #5773!!,Ri*��F`>��^uO�PE����{cj   ���9H  4@

FY ??+ ?393993331032653#'##"&5Lz�����	3�t��H�9����@���QV���      H  @

	  ??399910!3363��`��Pu̲�`H�v�D5M0��    #H  ,@		  ?3?339933339910!&'##3366733663/�4(���ծjo1ɴ�8#�����;ѯ_�H�c�PK9�5u���u$����   '  H  "@ 	 ?3?39991033##����! ��������ʼ1�\�������D  �H  $@	  FY  ?2?+ 991033663#"'53277��OS��)F��LJ7D�I=H���_3�|� �����   R  mH 	 +@ 
GYGY ?+ ?+93310!!5!5!!m��V�����]qV����  =����  ,@  ' ??933333310%&&54&#5665463�uq��~x�tض���f\���/hY�\`2�������''� ��{  @	   ??93103#��  H����  ,@
 ' ??933333310&54'52"5665467
���v�z~;otnq?'�'������a[�Yh�љ��\f)rx   hP)T  $@PY PY /+ �/�+9910"56323267#"&'&&R56d�DqYBb/6�6f�H~HKZ�C6�m&@9�n!     ����^   +@		  OY" ??+ 9/9333103##"&54632�i3��y<<?93F���L�G@?H@  �����  >@
 
 ??99//333393333310%#5&5%53&#"327�i������K�11�m�������6�� ��>��!�3����;  ?  D�  H@&	NY	 LY KY  ?+ ?+ 9/3+ 393333102&#"!!!!5655#5346���=��{}��ZAJ�������T�M|����d�,��/��<��   {�  '  @ " ()% /33/399331047'76327'#"''7&732654&#"�J�^�h�f�_�JJ�\�f�d�\�J��tt��rt��zk�\�II�\�qv�g�\�GI�\�k|p��qr��     q�  V@.		
  ??399//]9223333933333103!!!!#!5!5!5!3H{��`��=�ä��<�� �e��������� ��{   $@	   ??99//9333103#3#�������  {��� 1 = C@&2 *8 #>?;6-!	!'GY!	GY	  ?+ ?+ 99333310467&&54632&&#"#"'532654&&'.7654&'�VNJT��^�a5b�Ltt{���RJ���ڀN�R��0ls��B���1���DU)V�%(oUy�'�';@<T7D�kZ�)Q���A�%-LG.::+4ZrbMi=PoSp9d 5h�   @  	 /3�29933104632#"&%4632#"&55%&77&%5}5%%77%%5q4..421124..4211   d��D�  & 6 F@''/	78  +#3 ?3?399//]]33933310"327#"&54632&4$32#"$732$54$#"}}��V}0eF��ݿ�v:l���^��^���������i�-��*���װ��֯#����-|����<v3���^����������Zƭ�ӭ�)��*����   Fq�   7@
 !

  ?3�]�39/39333310'#"&5467754#"'632%3255\�_o��u�dh+r����Pp�bpg!Tacffi'�3`8iy�<�d�19  R u��   )@
		 /3/39333310%RVw��!w���Xu��u��'�E����G��E����G�   h)  @PY //+99310#!5)������� �� T�?q     d��D�   & 6 ]@3' 	/	78   +#3 ?3?399//]]339/339333331032654&#####!24$32#"$732$54$#"�lPaV]j�UM�χ������^��^���������i�-��*���װ��֯�S@KA�P{�ub��{����^����������Zƭ�ӭ�)��*���� ���  �  /33310!5!��  \��   !@  
� ?3�29933104632#"&732654&#"����R�T��suQPsqRSs�����T�T��RrqSTqr �� h )�&    +  �t  1J��  #@ 
  ?3?393310!57>54&#"'632!����YR!P?4bEB����Y���Jh�VaL6DE&2Xo�pP���  !9�� # 9@" 
$%]mL!! ?3?39/]]]39310#"'53254##532654&#"'6632sRD����t�{��uwgcPCBp8E?�^���Pg/���8{D��kOD=D+#Z-6w ��! 	 �	
�	 /�99106673#�0o �,�@o�>�AA�4  ��DH  5@

 FY	 ??+ ??399333331032653#'##"'##3V�����
o�X

��}����@����\T���4  q��`  '@   /3?39/93310####"&563!`r�s>T����-����P3���  �L�Z  @
  	OY /+93104632#"&�>8:AB93C�BEEBAF?   %��    $@   /�29/393310#"'532654&'73���3--;OQOmXn7���aj	j(6+5�s'  LJ�� 
  @ 
		   ?2?9/9933103#47'R��6�C���C[Z-_`  B��   %@   	 ?3�]2993310#"&5463232654&#"�����������[hi\\ig\o��������zzzz{vv  P u��   #@	 
	 /3/393310'7'7���u��uX�u��u��uX�iG_^E�i�iG_^E�i�� K  �� '�   & {� <�� 	� ?55 �� .  �� '?   & {�  tN�� � ?5 ��   !� & u�  '�  <m�� 	�+ ?55   3�wT^  ( A@"##)* && OY&IY# ?+ ?+ 9/_^]9333103267#"&54>76655#"&54632NKay=�zP�b;�ƾ�#@Y6eA�y;>B73F�3z�TjKM8dq&0�`��FiYR/Xt]+�EB@G@��    s& $   C��R �& +5��    s& $   v �R �& +5��    s& $  K #R �& +5��    /& $  R R �& +5��    %& $   j 7R 
�$& +55��    & $   P 9 � ��  ��   N@,
 	IYIY
IY

IY ?+ ??99//+++ 33933310!!!#!!!!!!#�����������D�T�v��/���)����� �� }���& &    z  �� �  �s& (   C��R �& +5�� �  �s& (   v ?R �& +5�� �  �s& (  K��R �& +5�� �  �%& (   j R 
�!& +55�� <  Vs& ,   C��R �& +5�� T  ss& ,   v�aR �& +5����  �s& ,  K��R �& +5�� <  o%& ,   j�R 
�!& +55  /  H�   W@2  IY?���		JY	JY ?+ ?+ 9/_^]3+ 39333310 !!#53!  !#!!3 H�w���{���Q|����{���b������������@����
�� �  ?/& 1  R �R �& +5�� }���s& 2   C yR �& +5�� }���s& 2   v
R �!& +5�� }���s& 2  K �R �&& +5�� }���/& 2  R �R �!& +5�� }���%& 2   j �R 
�-& +55  ��  @			 /993310'7�`��^`����e^��da�c����c_��c``e��   }����   # N@,
  
$%!!IYIY ?�+ ?�9+ 99933910 !"''7& !27'32&#"������exl�`Dѝaxj��n�`s����'e�j�������nd�O��me�^�P������LR2*����I�� �� ���s& 8   C FR �& +5�� ���s& 8   v �R �& +5�� ���s& 8  K }R � & +5�� ���%& 8   j �R 
�'& +55��    {s& <   v 1R �& +5  �  y�   6@	  JY	JY		 ??99//++99333310!##33 32654&##y���Ḫ������ʾ�������� ��ꏤ��   ���� 0 A@")*#  *12*..&FY. *FY ?+ ??+ 9/9333310#"'53254&'&&54676654&# #4632�X8GN�f³�k?�H�Sn`EGK@��������sFC! *93_�e��E�'/�KkFR{T?j59Z5PU��L������ ^���!& D   C�  �&& +5�� ^���!& D   v+  �.& +5�� ^���!& D  K�  �3& +5�� ^����& D  R�  �.& +5�� ^����& D   j�  
�:& +55�� ^����& D  P�  
�(& +55  ^��s\ ) 4 ; a@3* $08090 <=-'-FY11GY8$'"'5FY ?3+ 3?39/993+ 3+ 39333399310467754&#"'66326632!!267# '#"&732655"!4&^���tw��4J�b��)5�n���C:[�TV�e��}Qņ���kX������y��/��D�{T)5W_X`���k�u#'�&!�j��_Y��cm2���� �� s��\& F    zF  �� s��!& H   C�  �& +5�� s��!& H   vN  �$& +5�� s��!& H  K�  �)& +5�� s���& H   j
  
�0& +55����  c!& �   C�Q   �& +5�� �  2!& �   v�    �& +5����  U!& �  K��   �& +5����  �& �   j��   
�& +55  q��b!  & J@+!  	'(	FY		$FY ?+ ?39/99+933310 #" 54 327&''7&'774&# 326b��������d9���I�\^E�f�LϘ����������3������yֿ�l�>1uIK�kw��r�蓪����� �� �  D�& Q  R  �& +5�� s��b!& R   C�  �& +5�� s��b!& R   vV  �"& +5�� s��b!& R  K  �'& +5�� s��b�& R  R�  �"& +5�� s��b�& R   j  
�.& +55  h �)�    3@

 PY /+ 3/33/39333105!4632#"&4632#"&h���;64:;34=;64:;34=�����<=?:9@?�<=?:9@?  s��b�   # K@)
  
$%!FY!FY ?�+ ?�9+ 999339910 #"''7& 327&#"4'326b���pTr^��tTua��5�Kr���3�/Gq��%����EuN�� +LwL����f�5�Ԥd�}3� �� ���9!& X   C�  �& +5�� ���9!& X   vq  �& +5�� ���9!& X  K  �#& +5�� ���9�& X   j!  
�*& +55�� �!& \   v  �& +5  ��u  " >@ $# 		FY	FY ?+ ?+ 99??993333106632#"'##3%"3 4&XB�j�����z��H����/��YO�������ӡ"M?�5 �.4Z��)������� ��& \   j�  
�+& +55��    �& $  M ?R �& +5�� ^���b& D  M�  �(& +5��    7& $  N +R �& +5�� ^����& D  N�  �%& +5��  �B�& $   Q�  �� ^�B Z& D   Q�  �� }���s& &   vR � & +5�� s���!& F   vD  � & +5�� }���s& &  K �R �%& +5�� s���!& F  K�  �%& +5�� }���1& &  OR � & +5�� s����& F  OP   � & +5�� }���s& &  L �R �"& +5�� s���!& F  L�  �"& +5�� �  Xs& '  L XR �& +5�� s���& G  8   �#  ?5 �� /  H� �    s���  ' d@7% ()GY/		 		"FY	FY ?+ ?+ 99?9/_^]3+ 3?933333310%##"323&55!5!533##%26554&#"�	s������w�@����������������&,�SI������%w��#�������� �  ��& (  M R �& +5�� s��b& H  M
  �& +5�� �  �7& (  N R �& +5�� s���& H  N�  �& +5�� �  �& (  Oo5 �& +5�� s���& H  OT   �$& +5�� ��B��& (   Qs  �� s�a\& H   Qf �� �  �s& (  L R �& +5�� s��!& H  L�  �&& +5�� }��=s& *  K �R �*& +5�� '�1!& J  K�  �P& +5�� }��=7& *  N R �& +5�� '�1�& J  N�  �B& +5�� }��=1& *  OdR �%& +5�� '�1�& J  O   �K& +5�� }�;=�& *   9'  �� '�1!& J  :D  �F& +5�� �  s& +  K �R �& +5�� �  D�& K  K � �%& +5     ��   T@, IY
JY ?3?399//33+ 33+9333333331053!533##!##55!ɪ��Ȫ����u������������P1�����    D  Y@2	 	 FYGY/	  	 ?3?9///]3+ 3+ 3933333310!4&#"##5353!!36632�z���������?
1�t�������������T8O[���\����  �/& ,  R��R �& +5����  x�& �  R��   �& +5�� *  ��& ,  M��R �& +5����  2b& �  M��   �& +5��   �7& ,  N��R �& +5����  8�& �  N��   �& +5�� T�BV�& ,   Qh �� 5�B��& L   Q �� T  V1& ,  O PR �& +5  �  VH  @	  ??9310!#3V��H�� T�� & ,    -�  �� ��l� & L    M  ���`�es& -  K��R �& +5�����O!&7  K��   �& +5�� ��;��& .   9 �  �� ��;& N   9+   �  F  /@ 	 ?3?399333103##3/��b�������F����q�yF��q�� �  �s& /   v�cR �& +5�� �  ,�& O   v�� �& +5�� ��;��& /   91 �� Y�;W& O   9��  �� �  ��& /  8�� �	 ?5 �� �  �& O  8+  �  ?5 �� �  ��& /   O�g�� �  � & O   OB�8    ��  =@! 	 	
  IY  ?+ ?99//99333103'73%!�iC��)C����;re�F�y��<� ��  '  7@ 	 	
  ??99//9339333107#'73V�HѦnF��`^p��?THqw  �� �  ?s& 1   vR �& +5�� �  D!& Q   vy  �& +5�� ��;?�& 1   9 �  �� ��;D\& Q   9V �� �  ?s& 1  L �R �& +5�� �  D!& Q  L  � & +5��   �� ' Q �  �  � ?5   ��?�  8@
 IY " ?+ ??3999333310"'53265##33&53�b6GSij��������zo��������N��=�X��  ��D\  8@FY FY  ?+ ??9?+933310"'53254&#"#336632%V7<>�z�����
4�n�ǌ���y������H�RX�������� }����& 2  M �R �& +5�� s��bb& R  M  �& +5�� }���7& 2  N �R �& +5�� s��b�& R  N  �& +5�� }���s& 2  SR 
�+& +55�� s��b!& R  SZ  
�,& +55  }����   S@.  !IY IY	IY	IY IY  ?+ ?+ ?+ ?+ 9/+933310!!#   !2!!!!!"  327&�� f\����\@fZ��'��M�D����pWW�jh���)������������!u  q��Z  * 1 U@-%/%23+((FY.FY..""FY  ?3+ 3?39/99++ 393399310 '#"  326632!!26732654&#"%"!4&���}>щ�����>:�~���'J^�WX��!��������G� ��tw1	,wrpy���i�w#'�' 9�������ؤ����� �  �s& 5   v yR �& +5�� �  '!& U   v�  �& +5�� ��;��& 5   9} �� `�;'\& U   9��  �� �  �s& 5  L R �!& +5�� �  '!& U  L�v   �& +5�� j��s& 6   v PR �.& +5�� j��s!& V   v�  �.& +5�� j��s& 6  K��R �3& +5�� j��s!& V  K�  �3& +5�� j��& 6    z'  �� j�s\& V    z �  �� j��s& 6  L��R �0& +5�� j��s!& V  L�  �0& +5�� �;Z�& 7   9 �� �;�F& W   9� ��   Zs& 7  L��R �& +5�� ���& W  8b  �  ?5     Z�  ?@! 	
JYIY ?+ 3?9/3+ 3933310!5!!!!#!5��1H�16�ʪ��/����^��  ���F  L@)
GY

GY@ FY ?+ ?�9/3+ 3+ 39333310%27# 5#53#5773!!!!U< j*�ȍ���F`>��-��u\�� PE���� ��� �� ���/& 8  R oR �& +5�� ���9�& X  R�  �& +5�� ����& 8  M �R �& +5�� ���9b& X  M  �& +5�� ���7& 8  N �R �& +5�� ���9�& X  N  �& +5�� ����& 8  P �R 
�& +55�� ���9�& X  P#  
�& +55�� ���s& 8  S �R 
�%& +55�� ���9!& X  Sh  
�(& +55�� ��B�& 8   Q!  �� ��BeH& X   Q�  ��   Ls& :  KTR �(& +5��   #!& Z  K �   �+& +5��    {s& <  K��R �& +5�� �!& \  K�  �$& +5��    {%& <   j��R 
�& +55�� R  ?s& =   v BR �& +5�� R  m!& ]   v�  �& +5�� R  ?1& =  ODR �& +5�� R  m�& ]  O �   �& +5�� R  ?s& =  L��R �& +5�� R  m!& ]  L�  �& +5  �  �  @ 	FY  ??+39310!#!2&#"V�g`d+WIaY��%�{z   ���   D@$
!"

FY FY FY  ?+ ?+ 9/3+ 3933310"'53265#5754632&#"!!HE@F=_M�ޢ�Uxf<bP����fq�K<�ò+@A i|���7��     �   " . a@4# )	" 	0/&,	IY	"" ?3/9///99+ 33393333999910#!#&54632&'6673#4&#"326hh������jzcd}�/0	��1f� �Bo�B33B<95@��8�'��o�4�eru�6�:�0��T�;�*.�-��9<<97==  ^���� 	 $ / ; G g@7-B6<0)$$0 6HI		?9E3)GY  FY %FY
 /??+ ?+ 9/9+ 3?3�29/9333333105667!'##"&5%754&#"'6632%2655#"&546324&#"326�.j��!R�z���w�`�G7T�e������Ưm�{feyyee|mA33B<94@�*xiD�'�gI��LD�z4 +3���u��cmsZ^=bwtcbsw^8==88== ����  �s& �   vLR �& +5�� ^��s!& �   v�   �E& +5�� }���s& �   vR �-& +5�� s��b!& �   vV  �-& +5�� j�;�& 6   9 �� j�;s\& V   9�  ��!  @	 �	 /3�299106673#&'#f�m}wX��Ss���)*��7��4  ��!  @	 � /3�299103673#&&'sri�[wB�.�f!Js�;D�W)~�  -��b  �   /39910!!-X��b� %���  @	�  /2�29910"&'332673V��	h)IUe`
h
�ى�18@C~�   �f�  �  	 /�93104632#"&�8*(::(*8q9568877  o�-�   @  	 /3�2993310#"&546324&#"326-{fexyde|lB33B<94A�bwubbsw^8==88==  %�Bq    @
 		 /39310327#"54673�^*7A<�VHxDE�^m�F�5Bm  ���  $@	   �	 /�99//339910".#"#663232673+ROI"23bs[.VNH 10cq�%-%<=y�%-%;>y�   ���! 	  @	�	 /3�29106673#%6673#�$n�%�:ae1e�%�:`�0�E?�0D�:?�0  ��s 	 � 
�	 /�99106673#�5�m1d�H�RJ�L ��     +@		!" /3�99//393310673#'4632#"&%4632#"& A�!y3P�4&)17#&4�4&)17#&4���C�=4.4.21124.4.211��    
& $  T� �� �  ?5 �� �L�Z y  ����  u
 & (} T���� �  ?5 ����  �
 ' + �  T���� �  ?5 ����  D
 ' , �  T���� �  ?5 ������
 & 2D T���� �  ?5 ����  �
 ' <
  T���� �  ?5 ����  3
 &v? T���� �#  ?5 ��������&�  U��   �.& +555��    � $  �� �  �� %    �  ��  @ IY ??+99310!#��{������ �� '  m�(  �� �  �� (  �� R  ?� =  �� �  � +    }����    ?@ 

 IY  IYIY ?+ ?+ 9/+99339910!!% !   !  32#"�u�����������`D;b�s��������3�?���n�he��p������0,*.�� �� T  V� ,  �� �  �� .       �� 
 @ 	 ?3?99910!#&'#3Ӷ��W!G������Z���^��� �  q� 0  �� �  ?� 1    H  %�    4@
 IY  

IY
IY ?+ ?+ 9/+910!!!!!5���R��u��#H���y���� }���� 2    �  �  #@  	IY ?3?+993310!#!#!���C��� �� �  h� 3    J  \�  5@

 	 IY 
IY  ?+ ?+ 3933310355!!'!J��+��\`��T�o+������� ��   Z� 7  ��    {� <    j����  " + P@)'+,-**JY"$$JY  ??99//3+ 3+ 339333333310332###5#"$54663332654&+"33۬F�������)�-�������C���ι:�9����˴��������������E�ù�Է�� ��   �� ;    m  ��  >@
  IY ??339/3+ 393333310!##"&&5333332653##��-��������ϰ����-�z����!��d��ƻ����{   P  ��  9@ 
 ! IY		IY ?3+ 333?+93310"!5!&5 !  !!5654!������l��b:;b��k�����5���������v^�6`�������x���N���� <  o%& ,   j�R 
�!& +55��    {%& <   j��R 
�& +55�� s���s&~  T  �4& +5�� Z���s&�  T�  �/& +5�� ��Ds&�  T;  �& +5�� ����s&�  T��   �& +5�� ���q�&�  U;  �4& +555  s���\  * G@$	'"+,'((FY  FY$ ?3+ 3?+ 993?9333310%26554&# "323673327#"&'#P�����ѓ�����y�6)�T!.AQY;�w�����P�ԋ))TT\8B�t�Ir
wQVVQ  ���  ) L@('"*+#"FY## FY FY   ?+ ?+ 99//+ ?93333102#"&'#46"32654&##532654&�����y���m�O��䞝]�V����p\���з��3*����&��4�������1%�������{�  
�H  !@
		 ??39/3910#4733>3�@+�?��^)+��k05�`&r<���g��m��|��  q��`  * ;@ %	 +, "(FYFY  ?+ ?+ 9933310&&54632&&#" #"$544&'326!�t¤g�~Hp�QUak�ұ�������a{�ο�����N�c��-?�>,OBGo[s�����ұ�s��J5٠���   Z���\ % M@+#&'%%FY%%%%!FYFY ?+ ?+ 9/_^]+ 993310# 3267#"&54675&&54632&&#"!˔�ɓ�T�d����n�bk��a�d?^�O�=���Zb'/�K��b�)\��!-�*��   s�o�   0@ !"#  FY  ?+ 33?9333105! #654&'&&54>7!������;}����}o�˼;p��(���������ߦbvI%m[���k8=$��r����   ��D\  /@ 		FY	
	  ???9?+99333104&#"#336632�z�����3�q����������H�QY���I  s��J+    I@'  FY�		FY	FY ?+ ?+ 9/_^]+99333310#"322!"!J������������y����
���j�v�����k��13����)����  ����H  @FY ?+ ?993103267#"&5NIW%ei2��H��he���� �  F �   ����F! " 3@$  #FY FY  ??+ 93?+3910#'.#"5632327#"&'&'#�:2C1:9D?[yX6k*#!0=JS�T	X�7�UF$�<���13
yLS��`t��� �� ��DH w       H  @	

 	  ?2?9993103363#��S�����H��C�>��Q����  q�o� 1 I@'-( %2300GY00&)%&%FY& # ??+ 39/+ 99333310#"#6654&'&&54675&5467##5!#"33V���2_�T��6C�5Bs��Ǟ�ً��sD�3������Pb=$nZA�cG�47="Ȱ��'@�u�2��P�_sl�� s��b\ R    ���H  6@
	FY FY ?+ ??+ 3393310%27#"5!##57!#}&0+T��#�ݏL�3u����F�JD��<J7  ��b\   6@		
 
 FY
FY ?+ ??+ 99933310 #"'##32%"32654&b� �x������!��z����%����^=���
�Ѣ����f����   s�o�\   .@ "!FY# ??+ 9393310#6654&&'&&5 32&#";����6C�6C3na���O�65�r��
��P" kZB�_F�2(/&%��6!�3�  s���H   0@  	FY	FY ?+ ?+ 393310#" 5!!!3265'#"`{����P�����������A����� �>������Ŷ��   ���H  ,@ 	FYFY ?+ ?+ 39310!3267#"&5!57��P�/b#o0���הH����}��JD   ���qH  %@ 	FY  ?+ ?3993310"&332654&'3 s�覞���"�$���
X����������֌����   s�L\  " A@#
   #$FY FY  ??3+ 3??+93333310$ 746324&#"66�����σYQh���ڈ��y|fIN����#(�Zu�|�u#l����������&'��xr��� ���PN   9@!"!FY FY  ?+ ??+ ?9391023327#"&'#&&#"56�6N>,�>��T�0R?--<;s�;����Ь&F+%1N+[p��a���zJ�v���hD�cP�  ���  =@

 FY ??3+ 3?3?933333106654&'3 #$ 3Z��%�?������������i��x���������&�	"�����  s���H ' =@
&  ()&  FY#  ?2+ 3?39/99339310"54733265332654'3#"'#���7D�D9xk^i�j]kx7E�A9˶�D	A(�������؏}7�ɀ�����������ֶ��� 	����&�   j��   
�%& +55�� ���q�&�   j9  
�+& +55�� s��bs& R  T!  �"& +5�� ���qs&�  T'  �& +5�� s���s&�  T �   �1& +5�� �  �%& (   j 'R 
�!& +55  ��B�  F@&IYIY IY  ?+ ??+ 39/+933310"'5326554&#!#!5!!!2�`67[eh���������C�����|p��q����^������� �  �s&a   v ZR �& +5  }����  8@IY IY	IY ?+ ?+ 9/+93310"!! 327#   !2&B�����)
��ɡ�����yN��G�3������7�9�m_�X�R�� j��� 6  �� T  V� ,  �� <  o%& ,   j�R 
�!& +55���`�h� -     ��#�  # G@&  $%#IYIYJYJY ?+ ?+ ?+ 9/+933310!!!#"'532>!3 32654&###��������9TP�kE@2?0A+7DA�z:�L�Ʒ��f����H���y�>g������M���|  �  T�   J@&  IY	JY ?+ ??39/3+ 3933333310!!!#3!33 32654&##T�������}����y9�N�Ĺ��f�����P���n���M���}     B�  :@ IY IY   ?3?9/++ 3933310!2#4&#!#!5!!��٪}��}�����}�����~q����� �  �s&�   v �R �& +5�� ���^&�  6 DR �& +5  ����  0@	  
IY" ??3+ ?3933310!!#!3!3�/��>����}��� ��    � $    �  }�   =@  	 	IY		IYJY ?+ ?+ 9/+933310!!!!3232654&##}�����T^�L���t��ﾭ���������'Y��T���x �� �  �� %  �� �  ��a    ��J�   C@$
  

IY
"IY ?+ 33?3?+93333310#!#3!3!!J���q��������Ή��}���3�����Y� �� �  �� (      ��  <@
	 	   ?33?33933333933310333###V���9�:���R����������<��<��<�����  J��5� ( C@$  #)*JY
&&JY&
JY
 ?+ ?+ 9/+ 993310!"'532654&##532654&#"'6632����������`�g�������ᢉn�uTe����`������O�.2�������k�2JrKM�  �  R�  4@			  ?2?3993399333310333#47##˟4��	�˺������J%���5 �� �  R^&�  6 �R �& +5  �  �� 
 -@ 	

 ?3?399393310!##33���\�����y����<��:   ����  -@  
IYJY ??+ ?+93310!#!'"'53266!٪�%=]�~J;6;5O=]8��!�E��W�Y��� �  q� 0  �� �  � +  �� }���� 2  �� �  �n  �� �  h� 3  �� }���� &  ��   Z� 7    ����  *@	 	 IY  ?+ ?3993910"'5326733673%oT]`n�B�Ǽ�g��-T���+e�A��1/T5�껪O�� j����s  ��   �� ;    �����  2@	  
 IY" ??+ 3?3933310%3#!3!3�����漢��}���   �  ��  -@  IY	 ??39/+9933310!##"&5332673Ǫ��j�ߪ�a���\5'��E��yt7�  �  y�  1@	  
IY ?+ 3?33933310!!3!3!3y�P�X�X������  ����  ;@  "	 IY  ?+ 33?33?933331033!3!33#ɪG�H������������}     �   =@ 	  	IY		IYJY ?+ ?+ 9/+933310#!!5!3 32654&##����G�����������������������~   �  
� 
   ?@   IY  JY  ?+ ?39/+ ?9333310333 #%32654&###3ɪ���������������������ܑ���{�R�  �  �� 
  2@  IYJY ?+ ?9/+9933310#!3! ! 4&#!������#��+l������������ �  =����  :@		IYIY IY ?+ ?+ 9/+93310"'632 !"'53  !5!& Ӭ�H���9������S�c�1���3L�T�������l9�"!��  �����   G@&	  	 IYIY	
	IY ?+ ??9/+ ?+93333310 !  !#3! !  32#"�������������dQ3V��������������qoU�P���7N�o������2**.��  3  N�   =@  JY	  		JY	 ?3?+ 9/9+933310#&&54$!!##"!3{��������㷾{�b��3Ϟ���Jb�~����� ^���Z D    w��T!  " ;@   $#FYFY ??+ 9/9+ 39333107$736632 #"  !"w��������>�k���������1��L�u ��h�2=&�:"!��T`�������b��s?h7����  �  LH    I@&   !FYFYFY ?+ ?+ 9/+ 99333310#!! 4&#!! 4&#!!26){o������������1{}���~5ko	~o��H�YQ���PC��L   �  DH  @ FY ??+99310!#!D�����FH  )��hH   C@$
  

GY
"FY ?+ 33?3?+93333310#!#36!3!#h���V��+�����l��{��
���G6��9� �� s��\ H      �F  <@		

 
 ?33?3393333393331033###3��Ŷ�6��������7��F������+��+��3��  D��\ " M@+!#$"!"!FY""""
FY
FY
 ?+ ?+ 9/_^]+ 993310 54#"'632#"'532654!#5�7�M~f;�ɽ��~t��큷����ɘ���*�L���9%�g��G�Vc]��  �  bH  4@
 ????999933333103#77#LQϛ���H�I�9�������\H �� �  b&�  6=  �& +5  �  H 
 -@


  ?3?3993933103##3/��' ����H����+��H��  ���H  -@ 
 FYGY ??+ ?+93310!#!#"'532!���`�v6 s�#�����^�{��  �  /F  5@  ??3?399399333310%773##&'#3�+)ӓ:����5��+�]v����:��J��K�wF�In  �  bH  9@		

FY/?

 ?3?39/]+99333310!3#!#Vf�����H�5�����H�� s��b\ R    �  HH  #@ 	FY ?3?+993310!#!#!V�����H��� �� ��u\ S  �� s���\ F    )  �H  $@ 	FY ??+ 39310!#!5!������j��F���� �H \    q�F    L@'	  	  FYFY ??3+ 3?3+ 3?9333333310 #& 54 73 %66F�����������ٰ���{����%����$�.��&��D�����T��'����� '  H [    ����H  2@
  

FY" ??+ 3?3933310#!3!33ݦ�y�F����{H�G��G  �  -H  -@

		FY

 ??39/+993331032673##"&5B�[�i��i�q��H�p�8C����H;���  �  oH  1@ 		
 FY ?+ 3?33933310%!3!3!3���A�妏���H�G�   ���
F  ;@	 	
 	FY	" ??+ 33?339333310%!33#!3!3�榝��N�妏��I��yF�I�   )  H   =@  
 FY  
FYFY ?+ ?+ 9/+933310!2#!!5!4&#!! -9�����%��L|���9���������]S��   �  yH 
   ?@   FY  	FY ?+ ?39/+ ?9333310!2#!3#3! 54&#V+�����9�#����z������H��H�����\T  �  LH 	  2@  
FY  FY ?+ ?9/+9933310! #!3!2654&#VR�����@������ˢ�H����\][U  9��}\  D@&		

FY FY FY  ?+ ?+ 9/_^]+93310"'53267!5!&&#"'663   V�v<�[��
��)��g�/7�P 
��9�$�����6�#��������  ���3\   Q@-	  	 FYFY	
	FY ?+ ??9/_^]+ ?+93333310 #"'!#3!6632 32654&#"3������ᦦ!����������%������H�5�������������  %  �H   =@ 

FYFY ?3?+ 9/9+9333103#&&5463!#!!!!"��;�ʵ����������z�����N�r�� s���& H   j  
�0& +55  �D ' f@:%%()!FYGY/	!!  FY  ?+ ??9///_^]3+ 3+ 3933333310"'53254&#"##5353!!36632/O4:7�z���������o
1�t�ɉ���R����������T8O[�������� �  D!&�   v�  �& +5  s���\  D@&	FY FY FY  ?+ ?+ 9/_^]+93310"  32&#"!!327y����R�91�m��)��	����t#* �3�����;�9�� j��s\ V  �� �  f� L  ����  �& �   j��   
�& +55�����f� M    ��BH   L@)	  FY  	FYGYFY ?+ ?+ ?+ 9/+933331032!!!#"'532!4&##3 �����K�e��(��8 s�#P�}������������>{����[U��  �  �F   J@&

FYFY ?+ ??39/3+ 3933333310!2!!!#3!3 54&#  ���N�`�
�������F�;������F�7������\T ��   D �  �� �  !&�   v3  �& +5�� �& \  6�  �& +5  ���FF  2@
"	FY ?+ 3?3?933310!!3!3!#/���J����F�I�����   �  �  #@ 	IY ??�+9933103!#f��k��-�:���   �  D�  '@  	GY ??+ �993310!#!3D�����9HA ��   Ls& :   CR �& +5��   #!& Z   Cs  �& +5��   Ls& :   v�R �#& +5��   #!& Z   v   �&& +5��   L%& :   jdR 
�/& +55��   #�& Z   j �   
�2& +55��    {s& <   C��R �
& +5�� �!& \   C�a   �& +5  R��q  �   /399105!R\٘�  R��q  �   /399105!R\٘��� R��q   ���1N��   @ 	 /3/3333210!5!5!5!N��R��R�1���   �D�  �	  ?�9910'673%b8{B%�Zy��   �D�  �	 ?�9910#75b5zF �d��r� �� ?��m �     �F�  �	 ?�9910#&'7�%B{-m���^e   ���   @	  ?3�2910'63!'673�8z{;��b8{B%��s��aZy��   ���   @	 ?3�2910#7!#675b5zF '`8}B�d��r�[��zd4] �� ��� �  �8  � @H����H����		H +++55  {  �  C@!	
   
 ?.333?9/333933333310%#53%���1�1��L1�1`������_  {  �  u@:
 	 		  ??99//9922333333333393333333333333310%%#553%%9a��1�1��Z++��Z1�1a��+����{�+�|�����  ��^�  �  	 /�93104632#"&�qlitsjkr�y~|{w�� �� ���� � &    '     %    d��	;� 	   $ / ; F [@0 
0B6<+%%+<B
GH33(?"99-DDD ?3??99//3333?33393333331032#"#"&5!2%#32654&#"#"&5!232654&#"#"&5!2�S]��]S�����8��i�Ք+�S][YY[]S�����7���8Q][YY[]Q뢛��8����TR����������J����������������ݫ������������� �� ��?� 
  �� ����      R u�  @
 //993310RVw��!w��'�E����G�  P u�  @
   //993310'7��u��uX�iG_^E�i �� ���J� &     �   �y  ��  �  ??3310#��y����J�  m!��  &@ 		 	
 ?�2?399333104&#"#3363 LNPr[t`
K�!�TGiz���Xe��T  b  #�  K@( 	NY LY

LY
 ??+ 99//+ 3+ 39333310!!##53!!!!�4�̦����D������
�+���  D  H� % p@@	" &'NY ! NY	!!!?!O!	!! LY KY  ?+ ?+ 99//_^]3+ 33+ 39333333102&#"!!!!!!5655#535#53546�ɞ<��z~��\��\AJ���������P�G������!d�,��0�#���ϲ�   �����  ! * `@7"&		+,"KYNY*KY MY ?+ ??+ 9/////++933333310%267#"&5#57733#!##! 32654&##N"V<nm���>b��4������@� ���4ȹ��Ru}���PE�Ӂ�GMR����������   ?���� & q@?$
'(NYNY/	"" LY"LY ?+ ?+ 99//_^]3+ 33+ 3933333310 !!!!327#" #53'57#53 32&��O�����A%˪�������.����'$�ɥG�5�m�9@-���B�A�*,P�$a�V  ���
�    + E@$% *
 
*,-#' ??99//33?3?39333310##"&546323254#"%"&54632&#"327�Ք+��������������ʦ���hX!QP��bZN��J��������������۱���#g��!e%  w����  $ =@#		%&#
  /3/399//99333310%273#"&5556746324#"$}�_����``Nr��u�ίR�C> oզ����#q&򊟡����J��h{+�Vl�K�   �  ��   ' + _@1	 "+( ,-%((()JY( ?3?3?+ 99//9933933333310!###33&53#"&5463232654&#"5!ǻ�L��������������"Q][OO[\RV ���l����:��G����������rvusspp� ��  %���   O@' 	

 ?�229/33333333393333310##5!###33#7#q{��X�w��˴��gjj��/��R���/�/���� �� P  ��v    f���H   4@ !/?  /2/39/]93933310"&546632!3267&&#"y��������1�R��QHbٓ2�X�z#�����������5Fi�)�|�5Bu���� G���� '\   & {� @`�� � ?555 ��  ��� '�   '@u�� u�  � ?555 �� G��� '�   &= @q�� �, ?555 �� j�� � 'F   '@m��?1  � ?555   f��5�  ( A@"&  )*"GYFYFY ?+ ?+ 9/9+933310#"&546327!"56632267&&#"5��쭬���a�+��>�0/�J����_�x�Pe�ee����5����3�]KZ�,!�%���Ɛ�al���v�  '  m�   (@	
	IY ??+ 999331073!!&'Ϧ���!=(�����DhN��f��y����   ��!�  #@ 	IY  ?3?+993310!#!w���X�����Z  L���  1@		 
 IY 	IY  ?+ ?+933331055!!!Lw��@��C����k�3l������  h�)  @	  PY /+99105!h����  %����  @
	 //9/933310##5!3o��!����T�   w�-  ! - 3@+  %./"	(	 /333/3993393310#"&'#"&54632632267&&#""32654&-��]�A<�X�����z|����}Bm62mHLda�Bm73nGLdeσ�jthq�����ׯ��[da]iWSjy\ba^kTUi  ��  @  /2/393102&#"#"'5325}O,1>���J;=:����᰻��j   b�-  / p@@(10'PY/	*@*$PY*@ PY/	@PY   /]�+ �_^]+ ���+ �_^]+ �993310"56323267#"&'&&"56323267#"&'&&P69l�CpXM[-5�6e�CoXI[19�5j�EtRE_17�3d�EvOTU @9�n%!B9�m%�D5�m "B7�n !"   h �)  F@&	
 PY
	PY /3�+ 3/_^]�3+ 393310!5!!5!!!!!'}��T�-�}m������}���9������7�� h )�&   +  �t 	�  ?55 �� h )�& !  +  �t 	�  ?55   o  =�  	  @  
	 //999933103#	o�H��<Hb����=����!����� ��    & I    L�  ��    & I    O�    ���  @	
�  /2�29910"&'332673H��
�	[qgc��ُ�hRXb��  ���VH  @	 FY  ?+ ?9310"'532653+_;ECNI���UW����  ��u 	 �	
�	 /�99106673#�'
�X/Z�7�Q3�F q�;o�� 	 �	
	� /�99106673#q3�b7Z�T@�53�B ��! 	 �	
	� /�9910#566735�c1\=�1=�9  '9��    @ 	! ?3?399331032654&#"!"&5!2�R^^VV^^R��Ğ�;�� ���������7����  J�� 
  <@	 	  ??39/]33393333310##5!533!547�}��n��}�����eC��ÆK'--�  ;7��  +@	  ! ?3?39/3933102#"&'532654&#"'!!6H����J�)8�6_nmf9L;!���>h�{���"&SYNX)�h�   )9��  # 6@!  %$ ! ?3?39/]93933310632&#"36632#"&2654&#")��J14S��
qU}�����DQcXVUpj��r��+;�~���c]cO[Z;Y|   9J��  @    ??39310!5!�^�9V��J�t^��  39��  " - ?@"&+./  ))))
!#  ?2?39/]39993333102#"&5467&&54632654&''"654&d|�������IUJ9�5TVZT]QHF�DKDQ�N�vh�LJ�q��tEt..]Df~�f<II<?O
"T�<9/G!6a9<  #9��  " <@ 
  #$
! ?3?39/]933933310#"'53 ##"&54632%"32654&���S11]
#tA��������Q_UWTsgF���tF34�����[_WQ_U>ar   T����       # ' + / 3 7 ; ? C G S [ k t | � �@�A@=<10 TNXHvkp`zg��ED)(%$
	�;g`87/k4,H# N��
 *BZQ�\t\)AF>duulE=�}VKkvk&2%1 BA>\=l12k\lkkl\-,9854!  /333333333/3333333339///9999993333�2�2339333��233933333333333333333333333310!#%5!#533!5353!5!!5!5!#3#35!#35!35!#35#3#3#"&546323254#"%32##32654&##32654#"'53253T/��0m� o��m�I�����mmmm���0oo�w��oooo�mm�����~��s�����mp.,=.m^�{B.$*/;J1%Z^4+V}i�0o��o����/�mm���mmmm�oo���;mm�Joooo�/y�hI�����������aCS1BD5QYb" "�+%J��
fV��r_c   T���   * .@%	+,(""  //9///33910	54676654&#"63232654&#"���T�V�,AgI��O�GR�Z?>1HT;GFBIHCHE�V�W��/2A1R~X��8*�P:/5K6DpJ;��?HI>@IH�����W!&7  L��   �& +5�� �D�    
���+ - 6 f@94%.+-%78GY !.!GY+...	..((1FY(FY ?+ ?+ 99//_^]3+ 3+933333310 ! 47654&#"'6323 4'&$&54632 3%&#"V�����w$ 6!S_X]�w��ɠ��� *����{]aN.A���nX9{z/#	v']]#��:�p?,i�������ׁ�� _K��     {�  (@ 
JY ?+ ??993106632&#"#39z�M\:0((;V|e��#��#7l0�8���U��/�   ��wH  ) L@'!!'
*+ FY$ FY  ?2+ 3?+ 339/99339310"&54!57!##"'#32655332654')�Ǉ����uȹ�DD��?Blu]l�k]umo���JD����綶΄��g���}��z����� �� �  qu& 0   v�T �& +5�� �  �!& P   v�   �-& +5��  ���& $   [5  �� ^���Z& D   [ �  �������� & 2 \�G   	� ?55   u��5��   @  	 /3�2993310#"&546324&#"3265}fexxee~nB33B<95@��axubbuva9<<98==  �h��   @		 /���9310673#%47#"&�F�)w1N���y%]7C��zN�9v�=H)5JD ��   � ' I�   & I    Lm  ��   � ' I�   & I    Om    }��d  ! <@  "#		IY	IY ?+ ?�+ 999333310 !   ! >5332#"���������aCE�2:��h`�u������������q�jh��Cfi��'�������1+'1��   s���  " <@  #$

 FY
FY ?+ ?�+ 999333310 #"&5 32>5332654&#"b����|�ى3:�yfG����������%���ӊ�+�Acn��&���������  ���{  3@
IY ?+ ?�39999333310>53 !  533265:F�!���������Ԫ�Ƹ���>pn�����������F�����   �����  D@"

FY ??+ ?3�939933333310326536653#'##"&5Lz����RJ� ���	4�o��F�;����>y�������RU��� ���S���!  C��  ������!  v��  ������ R�   ���s�  @   /�23339310#'6654&#"563 �s�
iVNCI> &E ׌"q�2++)d
 �;����}  �  	 /�33104632#"&�;;*(::(*;�9669777 �� �  �s& (   C��R �& +5�� �  Rs&�   C hR �& +5�� s��!& H   C�  �& +5�� �  b!&�   C�  �& +5  ����� 1 E@$"*'/		'23 IY((,%%IY ?3+ 3?39/9+ 3933310"'632  #"&'##  32&&#"327332�<^-E~�����l�SP�k� ����|F-]<��ϻ�f�f��Υ/)�P�������a-32.�wSxP�)��������L��7LK0(     H  (@  
 ??339?910#33663 363#&'
����� .J���	-
����۶}!�3��H�I]�5�$����,��R����Z\    �   L@(  IY IY   JY ?+ ?99//+ 3+ 393333310!3!!3 !!!32654&##?���^�1�����h�������ڶ������d��f�+���z     �'   G@& FYFY FY ?+ ?3�9/++ 393333310!!! #!#5353! 54&#�X��?����!��1��H����ͦ���������\T  ���!�   J@)!" IYIY	IY ?+ ??9/3+ 3?+933310"!! 327#  !#3! %2&&������=	�����������dq0նHd�3������7�9pT�P���3N\�0&   ����\ ! Y@2
	 "#FY	FY				 FY  ?+ ??9/_^]3+ 3?+93333310" '!#3!6$32&#"!!3267w����ᦦ!�Q�62�e����	��=wbn
��H�3�� �3�����%�9     m�   4@
IY ?33?9/9+ 39310####3#!'&'�����߲h�g��\LR8@��V��V��J?ϐdb�   
  yH   5@
FY

 ?33?9/9+ 39310#####!&&'#�Ѭ�q�sͬ�!+8"	H������H�-l�j\   �  ^�   F@%

		IY ?333?39/93+ 33933310####!#3!3#!&'������"�_����f��f>v#��P��P��P���n�JH5V/Ch  �  H   M@+
FY/?
 ?333??9/]93+ 33933310#####!#3!#!FΪ�q�nѬ��ߦ�^�h
 YH��������H�3�s"_�     ��  " K@( !$#!!IYJY" ?33?9/33+ 3+ 99933310#.####"#>75!)�Zv�d2���#DeY�[cA ���/c�v�e��
{���H���;�o`&�B�'_o�7ş�I�9     H   # N@*!"%$"  "FYGY#  ?33?9/33+ 33+ 99933310#.####"#>75!���WoI1���":TL
�KR8'���0InW�� ��%Hi��0Pi�qPWG��
@^��P=iO2`i���   �  �� $ ' a@5!&#'%'"#	)(#$&$&IY!IY'!!$ ?333??9/33+ 33+ 99933333310#.####"#67!#3!5!=�]x�e-���Fi_�^dB!���78�R����h��
{���H���;�hc(�D�(_l�7��:�P���酙�7   �  �H $ ' g@:!&#'%'"#	)(#$&$&FY!FY'/!?!!!$ ?333??9/]33+ 33+ 99933333310#.####"#67!#3!5!1��XoI0���":VJ
�
KT7&���/%�ͦ�5��!��%Hi��1Ni�rPVF��?\��Px(�H�5bi���  ?�N5� K �@M !?FF
?7C<*-(LMIJYI941../.	.*@CJY<**$JY*
	IY
IY#IY" ?+ ?+ �+ ?+ 39/+ 9�_^]9�2?+933310327632&#"#"&5467665!#532654&#"'67&''536632&#"�WYaxxF�GP�Diii����̵�@���ᢉj�nV��9u1{\�\�@20+,o0���������抆�72'�3}�~�	�����k�7ErrBy4;�sVq
RG��������	7   �{N F �@N)6. >2@<)GHD>A GY AA/A	A>&FY#FY3232FY&#33#& >>8FY> ",GY ?+ ??3+ 9///+ 9++ �_^]�+ 99333102&#"32772&&##"&5467$54&##53 54#"'67&'5366�3-)/g-z�����]m0KYVz�}'T7��\����N���w7�J�X;|~\g{K�X�Np
O>�k�9Gʔ�*,1+'�wpt}�aZ���"$�7ub4�nU�� m  ��u  �� ����    }����    G@%  IY		IY	IY ?+ ?+ 9/_^]+99333310 !   !  2!"!&���������`D;b�a���+����������n�he��p�D�������� �   s��b\    I@'  FY

FY
FY ?+ ?+ 9/_^]+99333310 #"&5 32 267!"!&&b����|�����
�i	������%���ӊ�+���M����X����      H�   @ JY
 ??9?+3910"#367>32&�;N9�����RH# F�;TnY*O87g�����VǏ����A�     =R  @GY  ??9?+3910!336>32&#"��j��dR`%G[T-&/:�H����dv5z{4
T\����    Hs&�  v�R 
�!& +55��    =!&�  vd   
�"& +55  }�	��   . D@& !.' /0%*JY% 	IY	IY ?+ ?+ ?393?+93310 !   !  32#"%33663#"'532677T��������C,#E����������o��NS��+E��LJ7B^u#=����o�hf��p������1+)/��A���f,��� ���gY��� s�{\ & R    \u    }��-  ( Q@*
&""  
)*$"&&IYIY ?33+ 33?33+ 339333333310 #"'$  %632 6632654'#"'����w|����+|y-�!ʽI6n��ʽnq������s,oo)�61�,ll,�s�����)0&V)1��/'XV'��   s����  - P@*	+%#   	./(%++FY 	FY	 ?33+ 33?33+ 33933333310#"&'&54766326632665%#"&'���	@89=	����>98@	���P}�<5g�|��=35<�}%���%6-+8$&�� $8*+9&����*"Jү`>*  ,�   }��;  E T U@.C7++&FKPH<7
UVR@H:"@:@IY(:4IY.4 ?3+ 3?3+ 3����29/393310#".#"#54632326732#"'632  !"&'#   32&&#"5654.5432�T�xf+/<}tp:pw�N�(X�=7�]�ҥ�<_+Fy������h�LK�n�����yF+^<�����x$\8C�y$+$43gn$,$��B?9HN-(+�R�������b(0-+�uUvR�+��������h�=H)5ID   s�� * ? N \@3((,"@EJB6
OP2:?--6LB
@
FYFY%
FY  ?3+ 3?39++ 3���23�293310"'#"32&#"!273 4&#"'6632#".#"#5463235654.5432+�^\���Ϻ>w(9YGtm1{p>oC-nsGY9(w>���QT�xe+k}sp:qv�N���w$\8CAA#( �3���^P*&���3� ���������x$*$fdo%+%ݡ>H(8JD   ^��  @ _@40$96>6)$AB-'-IY77!'		@	H@';3!3IY! ?3+ 3?3�22�+239/9+ 3933310#'##'##'5"'632 !"&'##   32&&#"3267332�P 2�1!1�/!PC<]-F|�������t�L	N�p�����~F-]<��ҾA�3�f��ԥ�gggg��+)�P�������c001/�rUvP�)��������&&��7LJ1(      �  * ?@$$+,(		@	H# ??33�22�+239?910#'##'##'5#33663 363#&�R2�11�2P�'�����')#���	-
����۶}!��gggg��%_��H�Io�#Q�����,��R����Z\   }���  -@	

 IYIY
 ??+ ?+93310"  !27##  4$32&H���
o9������H���G�3���������t��m�V�T�N  s��\  /@	FY FY  ?+ ?+ ?93310"  32&#"3267#u����O�01�h����5P9�+"�3�����n�   j��u  /@! 
 
	 ?�9910'%7%7%�y���B!���C!�v�!D���A9��CB�s�d�u�=C���s����s  ����  @ 
 	 /332993310#"&5463!6632#�*03)*6�+/3-,6�-2255).0138(  ����  @ �	 /�233991027632#54#"##5x��Qot}j+fy�Tb;:odf$+$y ���5  @

   /�93104632&�C8\$w��8EL6(J@ ���5  @
  
 /�93105654.5432��w$\8C��@J(6LE  )����   ( 6 D R _ m �@I_(DZ">R6mL0gno :HHAOED>LVcc\jf_Zm,,%3/"(6OLjm3663mjLO		 /3/39////////333333333333333333910&&#"#632&&#"#6632&&#"#6632!&&#"#6632&&#"#6632!&&#"#6632&&#"#632!&&#"#6632o<EN2K�]qO<EN2Kdg\s�<DN2Leg\s�/<DN2Leg\s1<DN2Leg\s�/<DN2Leg\s�<DN3K�\s��<DN2Leg\s�,,)/�e]��,,)/Yif\-+'1Zif]-+'1Zif]�-+'1Zif]-+'1Zif]�,,(0�hZ-+'1Zhf\   )�}�     ' . 5 > 4@%% >:),25	?@;+.6/'$3 //9910#67'66737&'&&'57667'67'&'7&&'7F$a5;Ia4#G�A݁�hB�O݁�C�CE�x����E�x+REC{Lj'ZC�&#B�O݁�G�A܂�Ia5;F$a5�'XDnX��Y?DnX���F�c��E�<F2�4   ���^  " Y@/
	 	
$# 	IY"  ?2�2�]2??+ 9933?9333333103333##47##"&'332673ɡ
4���Ŝ�	�ɺC��
�
]nic	�����v�S�����}%���5+��lN]]��  ���   O@*
	! FY	" ?�2�]2??3+ ?9993333331033##47#%"&'332673L
Qϰ��}����칪
�Ztgd
��H�j����G��y��h�ZH���fTZ`��  /  }�   M@)IY IY   JY ??+ 99//3+ 3+93333310353!!3 !!#3 4&##/��V���J�����o�D�{����������d��f�+��     L   K@( FYGY  FY ?+ ?99//3+ 3+93333310!!!2#!#5353! 54&#V'��@�����!���1����嚛����������\T   �  y�   H@)

  
JY	JY		 ??9/99++ 99933310'###! 327'7654&##yslxd�f�������WLll�����9�T�������
�R�H���  ��u\  ) U@1'%"$#
*+%" FY 	  FY  ?+ ???93+ 9993333310"&'##336632'"327'7654&�k�<��@�m���sd�Gm����/)yj�e�OR�"�=4�ZP��������P���%���P�g���   /  �  <@ 


IYIY ??+ 9/3+ 3933310!!!##53�k��X��������w���    BH  <@ 		
	GY

FY ??+ 9/3+ 3933310!!!##53!B�Z������������   �� ��  A@#	IY IYIY ??+ 9/+ ?+933310"#!!63   !"&'53 4 1dZ�I�aZy@U����S}F{�� ��}����
���������1��   ��
�H  A@#FYFY FY  ?+ ??+ 9/+933310"'532654&#"#!!63  F�et{����EJ���R;��
<�?�����%H�����������   ����  M@)	 	  
IY" ?33??+ 933333?393333103333####V���9�:���ڴ�^���������<��<��<����}����   ��H  K@(	 FY	" ??+ ?3?339333339333310333####3��Ŷ�6p��^������7��H�����Z��y-��-��5�� �� J�B5�&�   X  �� D�B\&�       ���+�  ;@ 		
	 IY" ??+ ??39933310%3###33��f�陪��������}ň����+���  ���=H  :@

	 FY" ??+ ??3993331033###3/��'��T���H���X��{+��H��   �  ��  8@

  ?3?3993333310#3733##�}��}}����b��L}�k����%�]������\��  �  ;H  :@

 ?3?39933333310'#3733##�w��w���<���Ձ�y��H��yJ��%k��;�   /  ��  G@&
 IY  	 ?3?39/93+ 3933333103533#3###/��������b��񙪚����n�����ņ��m       M@+

 GY  /     ??9/]3+ 3?39993333310353!!37663###��}��7(p��D���}}��Z����[7J0��-��j�f�    ��  5@

  IY  ?+ ??399933310!3##!�����b��욪����%�����ň��   )  �H  5@		

 
 FY  ?+ ??399933310!3##!)۶�' ��
���H������+���  �����  D@$	  	IY
	 IY" ??+ ??39/+93333310%3##!#3!3�����������}��P���n   ����H  N@+

FY

FY
" ??+ ??39/_^]+93333310!33##!#Vf�������H�5��G��y��H   �  o�  ?@!
 
IY

IY ?3??+ 9/+9333310!#!#3!!o���� �� �����P���n  �  �H  I@'
FYFY ?+ ?39/_^]+ ?9333310!!!#!#Vf������H�5ˌ�D��H  �� �  G@&  IY
IY

IY ?3?+ 9/+ ?+9333310!#!#!63   !"'53 4#"٪�D�D}2Q�����{�z��*����a��������1�1��   ��
�H  G@&
FYFY FY  ?+ ?3?+ 9/+9333310"'5324&#"#!#!632 �aml�CH��ߦoKB���
<�?����)��HH�'��������  }���� ( 4 P@,/#)   #56&,JY2&&IY
IY
IY ?+ �+ ?+ 9/99+933310327#"'#   !2&# 327&54324&#"66��tBZN=8[��f�����I:\/TZ�3��6.V\Ư���g]^g]Sfs����V�d$�Vx�#�������
g��
������ɰ��UC�   s���\ 
 5 P@, &,4,/$&67)GY))FY1FY!FY ?+ �+ ?+ 9/99+9333106654#""'#"&&532&#"3267&54632327�D?DS�HKf��`{��z��[M%6O����%5�����k^4CB1'�^�5,�n�}�cM(���0�����	�����}�@� �� }�B��& &   %  �� s�B�\& F   �    ��Z�  2@		IY	"IY ?+ 3??+93310!5!!3##��1J�1������}��}   )���H  4@			"FYFY ?+ ?+ 3?93310!5!!3##���h������������y ��    {� <     �H  )@  ???39939310#33673T��R��S!F��R��L���a��e��      {�  :@		IY 		 ??39/93+ 39333103!!#!5!53=���+�լ��-������;���d�3�   �H  <@ GY ??3+ 3?393933310#!5!33673!T����T��S!F��T���k�H���a��e���   ����  7@ 	
	
 IY" ??+ ??399310%3###333��^�w�p���;�kn��;���}��}����C�L  '��7H  9@!
		  FY
" ?3??+ 9?9310333###����! ���+��E���ʼ1�\����^��{��D   ����  @@" 
IY IY" ??+ 3?+ 3?933310%3#!!5!!!3������V/�%���}���}  )���F  ?@"	 FYFY	" ???+ 3?+ 3933310!!33#!!5!y��F����x��P�����I��y��   ���h�  ;@ 	IY IY" ??+ ?39/+9333310%3###"&5332673ǡ����j�ߪ�a������}\5'��E��yt7�   ����H  ;@	FY	FY" ??+ ?39/+9333310326733###"&5B�[�i����i�q��H�p�8C��G��{�H;���  �  ��  J@&  IY		 ?3?9///3+ 3933333310 333673##u�5���}������} qE��wv\��<��JXA��  �  H  J@&FY	 ??39///3+ 39333333103673##5#"&5B�wq����vw��H�p�-��Y����[�ꪕ�  �  ��  /@	IY	  ??39/9+99333103$32#4&#"#ɪ ��ߪ�k������\����1xv"2�5   �  BH  /@ FY	  ?3?9/9+9933310!4#"#36632��X�w��_�r����1J�-H�E>���f  =��?�   ' Q@* $% ()IY$IY!IY ?+ ?+ 99//3+ 3933333310473337 !  ! 3267#  "&"!&=�q"M)(���eʍr݂���������n��I62<g+*G����E����+�'dLv#���	�   3���Z  & L@(
$'(FY#  FY FY  ?+ ?+ 99//3+ 39333310" '$54733376632!3267"!4&J������j"�������e�bX����=���E2/;g#�����i�� *�&!㤞��  =��?� " ) ]@1	&!"'"*+"" IY& #IY JY  ?+ ?+ 99//3+ 3??9333333310$ "&5473337 !  ! 3267#"!&��������q"M)(���eʍ��L��n�Z1vuI62<g+*G����E����+�>������	�  3���Z ! ( X@/
 !&!)*!"FY% "FY FY  ?+ ?+ 99//3+ 3??93333310&'$54733376632!3267#"!4&տ����j"�������e�b���D��=�
��E2/;g#�����i�� *�A��H���� �� T  V� ,  ��   �`&�  6T �& +5��   �&�  6 �   �& +5  �� �  B@%	
IYIY JY ??39/9++ ?+933310"#337   !"&'53254$^�_������Ob����R|Fz�����{����<��T���������1���   ��
!H  B@%  

FYGYFY ??39/9++ ?+933310!#33#"'532654&#"T����7 �n̅�_.lG����R\H����������<�&����   ����  9@ IYJY IY" ??+ ?+ ?+933310%3##!'"'53266!ٸ�Ŝ��%=]�~J;6;5O=]8���}��!�E��W�Y�   ���F  9@ FYGY FY" ??+ ?+ ?+933310%3##!#"'532!߰��}���^�v:q�"����y����d�
��   �� �  =@   IY	IY ?+ ??39/+9333310% !"&'53 !#3!3����RzM{�������������1�#�P���n  ��
bH  G@'
FY FY  ?+ ??39/_^]+9333310"'53265!#3!3ӄ]of}v����d���
:�=����H�5�������  �����  D@$	 	IY
	 IY" ??+ ??39/+933333310%3##!#3!3��Ş���������}��P���n   ���F  D@$
	
FY

FY
" ??+ ??39/+933333310!33##!#Vf����}����F�7��I��y��F   �����  =@   	IY"IY ?+ ??39/+9333310!##3#"&5332673Ǫ����j�ߪ�a������5'��E��yt7�  ���-H  =@ 		FY
"
FY
 ?+ ??39/+933331032673##3#"&5B�[�i����i�q��H�p�8C�����
aH;���  ���)�  H@%	IY"  ?3?3??+ 9933933333310!##!333##47#P�� �����Ǟ���/�^��J�����}�����   ����F  ?@ 
	
 
FY
" ??3+ ??39939333310%7733###&'#3�+)Ӱ��}�:����5��)-�]v��I��y�:��J��K�wF�-n�� T  V� ,  ��    ^& $  6 9R �& +5�� ^���& D  6�  �%& +5��    %& $   j =R 
�$& +55�� ^����& D   j�  
�:& +55����  �� �  �� ^��s\ �  �� �  �^& (  6 R �& +5�� s��& H  6  �& +5  u��X�   =@ 		IYIY IY ?+ ?+ 9/+933310"5663   ! 5! 27!���s҆Ko������/��������5L�& �q�����q�F
�N����   f��\   ;@		
FY

 FY FY  ?+ ?+ 9/+9333102  #"55!&&#"566267!����������b�_Y�����Í\���������i̻!)�("����� �� u��X%&�   j �R 
�/& +55�� f���&�   j�  
�1& +55��   �%&�   jR 
�'& +55��   ��&�   j �   
�'& +55�� J��5%&�   j��R 
�>& +55�� D���&�   j�  
�8& +55  J��7�  @@# IY JY  JY ?+ ?9/++ 3933310! '532654&##5!5!�$�������`�j���ߌ��N�?	����O�.2�����ޙ�   ��H  @@# 	FY GY  FY ?+ ?9/++ 3933310 #"'532654&##5!5!������ꊷȡ���y���8�rʈ���F�V����r��{ �� �  R�&�  M �R �& +5�� �  bb&�  M1  �& +5�� �  R%&�   j �R 
�%& +55�� �  b�&�   j=  
�#& +55�� }���%& 2   j �R 
�-& +55�� s��b�& R   j  
�.& +55�� }����~  �� s��b\  �� }���%&~   j �R 
�/& +55�� s��b�&   j  
�0& +55�� =���%&�   j��R 
�0& +55�� 9��}�&�   j�  
�0& +55�� ����&�  M /R �& +5�� �b& \  M�  �& +5�� ���%&�   j ;R 
�,& +55�� ��& \   j�  
�+& +55�� ���s&�  S �R 
�*& +55�� �!& \  S  
�)& +55�� �  �%&�   j jR 
�)& +55�� �  -�&�   j  
�(& +55  ���� 	 -@		
	IY	" IY  ?+ ??+93310!!3##�?�k������}��}  ���BF 	 -@		
	FY	" FY  ?+ ??+93310!!3##������F�����y�� �  
%&�   jR 
�-& +55�� �  y�&�   j �   
�,& +55�� /�u�&�   � �  �� �uBH&�   �u �� �u�� & ;   �X  �� '�u4H & [   ��      ��  ;@"
	
 IY   ?3?39/993+ 3910!33!!##!3�w�kl��p<�����w�p����Tb��E����D��}�   '  H  ;@"
	
 GY   ?3?39/993+ 3910!33!!##!u���! �����h����ʼf��w��\��/��
��D�   �  7� 
  4@  IYJY ??+ 9/+99333104$!33! $#"33�$ ƪ�c����
��¶�����p�J��|����� s��7 G    ���w�  # F@$

##$%IY    JY  ?2+ 3?99//9+93339310"&54$!3332653#"&'#"!265N��*"���dy�ϸv�3q)���!�����p���{n����RZ������wp   s��� " . Q@),  &&/0 *FY ##FY	 ?3+ 3?+ 9/99?933339310%2653#"&'##"323&&53!26554&# �vk�Ƚ��+K������j�?�m��������w��9����[qq[)/MUp�������#���N��  N���� * K@((""+,JY  %%IY%	JY ?+ ?+ 99//+ 9933310#532654&#"'663232653#"&'&&����՚�g�gT]������bl|wp�ҽ�������l7ErHPħ��3�іy���)���Ȗ�  P���\ % K@(
$$ &'!FYFY FY ?+ ?+ 99//+ 9933310%23# &&##53 54#"'6632Bݦ�������o!�K�M9U�h���c{	w9����McX���$"�($���9zj�  N���� # J@(#!  #$%JY##IY#!"JY ?+ ??+ 9/+ 99333104&##532654&#"'66323##������ᤇi�iTa�������ì��������k�:BrJNħ��������}   P��Z  J@( FYFY"
FY ?+ ??+ 9/+ 99333104!#53 54&#"'6323##��˖u9�w��=�˿��~p���-Ǎ�RPF�J���9%�f���y    ��!� # :@##	$%IYJY  ?3+ 3?+ 9/93310!#"'53266!32653#"&5�H+LS�dE@2?1@,8J7�ospq�ͼ������D�f�>h���ωyy���)����   ��)F  :@ FYGY ?3+ 3?+ 9/93310323#"&5!#"'532!�hwզ������^�v:q�"q���
;������=���d�
��   ���^�  C@# 		IYIY ?+ ??399//+9333331032653#"&5!#3!3�nspq�ȿ���'��٪��yy���)����3�P���n   ����H  M@*
FYFY ?+ ??399//_^]+93333310!3323#"&55!#VP�jwզ�������H�5��=��9������s�H   }����  :@ IY  IYIY ?+ ?+ 9/+93310! !  4$32&&#   3 !f4���������U�x�SBZ�W��������V�����`�T�1'�&.���������   s���\  :@ FY  

FY
FY ?+ ?+ 9/+93310!!   !2&#"3265!��������C!ԯ;�����ũ���?C��'+P�J���ߠ�   ����  9@
 IY  IY ?+ 3?+ 9/933105!!323#"&5<�/wr�ӽ�����h�{ ��)�����   )���F  6@

 FYFY ?+ ?9/+ 393310!323#"&5!5!���mvצ������X��ɉ�A������?�  o��X� & G@&  $##  '(#JYJY	JY ?+ ?+ 9/+ 99333104$3 &&#"33#"327! $54675&&���^i�e��������ʷ�ǯ������ϼ��\�ƐxD4{r�������\�M�ŗ���� Z���\�  ��  �uk� &�   ��  �� �usH&�   �  ��  ���& $   g�  �� ^���Z& D   gy  ��    �& $  f�R �& +5�� ^����& D  f�   �)& +5��    �& $  w�R 
�& +55�� ^��A& D  w�   
�+& +55��    �& $  x�R 
�& +55�� -���& D  x�   
�+& +55��    J& $  y�R 
�& +55�� ^���& D  y�   
�+& +55��    b& $  z�R 
�-& +55�� ^���& D  z�   
�C& +55��  ��s& $   'g�  K +R �)& +5�� ^���!& D   'gy  K�  �>& +5��    & $  {�R 
�& +55�� ^����& D  {�   
�-& +55��    & $  |�R 
�& +55�� ^����& D  |�   
�-& +55��    X& $  }�R 
�!& +55�� ^���& D  }�   
�7& +55��    ^& $  ~�R 
�'& +55�� ^���& D  ~�   
�=& +55��  ��I& $   'N -dg�   �& +5�� ^����& D   &N� gy   �%& +5�� �����& (   g�  �� s��\& H   g�  �� �  ��& (  f�R �& +5�� s���& H  f�   �& +5�� �  �/& (  R��R �& +5�� s���& H  R�  �$& +5�� �  o�& (  w�R 
�& +55�� s��\& H  w�   
�!& +55�� ]  ��& (  x�R 
�& +55�� J��& H  x�   
�!& +55�� �  9J& (  y�R 
�& +55�� s���& H  y�   
�!& +55�� �  �b& (  z�R 
�*& +55�� s��& H  z�   
�9& +55�� ����s& (   'g�  K R �%& +5�� s��!& H   'g�  K�  �4& +5�� T  V�& ,  f�R �& +5�� {  ��& �  fs   �& +5�� T��V�& ,   g�  �� ���f�& L   gb  �� }����& 2   g  �� s��b\& R   g�  �� }����& 2  f�R �& +5�� s��b�& R  f�   �& +5�� }����& 2  w}R 
�& +55�� s��u& R  w�   
�& +55�� }����& 2  x}R 
�& +55�� a��b& R  x�   
�& +55�� }���J& 2  y{R 
�& +55�� s��b�& R  y�   
�& +55�� }���b& 2  zyR 
�6& +55�� s��b& R  z�   
�7& +55�� }���s& 2   'g  K �R �1& +5�� s��b!& R   'g�  K  �2& +5�� }��ds&_   v+R �+& +5�� s��!&`   vm  �+& +5�� }��ds&_   C �R �#& +5�� s��!&`   C�  �$& +5�� }��d�&_  f�R �&& +5�� s���&`  f�   �'& +5�� }��d/&_  R �R �+& +5�� s���&`  R�  �#& +5�� }��d&_   g{  �� s���&`   g�  �� ����& 8   gJ  �� ���9H& X   g�  �� ����& 8  fTR �& +5�� ���9�& X  f�   �& +5�� ���{s&a   v �R �%& +5�� ����!&b   vy  �&& +5�� ���{s&a   C ZR �& +5�� ����!&b   C�  �& +5�� ���{�&a  f`R � & +5�� �����&b  f�   �"& +5�� ���{/&a  R R �%& +5�� �����&b  R�  �& +5�� ���{&a   gL  �� �����&b   g�  ��  ��{�& <   g�  �� �H& \   g�����    {�& <  f�R �& +5�� ��& \  fj   �& +5��    {/& <  R��R �& +5�� ��& \  R�  �& +5�� s���& �    B �   �����! 	  @
  � /3�2339910#&&'53#&&'53��`4�%�c1��`8�%�c1�*�?=�D,�?=�D  �q���   (@ 


� /3�99//9339910#&'#57673'673#��^pcra^5p4�B�PI6�Sx`�K[eA<{M^��[pn`  �����   *@  


� /3�99//9339910#&'#57673%#&'53��^arji^5p4�B���_xT�4K�Ae`F<{M^��^pla �q��{�   4@ !


� /3�299//93339310#&'#57673#'6654&#"5632��^pcra^5p4�B��P
9?9+.7��K[eA<{M^�{gQ�	 &%P �h���  % :@		'"	 "  "� /�9///3�339339910".#"#663232673#&'#57673�-%GC?(*[eK%IC>(*Zc^^arji^5p4�B�5%12jq$11hs��Ae`F<{M^� �y����   $@

@
� /3�2��339910673# 332673�^P1�Vw`>��f	LjbVi��her]��H9A@x� �y����   $@

@
� /3�2��339910#&'53 332673��^wV�4K5��f	LjbVi��]rla��H9A@x� �y���   .@   � /�239/�2339310#'6654&#"5632 332673�1R
9B9,%$>����f	LjbVi�yd)Z	 %%N��H9A@x� �h���  $ 0@"		&@	 !� /�2��3�39/3329910".#"#663232673 332673�-%GC?(*[dL%IC>(*Zc���f	LjbVi�3$02hq$11gr��H9A@x�  1�Bm    @ 
 /�293104'3#"'5326ߋ{�fcA2 6%3�g�x�[gl
0   �uq �  @	
    /�299310%#"'5325q�8<)=^������d0   �uq �  @	
    /�299310%#"'5325q�8<)=^������d% �� 4  C�  �x    s��s   (@  	KY	&MY ?+ ?+993310#"3232654&#"�����������������/����55�����������   -  7^ 
 &@	  	 ??99//993310!#47'37�C>�Z�1�C0pr#  )  �s  ,@ 
KY&LY ?+ 3?+9310!!5>54&#"'632!��R��q,�wX�\Z���ڂ�����/whSAWg=Jm���s���   ^��t ' G@&  "()KY
%%KY%&
KY
% ?+ ?+ 9/+ 9933310!"&'53 !#532654&#"'6632������t�[_�`{�^���ȓ~`�mTZ���������#,�/1)
���kz4FpGQ�   ��f^ 
  B@!	 MY	$ ??9/933+ 393333310%##!533!47#f٨�2�����
)D�9��s}��D\��V\��   ���_  :@ KY  LYKY% ?+ ?+ 9/+933102 #"'53265!"'!!6-�	�����F�e����^�V7���%s&�����O�-3��27���I �� u��/�     ^��+_  @ LY $ ??+9310!5!^������������� h��)�     j��%t  % A@""

  &'MY
KY&MY% ?+ ?+ 9/9+933310!"'532##"&5432"326654&&%�htDPf��7�r���Е�x�����[�XR�����)3SW������0����J�Fi�f ��   � ' I�    I    \��� " 3 Z@.,00.*&&(
  (.54+1$-/-)/##(
()) ?3/3�2/3993339933333310#"'53254&&'&&54632&#"##33#7#H�|�Jjw�6UxQ�n}\"dS<K+_�P��w��˴��bm!l(d!(!,[LVi'c%.($$2Z��/��R���/�/������ �Z�& 7    z?  �� ��F& W    z �    q�7\  * G@&
**$+,!'FY$!FY FY ?+ ?+ 99??3+9333310%26754&#"47##"32373#"'53265L��������	p������{����K�v��w��+������k$c�-
1������F�*.���� q�7!&�  K  �9& +5�� q�7�&�  N  �+& +5�� q�7�&�  OV   �4& +5�� q�7!&�  :w  �/& +5  �  s�  �   ??91033ɪ��J ��   �s&�   C�|R �& +5�� �  <s&�   v�*R �& +5����  is&�  K��R �& +5��   8%&�   j��R 
�& +55����  �/&�  R��R �& +5����  K�&�  M��R �& +5����  S7&�  N��R �& +5�� V�B��&�   Q1 �� �  1&�  O R �& +5�� ���� &�    -;  ����  
 '� �  T���� �  ?5 �� �  s��  ��   8%&�   j��R 
�& +55�� �  s��  ��   8%&�   j��R 
�& +55�� �  s��  �� �  s��  �� �  �&�  f�R �& +5�� ����&�   g}     � �  V    / \   �         Q w �{�j���A_t���[��F��4���Dd�A��		U	�	�

9
l
�
�
�V��,y��$K���6Or���$y�T�(f��'��O��(h��G���K���S����G�������c���El���{������+7HYj|����*;L]n��  * ; L ^ o �!!(!8!H!X!i!z"""!"1"A"R"c"t"�"�"�###/#?#O#`#�$$$,$<$M$]$�$�$�$�$�%%%%0%@%Q%a%r%�%�%�%�%�%�&:&K&[&l&|&�&�&�&�&�&�&�&�'	''*';'G'W'h'y'�("(3(D(U(f(w(�(�(�(�(�(�(�(�) )))L)])n)y)�)�)�)�)�)�*-*>*N*Z*e*v*�*�*�+'+8+H+Y+i+{+�+�,i,z,�,�,�,�,�,�,�,�----.->-I-T-e-u-�...%.6.F.W.g.y.�.�.�.�.�.�.�.�///+/;/L/]/n/~/�/�0w11'181I1Y1d1o1�1�1�1�22T2{2�2�33N3_3g3x3�3�3�3�3�3�3�3�444"4*424�4�4�4�4�4�55525:5q5y5�5�5�6<6�6�6�6�6�6�6�77k7�88g8�99L9�9�9�:,:4:_:�:�;;\;�;�<%<]<�==_=�=�=�=�=�>>>o>�>�>�>�>�>�?S?�?�?�@@7@?@�@�@�@�@�A,A�A�A�BB<BDBLBTB\BdBlBtB�B�B�B�C+C[C�C�D#DaD�EEVE^E�FF4F|F�F�G#G[GkG�G�HHIHQHuH}H�H�H�IIILI�I�I�J4J}J�KKeK�K�L%L5L�L�L�L�L�MMXM`MpM�M�M�M�NNN/N@NRNdNuN�N�N�N�N�N�OOO:OiO�O�O�PZPzP�Q$Q,Q4QWQ{Q�Q�Q�RR�R�SnS�T,T�T�T�UKUbUyU�U�V
V>VcV�V�V�W2WbW�X,X>XPX}X�X�X�X�YY!Y@YuY�Y�ZMZnZ�['['['['['['['['['['['['['['\q\�\�\�]l]�^^^-^9^E^W^�^�^�^�_@_�_�`1`:`C`L`z`�`�`�`�`�aNa�a�b;b�b�c?c�c�d,d�d�eie�f�g0g8g@g�g�h/hghyh�iii�i�j�k;k�l:l}l�mm3m`m�m�n�oo�o�p1p�p�qCq{q�rrUr�r�sssPs�s�ttXt�t�uu]u�u�vvsv�wBw�w�w�xx4x<xox�x�y0yqy�y�z0zsz�{{C{z{�|K|�}-}5}F}W}�}�~D~�~�U�ڀ�o���ŀր���	���*�:���ځ����!�3�D���ڂ�����0�A�I�Q�c�t���������ʃۃ����!�L�w�����������ʅ�V�������d�ɇ'���Ԉ+�y�ĉ�f����-�����������ӊ�����,�>�P�b�t���������Ӌ���	��-�B�V�b�n��������ÌՌ�����/�A�V�j�{�����������͍ލ����&�8�J�\�n���������Ɏَ�����(�4�@�L�]�n����������ҏ������#�4�E�V�f�r�����j���2�{�͒���;�D������N���ޔ�	��n�z�����q���������ǖؖ�����.�?�J�[�g�y�������������Η�      �=�}_<� 	     �51�    �+������	�b   	       � �        # �5 �+ 3� �� h� q� �^ R^ =j V� h� ?� T! �� � f� �� d� ^� +� �� u� ^� h� j! �! ?� h� w� ho 1 y  / � }� �s �! �� }� �� T#�`� �' �9 � �; }� �; }� �d jm � ��  h � {  � R� �� � 3V 1�����s ^� �� s� s} s� b '� � ���3 � �q �� �� s� �� sD �� j� � �  9 1 ' � R =h� H� h  # �� �� ?� {� h�! {�5� d� F� R� h� T� d ��m � h� 1� !��� �= q! �� %� L  B� P= K= .= o 3            ��� }s �s �s �s �� <� T���� <� / �; }; }; }; }; }� �; }� �� �� �� �{  � �� �s ^s ^s ^s ^s ^s ^� ^� s} s} s} s} s�� ������ q� �� s� s� s� s� s� h� s� �� �� �� � � �   s ^  s ^  s ^ }� s }� s }� s }� s� �� s� /� ss �} ss �} ss �} ss �} ss �} s� }b '� }b '� }b '� }b '� �� ��  � ������ *��� ��� T 5� T �� T �#�`��� �3 �% �' � �' � Y' � �' �� �/ �� �� � �� � �� �s  �� �; }� s; }� s; }� sb }� q� �D �� �D `� �D �d j� jd j� jd j� jd j� jm � m � m � � �� �� �� �� �� �� �� �� �� �� �� �h 9 {   {  � R� R� R� R� R� R� �� �  s ^���� ^; }� sd j� j���-�% ��o� %�� ����  ! ����}�����������������  / �) �� 's �� R� �; }� T� ��  9 � �m H; }� �� �� Jm {  b j� ^ mB P� <{  � s� Z� �� �� �� s � 
� q� Z� s� �� s� �% �F��� �V  � q� s3 � �� s� s� � �� s^�� �/ s� 	� �� s� �/ ss �� ) � }d j� T� <#�`o  � �� � �� � �  � �/ �) �w s �� � J � �� ��  9 �� �; }� �� � }m � b j� � �� �B �D �� � �% �
 =f � 3s ^� w� �m �� )} s� � D � �' �� � � �� s� �� �� s� ) � q1 ' �� � �- �� )) �� �� 9� �q %} s� m �� s� j ������  �� ' � � �7 �m �h 9 h 9 h 9 {     R  R  RJ��\ \ � ?\ � � =  { { �F �	� d� �% �o Ro P� �
�y' m� b� D �� ?� �) w' �5 %B P� f= G=  = G= j� f� '� � L� hd %� w � b� h� h� h� o� � � ��� � q �� '� � ;� )� 9� 3� #            �     V  y  !  �   �            T  T��\ � 
�  � 9 �q �  s ^R��� u3 �u u = }� s% �R �  �S  �  �  �  �;s � �} s � ��  f  Z �� �m  � 
^ �! �� # � �� �� ?� ^ m �= }� s        	� }} s� }B s� }w s� ^�   }� s� ju �� ������ )� )) �% �� /� � �� �7 /m # �3 � = � J� DJ �\ �� �D �� /# � � )� �/ �� �� �� �� �; } s }� sm � ){    {    � V '� � )� �� �� �� �� �� �� =F 3� =F 3� T� � � �d ��  � � �� �� �9 �� �� �; �� �� T  s ^  s ^���� ^s �} s� uy f� uy f� � � J� D� J�  � � � �; }� s= }� s= }� s
 =� 9�  �  �  � �� �7 �m �� �) �7 /m � R '� 1 '� �� s1 �+ s; Nj P  N/ P�  �  �N � } s� - )� o� Z�  �   s ^  s ^  s ^  s -  s ^  s ^  s ^  s ^  s ^  s ^  s ^  s ^s �} ss �} ss �} ss �} ss ]} Js �} ss �} ss �} s� T {� T �; }� s; }� s; }� s; }� a; }� s; }� s; }� s= }� s= }� s= }� s= }� s= }� s� �� �� �� �% �R �% �R �% �R �% �R �% �R �{   {   {   � s  ��  �q  ��  �q  �h  �y  �y  �y  �h� 1� � - 4� s� - )� ^� � �� u� ^� h� jm Z \m � � q� q� q� q� q; �; ; �;��; ;��;��;��; V; �^ ����; �  �  � � � �     ���  	����{	�               � ��   �3  �3  � f�� �@  [   (    1ASC @  ��� ��X  �    H�              |   � �  F H I ~ � �'2ac�����7�����	#�����������OP\_�������?������M    " & 0 3 : < D p y  � � �!!!! !"!&!.!^"""""""+"H"`"e%��������     I J � � �(3bd�����7����� 	#����������� PQ]`������� >������M       & 0 2 9 < D p t  � � �!!!! !"!&!.!["""""""+"H"`"d%�� ��������M�������  ��-���� � � a�I    �������v�h�c�b�] g�D�� ���� 	�����������  �����  ���h�	���	���	�X��z�}  �}��{��B������������������������v�t  ���	�n���������%�"������������i  OS              �                 �                                             �       �                         �                                       v                                       R      � �� �� �� �� ��IJ$%h������������ik���F�u�45]^@G[ZYXUTSRQPONMLKJIHGFEDCBA@?>=<;:9876510/.-,('&%$#"!
	 , �`E�% Fa#E#aH-, EhD-,E#F`� a �F`�&#HH-,E#F#a� ` �&a� a�&#HH-,E#F`�@a �f`�&#HH-,E#F#a�@` �&a�@a�&#HH-, < <-, E# ��D# �ZQX# ��D#Y ��QX# �MD#Y �&QX# �D#Y!!-,  EhD �` E�Fvh�E`D-,�
C#Ce
-, �
C#C-, �(#p�(>�(#p�(E:� -, E�%Ead�PQXED!!Y-,I�#D-, E� C`D-,�C�Ce
-, i�@a� � �,���� b`+d#da\X�aY-,�E����+�)#D�)z�-,Ee�,#DE�+#D-,KRXED!!Y-,KQXED!!Y-,�%# �� �`#��-,�%# �� �a#��-,�%� ��-,�C�RX!!!!!F#F`��F# F�`�a���b# #���pE` � PX�a�����F�Y�`h:Y-, E�%FRK�Q[X�%F ha�%�%?#!8!Y-, E�%FPX�%F ha�%�%?#!8!Y-, �C�C-,!!d#d��@ b-,!��QXd#d��  b� @/+Y�`-,!��QXd#d��Ub� �/+Y�`-,d#d��@ b`#!-,KSX��%Id#Ei�@�a��b� aj�#D#��!#� 9/Y-,KSX �%Idi �&�%Id#a��b� aj�#D�&����#D���#D����& 9# 9//Y-,E#E`#E`#E`#vh��b -,�H+-, E� TX�@D E�@aD!!Y-,E�0/E#Ea`�`iD-,KQX�/#p�#B!!Y-,KQX �%EiSXD!!Y!!Y-,E�C� `c�`iD-,�/ED-,E# E�`D-,E#E`D-,K#QX� 3��4 �3 4 YDD-,�CX�&E�Xdf�`d� `f X!�@Y�aY#XeY�)#D#�)�!!!!!Y-,�CTXKS#KQZX8!!Y!!!!Y-,�CX�%Ed� `f X!�@Y�a#XeY�)#D�%�% XY�%�% F�%#B<�%�%�%�% F�%�`#B< X Y�%�%�)�) EeD�%�%�)�%�% XY�%�%CH�%�%�%�%�`CH!Y!!!!!!!-,�%  F�%#B�%�%EH!!!!-,�% �%�%CH!!!-,E# E � P X#e#Y#h �@PX!�@Y#XeY�`D-,KS#KQZX E�`D!!Y-,KTX E�`D!!Y-,KS#KQZX8!!Y-,� !KTX8!!Y-,�CTX�F+!!!!Y-,�CTX�G+!!!Y-,�CTX�H+!!!!Y-,�CTX�I+!!!Y-, �#KS�KQZX#8!!Y-, �%I� SX �@8!Y-,F#F`#Fa#  F�a���b��@@�pE`h:-, �#Id�#SX<!Y-,KRX}zY-,� KKTB-,� B�#�Q�@�SZX�   �TX�C`BY�$�QX�   @�TX�C`B�$�TX� C`B KKRX�C`BY�@  ��TX�C`BY�@  �c� �TX�C`BY�@  c� �TX�C`BY�&�QX�@  c� �TX�@C`BY�@  c� �TX��C`BYYYYYY� CTX@
@@	@�CTX�@�  	 ���CRX�@���	@�@�� 	@Y�@  ��U�@  c� �UZX� � YYYBBBBB-,Eh#KQX# E d�@PX|Yh�`YD-,� �%�%�#> �#>��
#eB�#B�#? �#?��#eB�#B�-,���CP��CT[X!#� ���Y-,�Y+-,��-@�	!H U UHU?�MK&LK3KF%&4U%3$U���JI3IF%3UU3U?�GF�F#3"U3U3UU3UO�� U3 Uo  � �  ����TS++K��RK�	P[���%S���@QZ��� UZ[X��Y��� BK�2SX� YK�dSX�� BYss++^stu+++++t+st+++++++++++++st+++^     N�  u��              H  �  ��    ��    ��  ���  � ������������ ��                                                            � � � � � � � � � �      �  	   r    	   r  	   �  	  4 �  	  " �  	   �  	      	  �   	  (�  	  8�  	  \$  	  \�  	  T� D i g i t i z e d   d a t a   c o p y r i g h t   �   2 0 1 0 - 2 0 1 1 ,   G o o g l e   C o r p o r a t i o n . O p e n   S a n s R e g u l a r 1 . 1 0 ; 1 A S C ; O p e n S a n s - R e g u l a r O p e n   S a n s   R e g u l a r V e r s i o n   1 . 1 0 O p e n S a n s - R e g u l a r O p e n   S a n s   i s   a   t r a d e m a r k   o f   G o o g l e   a n d   m a y   b e   r e g i s t e r e d   i n   c e r t a i n   j u r i s d i c t i o n s . A s c e n d e r   C o r p o r a t i o n h t t p : / / w w w . a s c e n d e r c o r p . c o m / h t t p : / / w w w . a s c e n d e r c o r p . c o m / t y p e d e s i g n e r s . h t m l L i c e n s e d   u n d e r   t h e   A p a c h e   L i c e n s e ,   V e r s i o n   2 . 0 h t t p : / / w w w . a p a c h e . o r g / l i c e n s e s / L I C E N S E - 2 . 0         �f f                    �          	 
                        ! " # $ % & ' ( ) * + - . / 0 1 2 3 4 5 6 7 8 9 : ; < = > ? @ A B C D E F G H I J K L M N O P Q R S T U V W X Y Z [ \ ] ^ _ ` a � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � b c � d � e � �	 � f � � � � g � � � � � h � � � j i k m l n � o q p r s u t v w � x z y { } | � �  ~ � � � � �
 � � �  !" � �#$%&'()*+,-./0123 �456789:;<=>?@AB � �CDEFGHIJKLMNOPQ � �RSTUVWXYZ[ � � � �\]^_`abcdefghijklmnopq �rstu � �v �wxyz{|}~ � � � � � � � � ��������������������������������������������������������� ������������������������������������������������������������������������� 	
 !"#$%&'()*+ � �,- � � �. � � � � � � � �/0 � �1 �2 �345678 � �9:;<= � � � � � � � � � � � � �>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~�������������������������������������������������������������������������������������������������������������������������������� 	
 !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~�������������������������������� , � � � ����� �����������nullI.altuni00AD	overscore
Igrave.alt
Iacute.altIcircumflex.altIdieresis.altAmacronamacronAbreveabreveAogonekaogonekCcircumflexccircumflexCdotcdotDcarondcaronDcroatEmacronemacronEbreveebreve
Edotaccent
edotaccentEogonekeogonekEcaronecaronGcircumflexgcircumflexGdotgdotGcommaaccentgcommaaccentHcircumflexhcircumflexHbarhbar
Itilde.altitildeImacron.altimacron
Ibreve.altibreveIogonek.altiogonekIdotaccent.altIJ.altijJcircumflexjcircumflexKcommaaccentkcommaaccentkgreenlandicLacutelacuteLcommaaccentlcommaaccentLcaronlcaronLdotldotNacutenacuteNcommaaccentncommaaccentNcaronncaronnapostropheEngengOmacronomacronObreveobreveOhungarumlautohungarumlautRacuteracuteRcommaaccentrcommaaccentRcaronrcaronSacutesacuteScircumflexscircumflexTcommaaccenttcommaaccentTcarontcaronTbartbarUtildeutildeUmacronumacronUbreveubreveUringuringUhungarumlautuhungarumlautUogonekuogonekWcircumflexwcircumflexYcircumflexycircumflexZacutezacute
Zdotaccent
zdotaccentlongs
Aringacute
aringacuteAEacuteaeacuteOslashacuteoslashacuteScommaaccentscommaaccenttonosdieresistonos
Alphatonos	anoteleiaEpsilontonosEtatonosIotatonos.altOmicrontonosUpsilontonos
OmegatonosiotadieresistonosAlphaBetaGammauni0394EpsilonZetaEtaThetaIota.altKappaLambdaMuNuXiOmicronPiRhoSigmaTauUpsilonPhiChiPsiuni03A9Iotadieresis.altUpsilondieresis
alphatonosepsilontonosetatonos	iotatonosupsilondieresistonosalphabetagammadeltaepsilonzetaetathetaiotakappalambdauni03BCnuxiomicronrhosigma1sigmatauupsilonphichipsiomegaiotadieresisupsilondieresisomicrontonosupsilontonos
omegatonos	afii10023	afii10051	afii10052	afii10053	afii10054afii10055.altafii10056.alt	afii10057	afii10058	afii10059	afii10060	afii10061	afii10062	afii10145	afii10017	afii10018	afii10019	afii10020	afii10021	afii10022	afii10024	afii10025	afii10026	afii10027	afii10028	afii10029	afii10030	afii10031	afii10032	afii10033	afii10034	afii10035	afii10036	afii10037	afii10038	afii10039	afii10040	afii10041	afii10042	afii10043	afii10044	afii10045	afii10046	afii10047	afii10048	afii10049	afii10065	afii10066	afii10067	afii10068	afii10069	afii10070	afii10072	afii10073	afii10074	afii10075	afii10076	afii10077	afii10078	afii10079	afii10080	afii10081	afii10082	afii10083	afii10084	afii10085	afii10086	afii10087	afii10088	afii10089	afii10090	afii10091	afii10092	afii10093	afii10094	afii10095	afii10096	afii10097	afii10071	afii10099	afii10100	afii10101	afii10102	afii10103	afii10104	afii10105	afii10106	afii10107	afii10108	afii10109	afii10110	afii10193	afii10050	afii10098WgravewgraveWacutewacute	Wdieresis	wdieresisYgraveygrave	afii00208underscoredblquotereversedminutesecond	exclamdbl	nsuperior	afii08941pesetaEuro	afii61248	afii61289	afii61352	estimated	oneeighththreeeighthsfiveeighthsseveneighthsuniFB01uniFB02cyrillicbrevedotlessjcaroncommaaccentcommaaccentcommaaccentrotatezerosuperiorfoursuperiorfivesuperiorsixsuperiorsevensuperioreightsuperiorninesuperioruni2000uni2001uni2002uni2003uni2004uni2005uni2006uni2007uni2008uni2009uni200Auni200BuniFEFFuniFFFCuniFFFDuni01F0uni02BCuni03D1uni03D2uni03D6uni1E3Euni1E3Funi1E00uni1E01uni1F4Duni02F3	dasiaoxiauniFB03uniFB04OhornohornUhornuhornuni0300uni0301uni0303hookdotbelowuni0400uni040Duni0450uni045Duni0460uni0461uni0462uni0463uni0464uni0465uni0466uni0467uni0468uni0469uni046Auni046Buni046Cuni046Duni046Euni046Funi0470uni0471uni0472uni0473uni0474uni0475uni0476uni0477uni0478uni0479uni047Auni047Buni047Cuni047Duni047Euni047Funi0480uni0481uni0482uni0483uni0484uni0485uni0486uni0488uni0489uni048Auni048Buni048Cuni048Duni048Euni048Funi0492uni0493uni0494uni0495uni0496uni0497uni0498uni0499uni049Auni049Buni049Cuni049Duni049Euni049Funi04A0uni04A1uni04A2uni04A3uni04A4uni04A5uni04A6uni04A7uni04A8uni04A9uni04AAuni04ABuni04ACuni04ADuni04AEuni04AFuni04B0uni04B1uni04B2uni04B3uni04B4uni04B5uni04B6uni04B7uni04B8uni04B9uni04BAuni04BBuni04BCuni04BDuni04BEuni04BFuni04C0.altuni04C1uni04C2uni04C3uni04C4uni04C5uni04C6uni04C7uni04C8uni04C9uni04CAuni04CBuni04CCuni04CDuni04CEuni04CF.altuni04D0uni04D1uni04D2uni04D3uni04D4uni04D5uni04D6uni04D7uni04D8uni04D9uni04DAuni04DBuni04DCuni04DDuni04DEuni04DFuni04E0uni04E1uni04E2uni04E3uni04E4uni04E5uni04E6uni04E7uni04E8uni04E9uni04EAuni04EBuni04ECuni04EDuni04EEuni04EFuni04F0uni04F1uni04F2uni04F3uni04F4uni04F5uni04F6uni04F7uni04F8uni04F9uni04FAuni04FBuni04FCuni04FDuni04FEuni04FFuni0500uni0501uni0502uni0503uni0504uni0505uni0506uni0507uni0508uni0509uni050Auni050Buni050Cuni050Duni050Euni050Funi0510uni0511uni0512uni0513uni1EA0uni1EA1uni1EA2uni1EA3uni1EA4uni1EA5uni1EA6uni1EA7uni1EA8uni1EA9uni1EAAuni1EABuni1EACuni1EADuni1EAEuni1EAFuni1EB0uni1EB1uni1EB2uni1EB3uni1EB4uni1EB5uni1EB6uni1EB7uni1EB8uni1EB9uni1EBAuni1EBBuni1EBCuni1EBDuni1EBEuni1EBFuni1EC0uni1EC1uni1EC2uni1EC3uni1EC4uni1EC5uni1EC6uni1EC7uni1EC8.altuni1EC9uni1ECA.altuni1ECBuni1ECCuni1ECDuni1ECEuni1ECFuni1ED0uni1ED1uni1ED2uni1ED3uni1ED4uni1ED5uni1ED6uni1ED7uni1ED8uni1ED9uni1EDAuni1EDBuni1EDCuni1EDDuni1EDEuni1EDFuni1EE0uni1EE1uni1EE2uni1EE3uni1EE4uni1EE5uni1EE6uni1EE7uni1EE8uni1EE9uni1EEAuni1EEBuni1EECuni1EEDuni1EEEuni1EEFuni1EF0uni1EF1uni1EF4uni1EF5uni1EF6uni1EF7uni1EF8uni1EF9uni20ABuni030FcircumflexacutecombcircumflexgravecombcircumflexhookcombcircumflextildecombbreveacutecombbrevegravecombbrevehookcombbrevetildecombcyrillichookleftcyrillicbighookUCcyrillicbighookLCone.pnumzero.osone.ostwo.osthree.osfour.osfive.ossix.osseven.oseight.osnine.osffuni2120Tcedillatcedillag.altgcircumflex.alt
gbreve.altgdot.altgcommaaccent.altItildeImacronIbreveIogonekIJ	IotatonosIotaIotadieresis	afii10055	afii10056uni04C0uni04CFuni1EC8uni1ECA     
  ��               5 77 ;[ ]v ��       
            
 nZ latn   MOL  (ROM  B  �� 	            �� 
   	         �� 
   
        liga �liga �liga �lnum �lnum �lnum �locl �locl �onum �onum �onum �pnum �pnum �pnum �salt �salt �salt �ss01 �ss01 �ss01 �ss02 �ss02 �ss02 �ss03 �ss03 �ss03 �tnum �tnum �tnum �    	                                      
  < | � � � �.P        �����   J � � � �       .  , � � � � � � � � � �Zgw����EG  ��         p              
����������         �� 	       n          <��       ��  �        
 �          ��          �� !  $%IJ       6       " (^  I O]  I L�  I5  O4  L   I              GDST�   �            X  PNG �PNG

   IHDR   �   �   �dK.   sRGB ���  IDATx��}pT��?g�Iv���@��&��ڛ���d��*�z��R;0��*eԩ��tڹv���ulE�G�3�K;���b�hu*AM���7�C�$���?v�z��9{���gfg��g��9�˳�y���~ �H$�D"�H$�D"�H$�{��0������sLQ� �����������4i��qUÅr�v������iF}}}αy����_K(��	F�l�뮻��f�lEUU�/��ٌ�_��zd0�d������6 �;����ɤ/��:?�����~G�� �!D>�
䡊f����p xx��d��6�?@�l� ��K���~
ˀ݊�̄�PWQQqk[[�|�9(�.\ �d�Ok��D"�����?M���9V��n����2������Ѣ����㊢�(++{X��.<�F�G"������*3b��@���얢�"��fm���7���Dl��B��7��?0�e0��5y�6(��1�!=���_Q��0��o����^����[��5559�jkk�zG!���9���ݛ�n �z^��C�̒K̒K̒K7�3�ǁ�{��	��ɷ����2�kkk���+��y�PQ��p8����[��ϼe5�ƿd�b�w�#}����`��Q,�������#�G^!'���ڗ|����d��f̼�j"��V<L�*����D�|��0�ˤ�[��!����t��ű�!��K.=OͅB����iK"��$�d�f�{%.\� �w��_�j�wuX��'c�c{̼{�� uX"�Mb�f�D��ӶI׶H��n�s�(��`����x<��1k�(�>EQ��(����/��'R���d��Rө�O��'M\��ѡ?�����VROUh�W{{������/�aa���.��� S��X,f迾��w�FȞ�?N����K&�B4m�d�Ommm�Cῧ�'�OOπ�������ԓ�m����¿��"=+s�+}H!��*��6m���1�?PȞ�L�>� �Mu���0�e0{��*f������D�K\-�!x��w=�oiiq5tB����KZڠR�J$�D"�H$�D"�H$�D�����:^�['0_�??4X�	z���:�r0n��yE��ΟW�:������N�f����@n��yE�J5�q�`΃�:^���:^�u�~f�e��_�I��Z��h��K�V���0]-p�690�m���0#]�o��Ξ!>2�x���v�:��7��ܜS����s~��>2���&P��61����:��`6����u���yŷ:�2�MpR��+Fu�����:���ǧ:�2�M0Ö��"'r(	�9�(ʠ����D�f��$/�W�y5о�:�y5�O*��gd�l���^1̫� /�g�Fy5����߯��g��>/�W�������ſ�������s^�3�D�CQ-�p=��B���v�Z��b$	O�


�O�͋1�*�`���S؞2��)���x����'�,�.���r�a�>���dt����	���C�f������W�m^?��9sfPs[��-��mb��Ϟ̬r�ʄ	|�eĉ'��]V.�H$�D"�H$�D"�H$�D"�H$��5��ޔb��9��}�[����˻��'�I���J�VY�̲9)��K)6�>#��jw�Hb��c�^�?�ߔ2��]��Y����g~�`����j��АW_EEE��A��	'Ōm��������nD%�L�6-��ĉQ�1ӧO���v0�=���3��z_�!Đ�7k�, 


�ڜ={v ���rWW 555}���Ym�����W�곃�'M����b�b1� ��/�f�J`��\>�� |������B�L�{�ܴ�+=�k�����J_2�$
QPP@"������wF�/������TUU���Bkk+���z{z�T}��bk�#��
��J�*�m�ӶW>�����~k`g}}���)�@(}`G}}�}f�fϞ��Y����***6)���d2�����^��Q k��--- j@_UVV���� P}B�WϞ=�Z�O�555�{�]3d��0����-[��c�>lx턒�jjjX�x1+W�����4�hԷ��o�Ν>|�s��#Fd��X�B�w*�����`�L@ו����H$8y�$���tww{�PRRBee%W]u�:�9}���E@����3d�n���9�zzz<g5�w���㋀�{d_�YE4ձX��޻w/˗/�������lݺU�� ��4jk�o߾},_����`�����b�֭�?Pp-��Π&bT{������noo�����/�������:5`;>�쳌>u<��sU}`�4��`ְX�g�-ZD?s������g֬Ytuuq��A6l����o��P\\̶m۸��� ^�x˫��{����n������2&M�Dii)���$	G=�׾�5����2}�tΞ=KCC6l������b^z�%-Z�2�a�6�h:��EQ���s������3q�DJKKI$tvv���s��y���B���QUUE"�x�C;����J�{UQ�����ihh �L�D5j��ńB!���h���rJJJ����ܹs=z����
���7�Aee%�d2��Ap�<�{gg'S�N�����~�����7����'�x��TWW���SZZ
�d{{M���<yr�4�S��NV�\�3���Y�v-O>��^�4i�t)rg�=���o���g�O��C�8z��k�*���̙3�p8L2��ҧv��+--��8�����!�~�)ǎ˫������� ��yZZZ���x�����a~��_��ozO����ēO>���Ԯ�Q�Fq��W��;u�TV�Xa�P��߂hjj⩧��Ҡ�H$��e 'O����/�>EQ�6mZ��.^����������S G"F�m�7EQ��k(//ϫ�n�9�}�v ~���̟���O~��U6����c���c𥾚�O+VK�.͛v@Q�������YT�Ѩ��/z���Z�<ٟo�OEQb�D�:}�m���<�,//�}~�LJ(��B!�/+�f4p�P*EX]]��n��F���9t萺��R��F��Y�F��6ekg�^=��>�L�w�V�������ȑ#-�_y��i��O ��jm[�\Վ0�5��z~���Z}
Rx��"�r���W��"zB3%��D��ij���N����hC,���"v�,��B��(��>�Z{M�c������?s�ԭʓ S�L�����ohl̙v��ɓ�^���V�~�)G��l����>]��S�z���ǌ�·#�h)��2�ԶNVጰS5K=�|��p�����x�g�6B�t�!=��F�fY����X����B�aÆ��t��7��x����-5|���Ne�����kg��_X�Q��L���V�5k�0f��m��ƍM?��Ӯ�nj�D"<�����������*Μ9ñc�\�}��7�7�9lܸ�}���D�������!�K���������;�ˆ�P(���jy�T}��ݜ;wε߮������}�Xf�_��9��Y�h��)S��m�6v���;�Ä	(//������Ci��<����V]� x Oӣz}���ttt�F),,t<lhh��O>�����#GRXXȻ���?��C�����F��_|Q��1`V8�������f������ �d��;w.3�3f̠��!���B���S��(������r��E��0�P���Pww7���QPP��(9�їs��z��ep"�O���;w�t�R�Rhf�D�Q6m��=���܄�����F�ر�e˖e�+..�����?s��Fٸq#�V�R��;���%�"0�+��'pEKK|��o7yzB�ӧOg��� =������4����F}RZ�#}vn��L&3>��zzz2�O�� x������� 7�Z����Ƴ�>��/�̑#G�S,��B���r뭷����{HmC�i��M���G���f��:��(JF߃>�շ��5�bΜ996B��M%%%�����8q����������F�I�&�A��ǿ��ߟs���)�rӈ#2��?�饃�'�X��ۛs���h��0��������鄫�����*|ؐ�:/S��!��������ί�c��j�K�;`�^��0����S�N��s��n���!���U��4@n]p�g��[SS����ڜ�������=�p���� �9�̪��G��]N�}��8�E�f�%�H�2���#U1�}M����m#�>m0kH-�'�9���(
�z��o	!��(�K�x<k�D��`�2�Z�B�~�(�o�O�$�x���(�T}�pj�C�o�a=��gM����l�`��w��K�T�(d���GȐ	���H$�(����i A��PXX��C�Y�^��S��d�W�C}Y�O�/���F�9=t>ݒ�F��`���曁�@Vv�v�P(�Kz}Zݦ��.F=�=�z�귇6��K���xޘ����̴���jx���T�P� ���^�>8�����Gi�M��x���]����y�}}���C&�	+}.4|O���b�7�,	�@]W+}F�Ve�p��̂�/���L~�U�D"�H$�D"�H.#l�.�E�;U�Y�A?��x��zjP��u�e�^�7��ʾ�oO*3��k:?�`/�'.�`o�����Ͼ�����ٖ���`��?�6�7/!�y<�!�)R[P��h���ɾ$?n7�}��~�ބ���:fϞ�8�I�@�f���i�N����ׯN����>țB_0ȫ�vݺu��~Yǯ�k�
!�:�������3���:!�i!����7n����Ǐ�ƍ����ׯ��Mq��f�� �ˡ�O\*���j!Ŀ�b�޽bܸq��***�Ν;�Wk�=H���|����^ص��U!�ؽ{�(**��QPP �o߮�^ہؗ�g��f,\��g�}�������wvvr�]w�J?�H$��~@[[�|R���/++�7��~�!�|�	�7of̘1n�K��\ZZʖ-[P�_��Nz�e �7oΤP�CGG�6�'�G������ի�1cӦM�{�1�$���u0?��SL�0���~�i֤�7���Ĝ��ǘ0aBNê����6�K6��>ܨ�h�"V�\Ioo/+V�p���+�ʥ�5?4_�7�e_W"�8�/1`X\�k�����V֭[�ƞ/�� �<��~��S�����6�C��ϗp[��ۦ}��"�ϟ?O4�Ga���lڴ�q�Ʊ�~�t�&���'��2i�$u��`˱��~����[o9�/1`X�c�X�z5 ��������Oww7+V�p���-�ŋ;~c�t���c�ڵ�i]�����ش/1`X3��-[ؼys�+��?�����&�	���S˜�"_�e+��N�b֬Yl߾�������ͮ]��9sff����� ?�sΚ5k(((�����{΋�}@}eee�w��˖-�5���3Ϩ�>I�td�ȑ#|�;�Rن��*�KV�|��E~���e�^��%K��&	V�Ze��6�h�C�wc=��k_�.�Kt�aF |L�����C����f�����a͚5|����D��C�H|��Kt���k׮_�Yt ��[��;�nؾ�����uڃ�dR_*"o�偰/����m0߂u!v+va>.ھ�RK�sIu$��v?�������/�?2�_�����h_�52�} ���2��qY� Z�Aۗ���e�D"�H$�D"�H$�D"�H$f�? �W�?n�    IEND�B`�            [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icons.svg-e71f5c4b2b1eb5bc3e203deee0781907.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://MinimalUI/icons.svg"
dest_files=[ "res://.import/icons.svg-e71f5c4b2b1eb5bc3e203deee0781907.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
 GDST�   �            +  PNG �PNG

   IHDR   �   �   �F�   sRGB ���  �IDATx��K�� E�:��-�'�t�2�?���*	�Y`��                         ������t+�8R]g����.���幖6�S8�T����zdښ��V����d��<�ʭC��\J� S8�6w��p��B8��|�Ң�W�[��i�Ï���s�L<���Ȃ��:7�[!��-\.SAcyV��{t&�ԝSשs��U۲��]�x"��e�D���x9f�e���NW��Br��S.���Q;_L<R����kr����j]T<l��lM�қ
�M��w��%WX<��e"Ǯk�ȱ���1e�&�!�_�V��e���=�w�-7�x"o��ݑ�-����FT��e�+U���-�q�[DL2m��Pe��D$�>+�\���m]�.ɐS5�Mdϝ��W)#S�2࢙H\��ȕ��ET$V���u�lG@,��(""���|�x�	���NoKZ�&ʸ$,���*�㨲��iMt��(BZ	�3�.�{�lXX��2.����5� ���C7Q�VP���K��バ��>�-�NҍY�����.~�����x:1P��s���CR�@��.������u��0+�e�u���L@�������!�%e��ƽ�p��C4m`�։h��<�\�:�)u�KF��߉���YH�`JUx�=ivw�d���Q7�]d���1�����{����f�/ǎ$MK��,ި���o��:f�W~	h����D5Qw���@�"Z��~X\DݹC驗ßۋ�b�!�d ��64��ET�iV)U�(��ه�1��(y@�4;� Y�� �)"��/�1Q'*g"��D�k��ھ}q�;M�� �t!��<�7J'D����Z�2	yw1T�v��@Q""
y@k��Q=L�\ȅ��M嘘��G	�9`�B���sD5����P��Q!G5���t:!��Y�����W官m.��*��- �іh�@�e!�L�΍����=㸉��V@��P��V�}�3<+�F�%U�w��O:���Bpg��O:���T�B�m~?))����e%�CT�*���r+�<މ�%d�f*)�"g�t��/U����v��?]6٬�yvيF]�6bp���+�B@���C�x2��܈�f��� �lD�S}����N�x������y�ô�x����G�����e�z�`�6�M<�;�p���s���Ǝ;Z��H���i�3����_hU���Y��nBlh���h��@0%��@�4�h3�{�,{�df�r�q�BV�]lic��a���;[m�<"�r�d�C��D1lV����h��Y�g�9_�%d"���孽8#2^��(�=߾N�$�M%�,9��N���+m1*�#.��e�Z!>�����;����[&RH݄c�������ey�)�n�yE��י�m                                                 T�/?�z�>�:�    IEND�B`�         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/favicon.png-ad684d17faa662133229b6300264136f.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://builds/favicon.png"
dest_files=[ "res://.import/favicon.png-ad684d17faa662133229b6300264136f.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
              GDST   X           �\  PNG �PNG

   IHDR     X   �v�p   sRGB ���    IDATx���y�\U���Ϲ��Iw��+���-!�EqEP�U@t��}��~*���8 �""(:�	!d���I��=�?��������Nޯ�']�n�{n�ͭ�g�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        L�  �ڌ�7&����� `t�j �L� ���7 ��qu�����L�b( �xqE�Q.�X� �T @q*-t  �sP�/�t��E��JzR�_$��f��'�,I'K�'�)IOK��4��c'�ч+7 �"9���Hz���%-�T���Α��A��~��5H�?��h�
>�J�{�;I�@   p�Z��c���Bk�m��f���'�/�2�>�}7��za��3   �dQ	���^l�����7͊��2��')��Y��7|���@   ȧ*��Z��Z{��v_�5��m=���;����c_z*�g����>����C�w��m=�ӆ���1�+�� 
�N� P�ҨD�Iz���tb���w�kņf=�y�^غO;��H��M�׵���p��;��o����H���v�>s�J���M�4qL�L�c�7��Y���*Ku��OI7H�URo� ŉ�3 �$�zI��IIӒ�c��Z߬�^k�?��Ӡ���q�N�sHt�I�P�O3 �����Y���^٣o��R����_�E�6i�aM�=�.�aI�I?�t����<���b�� �T����$�\����t��ѵ����]zuW{Z��4�J7}�D��x�ɟ�tm����}� �3��y2�[}�Ok[kwZ��T�7͟�79Q5��6m�t��{� P\�:@�
�ܟ(�q��^�[��������S�nl�������p�w���I�+`Z�H��W%5F�]�U?y�Ռ����g6�-GM�)���*�%�"iEP Ņ�3 ������.�N���l�nݱ|���v崿��R��E���|Sҗ3����y��;�+��ں�s*߄�J����:k�$U��ľ�IG'� @q�� E*  yQґ�'�[�Ew�؜s�>څ'Mו���O�%g`���
��.I���t�ӛ]Q�Ue���i������/I:*:�  ���z @��<�f���C��]�M���9V��2��_|�u��U����<Y�;69�� #�  F�a#��!嬷PX�56�Ӓ�b�<ŷ�W+43א{�ݪ��A�e�����N  yA  �ǰ �*�$�q�6u�kP�P��m
L�4�P�L8m����J���t�sn[?"��	@ `�" ��cX%�*��Dg�������C%MVh��Ҩ��pڔ�6C�[�=6�q&�$��� G  �ǰ $]�"�yv�zs�:�7���Uq]���./�M" �Q�  F�a��nH�����_^ܙ�ukm�E��;��ٗ��I�*��~�� �D�-$ @���� D�~�b����hw{�v��hO{�z��7�A?|�xFU�%�(-�!u__��uzdm�,UNU� � �����U�-�����^��-I���:zԡ5w�j͎t��Mme������  Ň.X 0z�~�T[^�rܸڊؤ���  E� �Q����Z�;A�æ�j���4���i����~�I��: �  r�M6�}����[T��@�=. �����J'� $F, �R.���<"���߰J����VcM��hџ��� � �BPO���I�BICV������kȮ�(�]�J:6��2�(�o$A d�  2���Y/�I���>+�2�]�K����$��s0v�j�?f#��~&�.��+%��B�Y���A��?A d�  2���Y+�AI�����G�+�ޯ̯��Iz^ҕ�	>�w���q0�}���M6��R�:-�,=���W$}O��L
}�S�;�M�f� ���  M)*�e��(�ټ ����b�rIߔ��-V�C�w�G֫-�"~P��(�eKf�܅S���%}_җ%�Z��m��#iA���t���D00 ��� Ґ"�0�~!�}��IR)}X��$=��tIwIZ��ƽ����v��+vs'��So9B3������$��x���J:#�	��_(�ʒ�d ��� ���b��u��u���u�ӛ�7���
U�o����o���b�+�+��_o{��#ʚm��۞�]Oo�$.��R�[���J����
>}�������=�9@��\� Vܪ�R�~|@�-�	;�u��w�Ҿ�P�����┙:sބDw�wH���i
ݕvshW[���5za��� �`�X���s5�>n������풮�4)vk�\�K���F�n�$��.�u�,Ԥ�U���_ҭ��A+ $�U �H|��PW��i�ں���;Vi[kW��ӛjt���:u�!i���ך��֨���둩��R}�#�tv���M��٣�~wG�k��T��K��zغ#=
��<�(O� H�+$ $�"��"i������s�yN��jO�������5��:�6�������͉ ��t�I���������ڥ=�N�mnM�ߜ�u�ޅǪb��#�G�pD� �� H�TIZ�P4���o߿Z��ݝV�奞.<i�.:i��J�����7�{I�6%�#��3��w�ژ��}������S��?8>'��G���ϙ������j�C  ��:@��7I�Pt��7���7d���c���7��q3$I����=/vB�f4����/�����ӏ���6��w�K�K�E���&�(��D�!�x\ F�������|}������ztFҙ�'�MGN��X����2B���
���s���]z�Ywi3F����Цؗ�#����� �qU�I���V)4��$ikK�>q�Ju�%\����R���ij��;��J�� �u@  J��T��
>�}}�O�	>"]}��91k�4(�*V��-j p�! ���/KZ��e�S����qo�ny���$}>�{B �u  ��|I_�NX��Y\��@�A�ݻr��|uol�$�+@q `T! ��<�f:Z����O�{`�sĬ���o�Z;���+$�"~[ ).� �܇%-�N���ש����vm�������&/��� F Hl���D'��Ь�^�S���<�ʞ��X��й @  �}JҘȓ��A]�`�o�h�:{�̈́6V�s �  6�կߨ]m=�*�TsG�nrcl��-  $����*����b�:�� � @2�F?9s��|��B�E��Y�z㼸!�m   �dn��|t��Ϝ�ڊ�Ŧ��T�x����+t�  � @b����44¸��BW�vh�J������!u�I
�3�� 	� @r�J��脳����3
T������GO�M��B�   H�I�#O��O�i�*�J
V VEY�>��#d�'����� F 3�$z�W�n5���Ic���3�b�]}��4�*:�Wh��y���[ p�! ��,�tCt�ێ��7��~�ܩs��GO�M����8 0�pK bXk�T�P���i�����۞ն֮�(
lҘ*]��>�I'(���~ �p�� @�$�NI+��MUy�����TZ���@W�}�m�b��I�� ��/& d�9I��0gB�޿tV������Sռ���ɟ��� F- ������Nx�	�t��Ƽ�	�s��F���i�ɿ���D�� �� @)*�WJ�8�������� 1wR}��-�>�h{� H�4�& � �$�������<ct�1Z|X��O���r5Ԕ�o�WsG�v��hņ-_߬�m�3��Z��+���&�8�Q�+�X[��RO-�}j����������Z��M~�	\������ H@  	cL�Y��^�5���9DW�v�&���{���SME��7���YM��gkզV��ȫڸ7p\��1��Z�;e���9$p�����__�y�����iO{��X�Iya�H"	w@� $G  )�B�f|}����#5gb]F�[8�A7\~��|j�n{bc��$ǌ��O���N��/���!u�ě��&�|I{�{�W�>  5ƀ @F�b9or�~���2>"J<���<S_9�(U��8.]�T���+��K��(��v��z����X�R\\G� �! �"3��Z_?�h5T��ג���o���P76�>{�\-�=.�j���w�M5� �]� ���V��޵@��/�]]]Z��)�Z�J�{��[_���Z��(-Y�Dcƌ��ɇ��Kf���7��9�b�,�:琸�}���'�ԋ/����y�SӸ&w�qZ��$UWW�WU^���w�>��g��3��� �D  E��%�4yl�`sI�o�;���_���#���<�UTT���ߥ+�w�***�^�h�t-[��h�Oo�օ'N���ӣ_��+�s���?��O��Iuuu���Kt�������4T齋g��G^�[� �� ��c*���'���٩/|����ƛ�����^�qǝ�Ŀ~R{��J���N=�I9�K=͙P���T^��g䃧6l��޽{��O|Rw�����#���]7�x����/���+p�w;Y�u ��G  E�܅SUVY�}_��Ʒ��3Ϥ�׺u���Q==��	���&Mic�K��o>z�~x����e��7=E�,����)�:�Ц�������|A�֥�j�b�
]��������JK<����� � �%����������3�o������K;��[�v婇�Sf����Y���K�����ٷ����7ݬ�^{-�|�y����{_;ev�� @a� @��X��c*�һ��u�m�g��}�O�v�z~Ҭ��1Ue:��i	_?��i��*�*�g5��s�N�����G�n���a�>�+5�1�� �;  P�Qx�����ޞu�Z�Ȳ��AAN:�7�$]���3�9.�)o��?��2d?cU[[��~���� Ł  �@SmE`�s�=�s��y4�Vd5^��$���Ư�b�4����N�w|�њjs_W �; (e���={��wt���*PȗR�SiTˊ��ݛ �Ѵ"< Ȋ�W b-�}��V6缭���n��W߀�d��?諣��"�����t� ��E  E Q�xܸ���2�G�@��Z:^_�cܸ�g����Ϭ� F  P^���2q��r���c�����m9����;^/ӂ���9���������� �! �"��?���K_�x�����>��<�v�iCϟ|uo����W���>����y��4UWWkѢ���WmjUw_�"� ��G  E�5���jjjt�Ef��Yg�US�L�$���תͭY�/+7�hw�$i��)z�[ߒu^_rq`��Ț�Y�	 p�  ���/��ƽ�q�\zI`��T�N���\����?����G�����MC�?�ѫ5uꔌ�9��#���{;	@ ��� @����]7�Uii���j���i�5m�4}翿���:I�֖.���;�֭?=�]�Z�$Iuuu��w���S�����G��׿�5��_��J�y�z�6���  n� @Y��E�yjS\�رcu�u��%�^����E%���D�s�n����<y�$��oP߸�%_�G����k��:�S�N�2E7��z������$���������رc�^�s�&=��%o� d���  w��4yl�N;b�����r}�CԻ�}�{�1�Z���6�����ƍ��ҩ���I�&��o�׷�_ص��li��w����r�*/�TWW��~�3���K��ez�ŗ�w�^���h\�8w�B-=u��[�v�~�Ć>
 @*  Pd���}�jmn��{O�)�zcc��;�<�w�yI���ݯo��%��5~v��˔�6�9��Ь�����z�Qj�)�$M�4Q]|�.� �{Wn�OyU����C  E�J�퉍zuW�>x�a�ژ�T��Z���ݺ�����_.�w��ܦ5�mұfG����gu�i��s�˘�,�--]�y�z=�Zs� A  El��f��Т79Qo�7AGM�/�B���_����Wm���N˱aO�6����q5��o�۩�{�����W���˺��-:o�T-:�Ic�����^غO�٭_کA�f (f  P�}����C}a��*�4wR�k*4��B�}j��ӎ}=Z��=o�=Y���}�=G��v� ��^}���iu��������k����4il�k�UU^����j��՚�j�q�� �? E�{��bCafu��ܩ��r�޺`��O��$��ަ���C�٫�ŷVkw�i�ζ�� �  ��u���g���B 0j�   �C    `��    1   ���J$ �T@    �f� GfO���ه���O-��Go�`���,T�����\�5�j�.���
]$ 8`� �#��Ň���7ૹ�W-}j�PK���>5w����է<�!�(奞�j*�X
.k+�TS���r�V��)*�nW �  �G奞&��Ҥ1UI�����_{;z���O�}j�|=PY���վS��,Ӽ��W[j��)WSm��V����B�e*-��1  ��O��*4��"����}��/h���#\��a��1���TS�� ;n�(PSQ�˗�,t1���Kf| �(�� yd�n�������5�W[�1�e[]��)ɻqe�o������3�N%^~F>�Vkw���Y�m�]��w��XI����?����/4^��O�&�댹�s/( �  \ymO��]�5�뵕�j���������T��*UU^���ʲ����g�y���wD�g4�}�G�w�r�me⟳�A_�����;�����I�;������O{�{4��P�h�� �@  ��j;��PGπ67w&ݮ��L����[���I�U�%*-�40�;(mHy��y��|D�?�^奞��C�gTU>��l��6]���j��S[w��sb�3� G�qSIm��צ�N�n�{���8��c���;�M�+Y]eY\x�k�65w:	>$)O=� �D 8���3�VWY�֮>g���P����K{�{��?��B���cJC�6�M�
�����W��].F2H� do�2�p��QW�vH���_�c���n���O�}��r��Ҧ:L���w�@J�[���,� �7l:��R��Ԏ- .M�:��*hƫ�}�"�3q�hcEY�� �p � C  ��~�z��������e���}���߾�[��Yj���n_��L���嶏� ��� � B  ���d|}���G�$�֞�^�3T��q�I�4�����vK�v �� ���dF��;�Aw��M������3���~�����_�	֯H���Tc�ˇ�mku�����{X���\5���b�x�gT_Y���R�U���7d%    IDATyL�v�[@�7�}���  "  ���
������
5�V����RAw�O�s�N�sH\zW��PP��3���Pp��ӯ���硿'��o����U���.7�aXڌ����=,���,=�"����ڦ�<��-�- ��+�P3,P됴�� � C  �����S"	�7���;�d��]���P�|B������*(��������eHl�$�Y1 d�1  ���E?Yr�8g�t�:ː�֖<t�jq�$��ݯ�Nwk�,:�)6�Ag��A�  rs_��E�59�n�t���
O%- [�0�$��_�?�N��|LL���r����$s 8H� �d���RV�JI�H:A
�>w��l�z'�\�v���آ��jT?l������_�]�fEZ��tiGƀ��׭--]q+����ph�J{O�ڢ���wÞά�'�c&�.B��B��a�t HWL �@@ "IWH�5�w@������
3L���T"��c��mi��M��筻Դ�j}���5��J]��q�D[�@��G�(Zuy�n�Т�uF>%���� @��b@ �
M�:)����[�Ӈ_�R!>~�l�s��fI��! ��1  ��>I�G'��p����>F�������L�M�N�� 9# �$��}��W���ԛ�Py)��Ѧ��D�=kn�w�F������ 2�/# ��-����,Lm��ϙ/�
�a���g�Ք���d_҇$��T p`! �%������6N�r�켗	n\}��Z:;n��J�G���~ @�r@F��ZIOHZ�x�?6莧6�X��e'��eKf�&?��J��A�! ��q��,%	B&+�̈N��?�놇�i�w�H�����o8\�.���VIK$m	z� d��' d)I "I�%=&�1:�ٍ-�����.���U������ע��Λ%-Uh�y  �WO �A� d��?K6��N}��/k��|)̞P�?{��7�ľ�O�ْ�'z/� d�+( �(Er���%͌N���~f�~��Ƃ��}�*���?a��X2S�%qs�l�t��Չ�O� ��*
 9J�H�I�JZ�������W����|1��2F�r�lzHm��OJz�����  ��p �B�Z-�ʠWmj�M��k��e�ô�j]q�,-�sH���K��R��A� ��J
 ���H��%ݤ�LY����o/��oWl�֖.��;(Mk��'Nכ���hA�m
-2�@��> ��� �P�AH��H�<�/mۯ?�ܪ��핟^�3F:vz��[8U�kJ�Cw��O)4�<E��\�+\Q��4�I:U�w�-+��}���;��=ڱ��E�X��V�#��-GMԤ�U�6}\���M�� ��
 y�A r��o)�vHBkw�iٚ=z�����ޛk���+u�Ct��5gb]��_��EIL'o ��� �G!%��#�J�"�c�VmjժM�Z����Yذ��D�'�k��-�Ѡ�'ԥ�C���J�[�`:�!� ���
 # �@D�J�Z�e��Sm<0���mZ��Mkw��]��ݖt2�Qc|}���X�#&�k�z͝T�vG�^�Z:�Shzݴx @�q���a"I�j�X��"iռ%���O��lצ����ڥ��]��ڥ���l)��,Ӕ�*Mo��Ԇj�W�9��P]�I6��e�~#�w��3y3� ��� 0²D�д���겕������ڥ�>�m�՞�^�t��m��WG�:z��hu��RO5���(U}U���PSm���Vh\]��j�5��Zc�ʲ�ŀ��~~��4 Y\u�@�D$i��7HzS�1�U�"��P0�;���а�H�o���Bi��%C�k�V�J
�Ө�i7�db��Ï�%��& (�� P`9"��~b�q���\3-�VJzZ�
��sl�%C (,�� P$"%
M�{�����P���I�v�X�B-���]#�yI/+͙��!� ��� ���`$�'i�B-&�%M�45��$�I��]c%e4�;�>�VߧР�풶I��{K��I�A�Nx @��� �@��d�%5(�T����z�Ƅ�ޯ����=
����^�( P��R�(S�`��t ���U  KPB� �Wr 8�����@ \\� ���T                                                                                                                                    �S� 8�Xks�Ø�|�r\�x<�\�O�K H��$��JT��}_��e���6���]LvLƘ��o�Mx,��#Y�s���X��r�秵6�qf{�A����ʗ�8�J]  -���4����8
��D*�A�/T��E6�e��@�� p&�
S�;�.�~��;��'��e�w.�Q��|���/���,�zN�&��pp  ��t*_)����4ER��Z���F2m��"i��}Y�UE(Ǌ�XI�%Uk�1��%i���L�9�*��R)����:7�+�=�)�]�I�P��&i0�<��k4|� ���dXI7�HZ*�dI�ZkU����nI�ÏJzF�S�veR�TRS@�r��7*tL�%Ͷ�6���ݒ�Jz2�����t�888����t6M�0I�J��Cݒz$�*(n��C҆�kä��;:�!Y��I:U���8k�I�)��/i��U
}����B��)˘Ar��%�n<�z$ݢ��  Iq�@���{����c.�4�q1��笵x�w��W�m�������I�Zk/�t�$��^I5��!�n�*�)eyL�[k���|���y���!鯒^�dpw�-��s}���1�B�;?�Xk�y�/$��jc���^	��S���*�*S�VI:.�{��@,�
 ����P%)I%�k�Hz�F�zc%���9I�m�N������Ic�G%5eS�4m6��@�OՒ����qͲ־�P�������6��n��%��l�+�4��S���ە�J�U(����G�6��je�*��6h��[�1W䩜NcN��<&�@�P���.
�"]a�~e���>k�Ò�����0��b�}V�g2yc�G���Yk�c����4�Z�}k�K��)%ﾔaW�K4���$n���Z��Z{������587�"�4�ϩ���a����w(���F�Y��e�ڻ$MK�����󼡩��1�籜���2(0 ���T�>�4�3��$\y���iT�gZk��� �1��ef������T�l�dkZ�<�磠�$�o�}���_*�g9�2	��8?/�־l��8�2�p��v���F�)�� �1��4cʘ����=�  ��%�� U���+k폔���2�T��&���y��U�9)T��1c�U�� ���>�����c�g��X#��.I��8?+}߿�Z�+�f�*�Zk�m���,�<��IƘq�-�ƘCb�7 �E  -�+��7�<d��|D�Z��?�*4�Ea8<<��Dd�e�L���+�sR|��,I����1�NJ�1�Ƙ?( XOp�̪VFK9��b��T��%�EI*�2 ig�RT���Z�S���ʥk���*6P�.<��g��o�� %8'��9V���ਜ.��������$��h�؏�r(  ���*4]l����Z۟�B���~����*ޙk���H�I���Ϥ�^��1��<韛^O\Ŝ��~/�xw%t�TI�*�IJ|��NX$FK9�����wA��J��Hz�)-��G��Cә��</�Ӭ�?S�M�����uA]�Fi+�$�Z�_�.Ls۸����fg�G���_��������d��@� Ȋ�yc>Y�r$�y޽�iL#���Jk$=�n�k��*����bv��fԷ|Ĳ��D����|��y���ь1_�<�$�����f��@X�X �JR�g��~$˒�.I�ML4#O��k%M�g�\3�|�������DR����t��T��g�Rk�-��D'��hi�7Z�	��@ d$�e�ZI�]�D��w��ߝ���TL�$e�Xk�g�-�.c�x�1fq&o����ȯ��$��nI�#Y�lXk�F�>F � @F<�;���B�#	�y��c�]�P!
W��������Ƙs]�|��~-�w�󼹣��U,k����1i���Hz�@�J��y�$�� \ JRQ������'I�3y�1f��t0}��נ��Ʃ7c�Hg�p��WT|S'gbFl�՚�B*M��
] ů�+ ��1f��w�Ic��B����X��_�����IƘ�.D���L4�Y4���c�3B��k�U�%�?V�+VQ���\ҖB�@�+-t ���߇�v�S��Ƙ�KڪPEkP�8I�}�_l�9U��Dc�&�D�Ƕx�'km��w�^�@+���y���B����1�|���+��? �3R�g���Y�E���1�RI�7ƤjιB�����Z{��yO+tnVK�a�=G�Iy��c�I�Ĥo�4�3;�L���H:'��Xk�y�-il�c�]} �E �@ ���WH�<��6�|�Z{���$��P��1'���1�*EU⭵7c���΍1��Vf\��^6�\e�}2���b��Oç�%�s����1H��-�Ш�N�t���K�1�4����c���b����e��k��?5�|I��;}�s\�����kZ%�|6ƴIz6�L��͹���mOw���� H�+�8A��1g���B�t��c��2H�Ӓ>a��m����Ƙ/J�����;�A���~�g�r ~/�IO&��Yk�$}��v%�25%�MnĄ�q�Bco� i�1�c����-)�1In��~c��>f��Z6|�+%-
���Xkߜ�,R�� �R��: ��@Q�#"�����Z�#I�Kj��%�[}G5��vI�Sh��ogZ�	�Lҙ��<�e�.U��UtY���b��XҀ�2��a^3��I��1�dI-���.M1��[�n3k�����ӹ�o��t��{�_�K�ͦ�Е����#�`" (2��y��0��%}�Z;(���)(IV2Ɯ ���Υc�Ƙ^cL�c����^ �	k��#�CЪ�a�c>�pW�D����1r�b�ٰ��,����dAH�\3�(�Eq��b�g�Jty
��<������ �����Ii|MC�1�j��lxlI��fs�4û�κ�c�*iO��m��Ƈ+�_������e(���J��(�Y�ꢏ'&@^�h?-��})61z|C��2�c��Q9���2`_q��
>��!� �� H�s�uo���L����H%2r�>��Me&�6�[�1	���vI?z!�����pKS�1�:Ge9LR�HV �����k��w9ڍ	��(I���I�k�ޠ�"�Ut�K���r��u.������s� X� @ ��UE}���`�M��%�kIII�]�K�vN�Ͱ�����`���c�-W��ޡ�����1�
q7:j��f;%(�3W��<9�<��D�E��@$ZT��0�Lc��U��� @������~F	���/;�!�#��J�����;#�T�t��.�q�Q��R�%I�8�U�SH4��4G�?��A��}G]�uT���� ��� @���'<k�S������ú�$0"���������I�"W"i����U��Uc���c\�<��u8�{��ϾU�.���?1:0��2�)k��tV\O�E�	�J< h@ ��I���m)�7c�x�Y��%km� '-QwΟwP��?9�k$}�e]�$��\�����)fR�<|쾤:(RI�<�J�k F�:G���kA� Y�mȵ,�}����ce�ee��cs�Ek�$%Z�����c[ꬵk���� Pp.��8�U9�glB�53T+4�QY�\m��IJ�I$���Չ*���j��ǽ/��Hr�}e,��NG�':.W�e܊�9tr�]�:6 (  ��B�n��PI�)������MQ�O|E���C�FIk��WI�'>$w����9TZ��R0"��NG��ڻ:޶lޔ �ls4e.��t�D��y��+�1_ʰ�Z+�(IGc�m����e��f��
ؾ"���<�U� ����c���:�(���'Q燓�R�>�y�5 �1  ���(�zG���tc��	^sU)v���$Yk]#;�<��ԛ�eX 5���wY�(�]��bm (*�� HGo�M�2V�fGy�+Q?'������2�Ի�c��ki��\L��* I�
�k�`�d"Ĩs����hF  A]��166!A�ͥDw�]U��km�~W���
�+�.2�<o�$Q�M޾��j�+�� rF, ���(�#哉D����bnLG���Y.ʤ�5�\,�(I����ekzlB�-R��C�΃��|  '`U��.��}Q�K4>`������]�β+�1.
�yޮ����c����.���z���p���LߐdJ'ߥ�" ń @:� Ƙ�Ƙ��ǵ����ne��G���d��*�����-�r�}e*(�2�L���dU�]�Gș�ƘC$MrP�nk�>G��@�  '���y�e}�1�DGy�kX S�sQq5Ƙ��^Hw��p�R)�M�#( I�X�y�K���E�Ƙ7cJ����(������`T" ��\e����c�0<��^�yl�r�ɦ1]�e��Xk/JT9L��h�y��1.ʣЂ�#jpp��iI�}?08��vk����ZG�g�	�m	
�8*�G� @Q! ���hm	c̅��͍<O0&����~�+��V3�0�|�y�:�3#ы��i���/���!i}l�#-< �c��(ˡ`1�x��Q����#�Z�"�al���<IotT��c�c��t� �O  �
W|:$��(�Jk�����t��+]�N�l�:WH�����vp�1�rTi������`2|\�\�o�}6(��z��|�1����J�E+\��$��(��y�,�� �5�f E*�Q���f���G
_��U����f�$���ܵ�\�y޻�x�$k�\�A���+#��H�8{W>|�x�گ�ڇ�y�UģZ��t�/k폭�cS�8�~�Ƙ+%��U9$=�0/ (  ���?��c>,�V%	,b*��UN�어*�|ck�풖��k�k���D�<�{�Pwͣ�e�����e�Kz<�6u�/I�+�^IU�6�
B�n���avHZ�0? (  �$�����~�������#�^b����r7�HT�ˊk���o�>-)Ug�S$���Y�$��a~�M�0��D�׍1�r���ږ�ʞ���p��)�B�jj�R������Aٷ�ű����};�k� ��  �R���*�<d���ik�]��%�.��&I��^�e��c@�Z~�e��TZk��־$��NThM�1
�������G%�xߏ'�)ʥzIu�ǙƘ'�1_v�3c�]�V��~8pi���k�=��#i�B�>Y�ɒ�1Ƽb��O9>$����@��	��U������<�D������+t7��Zېc�ɺ`I�~��T�;ݙ�g����<�2��:B�*��IO(�2�Z�X��<��J�m��*�Xk�r��2I�־3��<�HժP0 8 � �ğ��b��d��њ��A)ye��s���M�]#��%Ƙ%#��$mIs�'$�,i^�����_[k�%���m� %���c�;�e�р�r%�_H�;b%�k�/}�����@%r�s]��Dۏ��3��y�O�~�@��@�nT�d�H�K��Gyŵ�����֕���=�Iz%e��;%�T�r @>P�T FD�1�K�.D�VBO�I��^�<��ޠ���c>���Lc�������	za��d@4 	%���R��uA�(�I�2�|P�Wx�5I_��u4WZ�����h�k��Jr|w�����[��� �o  �a�	�� )�
X�<I��o�ڛ�Z"�|c��=���<oDV=![=���\20�|L��&G����q }� ����T�7c.���	K��C�Ъ֟R�U��Bx���"���ƘK�`R���1�����nI�NK�{�1{��H��, r@�Z(���1W�v[J��V�|ߏ,L�c�y����.\.��7J
��U  �IDAT\g����Zi��1WI�����a��R�{~J�1U�*���H@B\� ���2{S��K1�I�$�ҷ��Ik���k�/%}<Qw����-�#�1�jI�J�A��w����p�Qk��0ƼSғA/��@ �" ��O�1WH�)tAb${��l��c�i
��^4��ߔt���v�����ߜ��i��PRw���Ʈp��p2�QH@J  ҒƝ�ۍ1K%m��+�]���ݒ�Zk�U1�ľ�/+�KQt2
�?m�Y$�d�:�4���Ƙ�U�L-3Ɯ �B 
� @�Ҩ�=+�xk��U]�r�vc������蝹)+3�+�w��$�Y>�Q--�{'+EW�t��4�{^�	ဲ�gWx��3%mM��($ m  2��bd�m���pkH`���a���1Fя ��#-�J����Zk��Fnf�W�]��"iS$1(I֒Y!=��\>
����gH��1&i �iE<��M��r���ۻ�(�������oQ,�h�@�A��A1$.�e�� �h��I�G�'1:=��L�br��f��n<"h4e=&����N�]����?�ŭ[�[�vuUu����9��~�����������Wv��+Wf�ƈ�Y�FĒ��ɇ�ig"i�M��ňx:p��	�.��2�0�͓�8���~f����̷��Tiǻ<"6 �>>�l�r����X�Y���]���w/��J�	�W O��g�amjD���wG�c�����a����H�w�~]����Y$�X���M��lGm6d����
E�)��̼�(�K2�+T�H��a� o8�r���t�צ��>�,7Dį _�ul���O�3�����h�s�Z��k��� f&/��S �s����C���(����7g�/����>N��O�_�io��/EqAf~:3�Lz�;{�#��C˲|UD<x�?���#�|����,�$�WD�N��SI��88�,�#��"�!�,p���ws�y+UmÏ�������w3���͹�`r��'��^�ߛ��p���QeY��w�l��[�k����ff~�[��F㮥}kL6�w����Y��s&"����GԿ�}���Mo�z�������W3���q��^�k��[ϸW'Y�J�f�}�j~T��{��3��e"ig�WDҪ�ڮ�45K5�cw���c�Z�e�$xd.�)�{�������!Y�Z�k���ۛ4�Z�+�T��ߌ	�������4��d�@o�����(�\�y{�޲�_���')���4 _o�̮��sW����L2$�%I�j�@o=�V�>ή��iw������4<�i�I��	��5�T�2�k�8�Gp���Z\���B���ܕ5;����J�$I�$I�$I�$I�$I�$I�$I�$I�ơ-$I{���;o��N?��5.�$�]v~|>I��0�&����< ����矿h�p8�(��y��q�aÆ5-�$I{+IS�y�=��z��$&�6m��N[��I��w�	�����Mk�DDS��������HҴ3�4�����4�]��+<;"���s#��G���l�%ijL�(�D�����p�%�b����I��2& ���̿��3"�h'���p�f��@��Ur�p�S�n������ �4�L@$M�%j?g��=����e�M�^o��px4�x.��1�KҪ���E�G���l�*i*�J@"b�k��2����qT��^o�H��l������=^�/I��'"�m����,�E� ��g��cv�$���r�g �u���a�!�7nܸhY����V��۷o_�}ff��,�#�،N��5FEQuw����������=�ߣ������5ۼy�ueY�{��n͛�ic"i*��ymD�9pcf�
�{M�
_���n����M@����|������-�	TН�K?|�y�<�z& ͺq�i/��Lr�nY�2j}s�Q&M@"��%MG��4�"�P}]D�ڬt��~��S�a�y��v�������yP��DoG�VٝE1�i'K%�;r���>�M�41�4���À{����o��s;�E��(�m���	�Ӹ�c�rw˼\�]��t��Z��v�ҲM��K��4& ��B;Y�?O�W}��l�\��?� �"`SY�?)˒��h���|�j�ہ� �o���xQ�}�l��T#q� �'���~�����r;p����`q�1"h=x����|xЛ$������aT#�]]�F������;ʹIu/^Y/� �
��)�y�y흖���g����\�3�=xt}�������^?�\�������g���������U�1���|���n���;�������G>�Ŗ�=�}@$M���� ��p6}6o޼l��16Dć���jY�*I �Nf�|��99">��~f^O��w�}�ޕ�O�
L�.���m��e wE����p���}�;?^/�ا� \����lڴi�}yNDl����\KD|xaf`��=>"����t��ܗ�͵�U���n��ֱ���`P�a[D��73?F�L��S�DĹ�7��j1-��F�Z���T��rF�����w�z��Cf����6����]��Fj�m0p�Yg!I{:k@$M����q@f��m�_����K�4�yZ���3�U�}�����GGą1�Dꃁ�GD?3�N��f�Q�nX���x|f��*�ٿ(��3�*��ܘ���cx��xf1/��#������zp"Um�"\p�����Ԉ�U����a�����wf�2���#����[�a��`08��� o��_��X�g�:�;�63�G�O�����_u�pPD��*����γ�yhD���/~��ck������|��pPD<:3/�z6�����`�`0�ɢK���D�T�&�ټ}t���n_��&�h%!� 3�n�����a�#f}~0<��)��c�O��"�8�YT�=�YEq2P���x!���9W��k�s�jJ]��)���æ���e��T��w�{0>�J�D�d������]��}뚠}���8����3sUm�+#���~w��̓��7��\S_����W5Ϸ3r�+�� ��_>���"b�����g����D��Ts���N,n�JJ��,˳��{���� n�O.��a�<�l�̋���E�����d"i��D��d��������zGEıT���t��kn����uҸ�����E���u��u�b��<'3� >5bhݛ����>��De��3��D�>�fA�{���֋^�.������
�_�]Y'	� �����1�Kݟ*��bwH^ #����K��4�Uӷ����\�"x�������_Jռig�#����u����xjDܿy^�s��(^W��u����EY�ò,Ϯ���}���dy%i�d"I�ؾ}{���K��MӮ~�OQ����%3�P����N�-�Q�F���C2�_��zumP%��%u��o ���&�o�����m#��L�}�OQM��Ӛr�2�����ߓ�s����z�A��e��#����&��l۶��dnn������������T��^�����Yfgg盡���5���z4�����j�?"����?G<���I��X�d�C�3�eٮ��w��ffffN�������i�x�(I�{�{�7�β�j25�(
ʲ��t@D�,����̜���(���)���}"��;M�n���F�넺�g�'o��:��f��A�^��#�{���M��KF]g+@�f�����N���e�����֩G5J�[�b}�o��=;;�֭[�g��>�������~&	�(3���5��s�P������������E��q��w�����1��W��F|xИM7K94���6�~���#������n��vޘ��
Ї��� ����F�'�kS�R������;�	��|`D4��]=j�ֽ��.�AM�m��R��R��`q|@D\��z4ϥ�x�����xxD����6Ww����^QՒ�_��K�.d"i��	����^�4�*Pn%�[�é�Q���V򦽓X�Zc��>���H���o?����l�ۿ�j�����w����;n����K�SKm�����[�&�<l�k������|_��Y-��g�l��n9�!�O�j�̑�k|L��mv�v��'3��7{ֈeo��Cd)� ��/�tW�̧�ߢ�4�;������]�����!���z$�uWߏ&Hߺ+�0���Q��=2"��L.�
��$i�f"iZ� ��Ӄmt�G���?rդvWR7���?���b�Pŉ�M�l������E1�o���aQ�׈�s"�]�o	eYޱ�V���1�4��v��FĸQ��T�n5|�*���(��˲\ؗe�e5�i��>���z?�d�X8k��Q�㶚�}G
��G�7|�y[DLt��$iژ�H�V?h�F��1jD<?3G5���7w��ݨ�̐���~eYP���ø�JBF�{W}ݳeY����`�����疺�����w@]�� "�Vg�e��H�F�"i*�g3�?_�W=���m'�hX0��3 "bps�&��i7J>7�z�G6ssLj� �7���P͗��լ���4� 3ڝewQ����G63�O�{1s�$����&iZ]I�����xN������cB���&�m&lO��,w�ur@D�rS�n��LLX����4��,ٰaâ���f�U �~�i�$��}G}� 1h��x"P���%&�\Wu�{E��D��%ضm۶m[�O�Yd&��v��Z�֐	���S��"���7df�3�߼^��NB�]�J,�=�Y��	�3���W��%�� ��[���ٱ ᚴF΢~~}����h��u�}��&)�b�L�͵����^ςu\F5G�C#��o������"Q���b"ij���177���ۛ�_PM�w<�״��5o��2�D�e��/��7���E�̎�+QE�x\�߾;���"�j�ЈxK]&2�;�H oa�����8>3�FN���� �Y�{Q7��-".�o��Q�5.eY�if>v�N���m+��z�_���=&�$����\LIZ7& ��ٍEQ�E���T����}�����Q��D\��|�����=�7_813?��g�j@�������"`[f�23��}en\�&"��Ӕl~�SO=u�i~Ju_3"��'2���ˁWe���\;a04���F�S��gG��LD�="���j��Wf~%3933������:�P��kʲ�$"�Ũg!I{:ISaT�\Ϧ}iD<#"��^��eeY��2pYY��/��x#����R��\��� 3_����EĖ��7�	EQ�|�������x΋+2���0����U��px�p8��\���Wp�M��RuH+pU������
�<�A༝����gsqRY��-��z�Z����7Eħ�����pU��cʲ��eY^|�ճypwf�(3�V��.+�$�6��4���	ܮ �����Z�-F�ՙy�p8|w�׻z�1�D�̼�������T#Bm.��TA�pI�/�!�eY6�E~���F�u��w�E�Yť���]����̼�9D�����3���g�����Dē���>��s1����n8^���_��'�X����<xoD\2���u����g�w3�'��L�Fē3��s��ہ�#�/2�yNw�V��-�s���sou�;�7���m�͂�5G�m�/��6pp4��� 3�A=��$M#�t%M��7���Z��f��"b���}B����9|lD�R%w7��}m���V��i���x�sE1r�Iކ��h�[�P͙�k�=������6m�4���d� P%3[:��������
��9���g�J|�O���G���!�}};S�q�Rպ��?�Q��O?���吤=�M�$M�3�<s��cp�7ڰ8�\" ��do��]7�踗�^I?�1ǿ���.��͈n�j6�֤�?�� ��|n�{[R�d��!i��N�T9��SW%����6V�J��(��w��l%�_�$�;�H��D�߈�G���n�g�cK�V�M�$M�͛7/Z6* n��
��8��;ot���[�ݩ	֨㵚`-0��& l;��s-k5���҄cg���o�Y��F����1���{��ι
M��]�ܳ��=�	�$i�3")|��_�& �"�b���f�u�u���I��p,I�gDm�ˁ���oQM"y�O=RٯQp���c8ĭ$�/I�4��x<��κ!�w�ٙ��I�$i�2�$M������=~0�BDN5�Ե����~�c�a���ͯ$i}��H��B=˷����`A'�Q�%I��ax%I{��䑣tf�'3aJ�vI�^�����J�v�%I{�.�`Ѳ�`��yU����3�\�rI�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I�$I��5������/�    IEND�B`�      [remap]

importer="texture"
type="StreamTexture"
path="res://.import/index.png-917645f878b7eae3bd8162743181f2e0.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://builds/index.png"
dest_files=[ "res://.import/index.png-917645f878b7eae3bd8162743181f2e0.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
    [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST�   �            +  PNG �PNG

   IHDR   �   �   �F�   sRGB ���  �IDATx��K�� E�:��-�'�t�2�?���*	�Y`��                         ������t+�8R]g����.���幖6�S8�T����zdښ��V����d��<�ʭC��\J� S8�6w��p��B8��|�Ң�W�[��i�Ï���s�L<���Ȃ��:7�[!��-\.SAcyV��{t&�ԝSשs��U۲��]�x"��e�D���x9f�e���NW��Br��S.���Q;_L<R����kr����j]T<l��lM�қ
�M��w��%WX<��e"Ǯk�ȱ���1e�&�!�_�V��e���=�w�-7�x"o��ݑ�-����FT��e�+U���-�q�[DL2m��Pe��D$�>+�\���m]�.ɐS5�Mdϝ��W)#S�2࢙H\��ȕ��ET$V���u�lG@,��(""���|�x�	���NoKZ�&ʸ$,���*�㨲��iMt��(BZ	�3�.�{�lXX��2.����5� ���C7Q�VP���K��バ��>�-�NҍY�����.~�����x:1P��s���CR�@��.������u��0+�e�u���L@�������!�%e��ƽ�p��C4m`�։h��<�\�:�)u�KF��߉���YH�`JUx�=ivw�d���Q7�]d���1�����{����f�/ǎ$MK��,ި���o��:f�W~	h����D5Qw���@�"Z��~X\DݹC驗ßۋ�b�!�d ��64��ET�iV)U�(��ه�1��(y@�4;� Y�� �)"��/�1Q'*g"��D�k��ھ}q�;M�� �t!��<�7J'D����Z�2	yw1T�v��@Q""
y@k��Q=L�\ȅ��M嘘��G	�9`�B���sD5����P��Q!G5���t:!��Y�����W官m.��*��- �іh�@�e!�L�΍����=㸉��V@��P��V�}�3<+�F�%U�w��O:���Bpg��O:���T�B�m~?))����e%�CT�*���r+�<މ�%d�f*)�"g�t��/U����v��?]6٬�yvيF]�6bp���+�B@���C�x2��܈�f��� �lD�S}����N�x������y�ô�x����G�����e�z�`�6�M<�;�p���s���Ǝ;Z��H���i�3����_hU���Y��nBlh���h��@0%��@�4�h3�{�,{�df�r�q�BV�]lic��a���;[m�<"�r�d�C��D1lV����h��Y�g�9_�%d"���孽8#2^��(�=߾N�$�M%�,9��N���+m1*�#.��e�Z!>�����;����[&RH݄c�������ey�)�n�yE��י�m                                                 T�/?�z�>�:�    IEND�B`�         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
              GDST@  �            
:  PNG �PNG

   IHDR  @   �   Ŏ�D   sRGB ���    IDATx���ϫ]ǵ���txx� d�$\2
7
RL�${d<0i��Ӧ���_O2����7��5��M��A =G�B��A�{p���ԩ�{կ�W��~��F�:��{�ڧ�:�V�                                                                              �奭�   k��t���|����_    �P �.lQ��P   ��P  o���"(    l�(�3�	�G����    h�(��	�Gq�C���\�k+�    mP pdaE �2V��P    #(�;c�ș��D��p����5���:�� ��(�#�vʱC�cX��n���d<_��,����O�@�� ��=� 
성��"(�$ı*nk>}	�PU�� ��B��qX@. �;
���h�hj?[>}�B(EP (d�����;j"  �(0 ڄ1������5��Z����<1 �u��ق͐ 0�(0 ڄ1
E,Gc�R�ӷ�A@�X�gB��# `�N�C�h�(��|ǖ��H���;q�\�m�;�� � �� ��x�m���(R������k��>���GY��"�AQk��>��  y(�z,�����OK�Om����������d��ċy�����F�x��\ �<�,�Z����!9s->}�	�Kj1_˩��ɚP�����#c�p@. �0hvW 56 ���(�Z�l�[�6a�P2�a��n%��V1=����SE
�6�}����a4�>�� j�a��lI�1G�0J�*~NR��-�9�O����"��^��������o���JY�!��1t���02K�OڄQ&g�C*M����ԯK>�6����#'��\8G.`��"g.⻝a������*~.Ţ��m������_�������������t�~�	��6��:'7v�^0�*�\@����b� ��x�2����7���hޟ���R���B�x�P����9�=6�6�K.�����!��X�sBԈ!����mU�tM�#ڄQ�LlW)~NB�A-?'�8	�:�=.�6�K��`;�� F!�pPN�#1FUc!��Uj���c��Mx�r����ދ��\?F�s���:�c(���چ�ރ��w훻����-1��\�F!�PPN�{���6�5�ϒ�ṯ��6�}J�f�q�[ Y��eT�E��`�mЋ��������}�F]�#0��@H5L���Αc�ĸj�yI�s��j�m��TR�)+����g����B����OX۠'��ܱ>���}�%F]�H�h �� ��xq$��*~�������/���q�8�>\ㅂ6�}J�fOq������&}�п�V��Q ݯ�aN�F�r��-��q1�Z��: ��h �<׏�~%..]$�X�*~�%�=�&x����P����O��%�0[@nl#���B�x�Q0�{��� +����k���A/�q�m4���k��Iɳ��r��sɣ�,���Z����@���"���~X�� �,|��|:ޚ�Q���n�@��E�ZE���\$E��*)~�;8K��5HQ���(�Y�o��Ok<w�����M�7�\9��P�ᚿ�\(]��r5$��X,|�r�#k�t]������xl��O��G�����aڄ�'��P܊�Ǯ/�x-��kϷ�-���)i隣=�����-�����	̓�<��>�è�0r9�FaN;@3*��w�4�}���c�󇏣��t<7�vm���]�a$� �P�s�6a8T����V���91�Ƣ
6�*~���:&���a����F]�A.�/����Z����1_ ��&�����'�5�AH���B	�=����3AmZ<�X����׉����<г���k��}�\۴X�0�)u�����Oxg��Z�[����Mz��n��>L��~����?�"�����y�Z&o�������|�Z��E���>�݇�ݟ�k�X+|˝Ǭm2��^��i1���x�`��2raR�zY~�`�vL���`~���cN�v���Z�/5���B�0&?�ɕ�����P�ۗS��]ÄZ�-?�>���xJ����Qj�e�*a���c��Q��Y<�J;�p��h�q�-�枂��x���w-o�_�e�6�1Y*<��e�V��}A݊?S�E�i�o����oX��#}f��a�Ur�c9�>'5��bEPF��d|n+����x�Ӝ��ۇK�aR�h�Mxls-�nѱu�W��Ǐ��Ë�o���Ǐ�XN���|&��.˵�w�%}=-`�I�	W��k��G�İ�[�����>.��@�QWq��~�?�rD�֨C���enh�SP9/�w����X�Ag�9� ��-~V}���6���P��Q�N��7����U�KX�R�;��0"��cB���������`�jb�vnq}kyԡ��@�3U -Y�r:�)N��W���II�0m��Q(�K��"�.�zXu ���V'_�����{Њzj�3�-0���з�c��:t1Ȇo�&ʁ�'��s7��������o���;n����g\|QE훶��X�p�Ǟi�|�3�c���>�fI̵��9�ָq;}\Z}���r���Ř�v��f�1:��;?S[��w�߲�����x3��8��v}N_��R�#O?j6�g�ťZ�[ʅP��ϋb�V��|9��%��͍:l�.*ys���^�f�O���|h�i_Q����辔�A�Z�����jw�����Bf�ߔ���]������ �d��A���^N�v��ALZ�s[5��V�-섶��n���@.@DU�Q��3�P��?�i4u�m����w��z)~��A�Z�}�������܂���:q[z�Q��KEPv��WR�d3��yz*~NJF�����[�,���מ^���Ҽ ������C��lٴE.��]��M!��q:�(����^c'h�n���.T@��>,r�O.lk�Ӊ6�K��n,n�b6�Hz�P<Ǟ�sĶ1)�zZ�İ��K��׀b#}r�3[ОL.ؒ�󍼘G.����ÔQ�1�[s]T� *R~*<��y���w�9�R���q��%�5���(~�j?�Ϗ��yH��|'_�X�@i��-:��8���;�D.#�wgyԡ��@�X,�Ξb�)�p:�)��!K���{l�z�:�Љ�E�Z�Om�֊�vxte�����8�����Q���g�L��Fxc�9?O���4kg��"�gXk�?�e����ɢx)�~��+'�%ۡS���/On�E��羃��5�-����H8�rZ�K��>�{Z&W4����y����������~�N�k���i��M;�u{cl]Tc���uN�#}D�x�c��1's_���߰Ե�y��r����׮�{�h ,� =�o�Xm�9�`0n��1������K�x^3no~p+��)rX軋}��������s��_h�:�g*��:V yA^���]���l�����t��nD�Q��ZE�^ۇ�m<kb���Z�Ϙ�׮9�����(k�9���,���Ԙc�r]gĘFu5Y#/ȅq,���Yu�b4��̶��7���QN�k�&��`�����Z�Ï�>�erEڶ��&�S�ƭ�w��q��c�O?v������+���+��ٍ�X;|��h{1f.�GYì��M?���bm#R^쉍:�aJ?Z��ȋ���`��>+��:t1h;fw��|u�3����8lZ��}8��Bvh�Y�Bq��?�.~�J�pt�����Y�#}j�t������"/P�B����P��܎
�VN��M��A�>|�s���;��YS�?/evU��ݟS�3ճ�/�kI<;�ڦs���I�:�����>Y*<������x�'�����>�]���J����k�	\�q�x�|��;����x�p������b}��<iHɇ��)-���w���׫�����_�O�����ųH�n�V;?����|�3������Ϧ؝��EN����;)|N��3q=.�k��N�����fs�~��H���pg��_�c�ȋӏ��h{��	������募E��x/7��^O��M 5�>|��>�n!C�vJ��Y��?s��Q�C�kN�E+#��I�	������yq���uk��������v����j�z���3TF��Eо�~�~<k
���mY�L)�Ǌ�~,��s�,�a&k�|�bm3&�#}���Z���z�E^��m�����.N�wO��t�m��I��hO���O�Dۄ��r$EJ��zK'h��Wo�/~���?�|�3�������Rۇ'�Ӵ�\hn��G��=�c>w�NJ�D�nԍa� �~O����==~��[o?���/��b~�u�x6Fs��y#���ס���oL���.�:?�������Z�k���}}��$�+�y�������k��c�ju�n�^
�+��u�4f���bj�	�9;"iF~{�w��[�;���]�.�;�R�:`\=�a݃V�铺n�����"���fv�k�(�z�� /���	
a���!
�"㞎�1�E!ڇ[�a�R!4%��|�t�sB���0�8�1[���5�'GlW��Lt�����1A[��z����-���k���j�����DoE���&C�p�}�ր�����zC�|��࿋�|HΈ���1�Ƥ;�A����I��8�^�k�Z�{�7����6�)�}��3}��1>��Y�'_[y��ftm�}��.�"�\0F{ϻƺ(f��뢰av�NF8o�6���	���	�#d�]$v΍��O>��?����c1R�*_���z��}�n�X��F�~�.gci����}����Y�\ٟ�F]-~]�	z�zi}�@E잎�a�M�"�}%�Pm[0���Bi!�BԚ�K��`��5'�b�5�������v��Q�k����}�6ꊼ�Vu8��R�o�Z�v�c ~����-ӷ��˓-�)ɒ��@J����M���{r���c�����}�ɧgm�SA�o-,�����!�6�_���Sz�ť�]�X��'�ʥ+W�^�CEPM����=�����������˯\>YĻB��wO��{�����YZä��qw@�����*��N~������{��L��X;��#"i��֚g��?��ɟMk��H��wLϭ�Y׏%'\��0*ͺ��?���1Ak��r�ލn���-O�k�Q�@p��*�W�4��,��[n=�K8.�=|x6�#$�M~-����wO��=�m'��Y�s�Q:�Gk��5�ova`���"/�
��Gb���6���n�:���V������c!t�+n�,|��؎���p��'_�GJ�'�hS{�Oj�'e�B������6�G]Y���� +�����o��u��x�-�"i;)Z��\�M@$�p�A�퓰��6ᘍڇUh��%qހ��_�^�=|x�;��k�?E��X<��v�����N
�3bof]ۉ����6k�a,���ۻ��ԯ��>n>䜞�w��'��y㭷��S�kx?�<�j��@�,�	��^b-����#��G� R��&�A��z'4��R��������o��b�sc�<g��X�3a��.�̭m��a�.'�B���;�o���G���"/��Q����uY �X;/mha�B���IEPڇ�9AcE~�C�b!Tˏ�Xj�3�ޢ"(����چ~��0��Bh�ş5�=\����B(EP,a���������!�����'�r:^)��w���&�i������>l�;�#f�ŀ���|����׿��|7�E�s0����W����E�`���h�6V�0[���~{�߈�}&n.L���+�����5�O#�k������ڱ��:��sw��$��Oǫ�wȆ�\x�iw���������������M�e�pQS�y����B�Kf��<���iy
�h�{X؏e��>��{*���s�k�\p����ͩ�Xda��s����O���BtX�<�M8���1��}Ҳ��S�Bc�T���y�s[KkN����G=,�:�/r���~�����3�Q�3����ζD��t<m�m��c�M8���}z��A��Ku"�M̧��j����$/��,���͗_���v�y��������7ס���?��b�x�+um�x�,����xT��-����c�{�����h�����^��k���?{�)fs��c^�_9c��	*�z��Mw���<�>�6��Q���"�B�p��a�XT�f�f̻��P ��x��͗_������7�b�
��C��f���Rֵ�S��Z�s�k~�]-�k��'���ǰ��2��PJ���h ��⧏�R}���?x�`)�/�B�/9E�ڄch�Cu"�F��O)苜�sj!t��Ğ�\�-�kZbR��"�tm{9�E=�S]�{�3W�qjx�p
�}6\[��H��R�rLP+���2�i�T�t<��I��ڄch�}؊1_�"��A���,Жv����������Z��r��mZ��	�Ձ�0��[ϋ�v����N ���rLo��Z+/|���X��-{�	�<(�Q�mm�ԥ� �z:^m��z'�d������}�����1_�9R��;��7� ]�u�54u'(����14���Q���[w���Wb�1g��X�'4��j��F��ż��y�ݓ����!GZ/햩h-=�,h�&�O)EP+m�1����Bl�w�Kb>'�Ss4���?s,A)�nd��M#?�kqͷT����cy���"� �aϹ�Z+/|{^{�h/�������E��+�����跒��^��cwא�=,���'_�۾����X��m�Zx�>�Dj��V��n��/�v����Rڇ��HK;��k�Rn���g%��ڴ��[p�W(vݘ]:M6pcq�{�a�k���Z%u~���==i[[��I�:K|���_c��/�U4�{�Y��g.r�Ι����X�W�y!�.����7����
I���pO��h������v�w:mX�c�p��H��T�鬕�V
���Pk��{����>);�sqԈyb��;�)3���1/���pz���zi/z*����t�����6�ڇY�eX�*��s��ݱ	[Y���A+�j�Z�X���+݌�q�{b��߹o�Q݅.s�e%/��w����B����^��?In���t�P[�m�1�ӆ�R(��|(�/�r
�����E��>[���׽	rPo��v��i�����F�n18�������)ݣY�kL�9N_����w�oXqݶ��\p��¨7s4��"���r�!��fr����&��t�&c����(����]��_�q���(����L�3�2#�m���aӉ^�����I=��7�8=fl����(�K.�F�:Lb4������7�M@E�w:m(d�M8��a�<{���,���ٝQ�A;�����{X�t���>9�{&S�&�ܿ�mb�z̈́2��k���k�8u�z!T�Q��1����t��PK�m�15ڇ]�X��>l�"���yNa���Ǹv��z���(��\B�u��1�zH�aqm���Z}���x���|��k��ȫ��~����x���%\����� ��>룁bz\/	c���� ]`�t��PK�m�1+�k��3f�;Ac{������^�4�ą9��oӵM��{0&��}R��9�^�<~t֝��#�7� �t.�:ȋ��s���h�N�Kt�<�kT����Fk���6zo�i�vʂ�"�1�qn)���~��k�We13�n�6�F�`\f��,��	�ym
����V���93���0/(����@��K�7H/�=��3R���޶S���6ᘹ��t�IN��>lPJ�Oz��������q
�?��׶�ݟ�R����xt���Do�}�F��8o��$r��|}�~;�[.����8hI��]���� ��t���v�-��=v�F�i�#��ڎ�T~��R,�,[Ϳq��k��F����cSo�}V�sƽ�q_/����N��.���{8�ziO1�͍̖��k�k0]�S�K��B/�s�C�dO�&l%u���w�cB1��Z�џ��.��ߧ���  �IDAT�#O�iw̅X��XǊ��;@'��`)f��b8��M�Z��)���y9��c������2�i(>{���"��[.���X�3f�ڎ��Ү�;�@E�</&u�t��N��^ۄ��5��a�ޝ\���F�kvg\���b1]$mGq��en��:�R�!�KX^�t6�Ǖ��@o����sjc;x�8�nj�[�=�-\��Bf��%/�fy4�Fg�]�:4�����x1��2E{�R��=�	K�K0~i�%!��-�_��KoLM��ϛ�:k{q������i���M�{\���To�}�n�9�����EGz�y�T�Gi0�#@'&OǋY:5��i��"�Ǐ�|m���-�pD��B���%��~4��Wo\Wz�U�~�5�?屴�O���_�=�?~���w���m�����_W���������0[�������r���r�E^ �Vk�Z��غ��z���s.tuS���x1ڹZ5�D�/������4��.n���MX
�S����W�Ew�w?sF*hv��ӂg��k	��������_F���x���S,�5�����w����z�_����zz�^�����@�:����=���ũy"�m�������-����;=�MXw{���?i��{δ���w�S��~�K��b���6�O�����v:�焦h����"�#Tk���!/�cn4��%{����y0t�ܩyZ���靃�⧏�#�N��d��L�F,�\h7������*x^m'h(2Nc?�K^}�u�Bl�wz{�����	�"I���:݁�16k�I�M�r��$��w#��C.t��\p�R��E�,���;B�v���^�R�P�ɑk���*�����������a�G�ۄ��z���I���~m�.���[$�]�uq���65O����/���ctϾ�2ާ�x3���X���Ʌq��"I��V5	�C=��`ԡM]@E��QH{�H(�j���)A�7�9����$���Cn� �u�M}����Bh�(q�����;��r��(����amS��-�NB����V�S��#R?wJ�[ء����\��\i;�?yѩQ��"��K�����º����x1�	��B�ܜļ�����L�����f%.~�i����BR�s��'����O����7:�=�k?���6[����s�螔��"��0Gյ�f�4���k5��{�䂲S1;�g��P���8����-����~:^L�V�%g�LB7��NO�����]}���yQ
����l1_�Pr�����5xQn=N�('n3[)O���am�ݣ�7��36��}b*��r�vs��*��)�Rum�{E^�����kF� *�?��D���� �s�7���EP��0��8����-i�$^m�am�RmU�dt�>Y��`��$:�\ؗ�\ز ���O�/m���E�#F�޵�����zi��$���ana�5�
�RoR�#�j/t2���ah�p��~�K ���������p�C��g
F�����>Պ�)ȅ�m9Mα����ȋ�0H��z��@˨�
,����t<��C�m�7��><~��wO�������׾K����Zy|����[ڇ��q^D����emSr
�����.&:W���NP�UЍ��?����/~����t��B��Q)"����\9~<w����zBI<��ۊ���a4P�FcɅ�o�Zx��v!��,,|�`��t<C7�/�r���}�[�3;���j�S��z��Jl��zY�T���qw;���k�B�,��܎���~���|}6���%_3/]�rRu)c{��HXu��r��V�j��d�t���ؗ_����A=���[nϺ��}!��B%����kV���F���w��?B��ɟ1�)��������}=���L.�S��%�P_N�k�B>y�'}��^71���{OF�rhS����(iViX�`|��Ǐ���c����_���<XW�B#i�|H������I�i7�]���P^w���L�6?h �K��0'1�bm�)t6z�8Y����/���� &�6?:���!�"ƥ-~���@�jԥ+Wf����1�k���k�yh����C�5"gg��>sa�hɍ���M赛���QX�U�3q[,�=|x��7�1Y�����B����3ԅO������p�I�� buG��5���/?�^1�
�mµc�ŵ�\G���K�}�W_{��qB�b�:!/�T��Z�0�p?��m�U��nDA�?ѯ5ra�m|�j�O��bEP���� /�o��J Vǔ���4*�&���4�Y�ˢa-ۄ�=|�$�..]p�����}J�j��?3P�ʖ�OW�Bhbw����r��h˓c��
�\�[?5�@cRNC[�B�S�|���Ǐ�Nb�ůs��~4���͋3��X[atIҩ�֯����Qڄc�	�~�3�~�����AD�wNo~� >+��*���T�\��O�'Wo\?�����z�����V$�+|��a���*�L��w��}2S�|I(~6��\��_��y\ob$���0Q�ѼXT1�E�Xݣ�*k�^,�W4�)F���V��diM\�&<K;�jB.�'��d�5L,�����] �;�ȋݨک�Z�P���6K�9r!����۴��U��F������T$�n"���HD.,����&�|���]�]s&����j�G�ϋ���7��,�>��&l5Ǳew3��
sm��]��?׌��	J^�F��ϐ��S����Ua�Y�!����t�ړ�#��̶,~���_�V��?;����'7����<7ݛ�лX�����:�{��$V��</��3q<�����s��Ӓ��=�Pj�	��σ��&,��'������c��O>�!������{�g\hvyz�����ȋ~�g�G�U�F7�5kow��o�]<?W��'����5�{9i7����L��C���������#��$V荚1�>`�աXߨy��eݣ=�x�0�J�)�B��k�����D"�ϩ �?�Ϲ���,�x1��aH�ŠZ���koW���%����BĦ3@�,���7B���F�(�v�?~���D`]�^r��I�"���"�liԼX����!��7j^�?'�|�����ׇ[�c�6��z��>V?��\�\��P����
b1E�,G^#�)e�g,����k���r!ߦO�f1dԓvE���~VƋ�ǟi�g"r>�(����'����'��n��8��Z{��8/�g4�q^D�?���m�rag�Z�c�O7��ϙv����'_;#���},�1��8��y�wͬ�]k?ɅS���GT=��5wҮ��װ��M}�{���X!����S��ȅZ'�j�������Y;�M^��h���(�`t2��&L. ���9�%��c~u�Uv���o��n��-���,~�a���G$�^���z�n��͹�tq���j?]O?�'��l�f�Q}C�B˓XC*��
ۺ��+�&/D��N��A�aۄ����o�-)~b<'���@i���V��g�ԋȅ:���or�פ��v[?}%'U����
ݜ�J,�����>'�5u�������m�B.�VJkp���	c�q>��d'ρ���\���4Ž}]a�]=nȅz,� =j}ڗKyҮ?�e�\�>�Uc�0w��}g��c�1�Y�g�f,/J^/�kw���ZXÌi�6�
���5(~.yI�X��ۜ�Wv����I��k�koo�]�nD.�g� ��i_�O�mqc��.v��E�������I���0��36e4/r^/݃jFi&��R��uRu'����k���O�_�����I=&�І�C���o�����/rX�kNs����K�"�&5:�V[�T��,�1��=��]�$֐�I����~W�ۅY��[��ϥ�^��;�yt�씟�w~�)90�x=O.�W��D��\�O���kt8���ym���k��m�Y����-���x���%�QR�L��.�0sFg1����ObEgZ��|�`t�ڨMX�ylǊ�s�I. �����s�}_�͋�"�E��<����0P��B��i_��5�^�ɠX�Q��ʹ�:� �9>���
E�����k�z��d�n7F�@o�6�cTD�&��'EЩ�dI�}߃g��[犲��L-���{4rt�n_�}��S��r�WA�sq�g�{V���꾲�sa��X������3��C^��X�]�at"���Zy�6��s
! �x�x���5A��Xy�8��v ���lgJ��uc�Q��f���	�w�[�O�ok�whY�	�?��K.�xk��-�u^���گ�1�zl�B.�ka��Q�xɼ��>�
�o���_��s(��<!*�~h���_���׿Iڹ���������K�Ӯs������a���ᤝss�I��z^�؂�����el!�����[�MXaq-O.���!�0_��o�(��vD{oD�9ϡVM�\��l�Ů�Թ=��Ay㪑�3I8� �9��[<��v$W�ǥ:YX$�朂�F���-Xϋ����=�e�MX�1V�R�&\���r��ر��*XG.4����@�
BX�z����`�s��I����u����z��ؿ��=k�'�X�}k�[h��b���ܵ�J�S�\@���}_�{D�b������-���^�7�.~~�ߙ�sa��X���>��?�Y�}�ؚ���Ba錻�g1�9EPE|�^���H0��/���K��2�~B.��Z�Ș�}%=�{�Ǐ~�w~Q���Gr��������O5'��~��%{ͅNb={L�b=���5l����sֶ݃h��:���l�+~V@^@m�v�Ƈ|��x
��}��x;��͗_�A5���M.=����8a>/�gl���e�{e����=�PB�#�?��Y���ƚ�O���9�㰸t��i_��W=N��Vwh촯�7���D,"'EP/I�j�sa��X���5��XGOyA<c-F�b��jG��D�,�V�:�Tu������bLO�Oy���c�\ �U4�C�����spO��t����g�=���=�7�z���s
�"�M���!���:�o͟/9���x��V�F��[k�L�"���8��F�7���\˦-���+l%�b�-~�t��I���.���vHSͅY_��,X4���^�k�|��b����x�Zz��{���9�lG5��R�����\���3@{^��8)����L5A�ω�zq還Yɠ�0�-���Z�,y����x�Z�����&6�G�|��.�o~pK5���טTȑ�]=!�A^ �B�6/���Xȷ|���7�{��~ɥ+WNZ���ސS]�� ��O������"��e8/�gl�A^dw���9�|���cw}���7p�X��U�#�p�� ȅ��(��ظ!�y-n��|������/_�>{�p����k�?ּ+�\tW��}Z�=���ϸ�s��GՓXS����-�����LI,�_݃�8�\ Α���3�^m�3)Vu������T5W4�.�x�P���9�8 �C���"hlG��w�ɵ�T��@E�O�W�v�UǻXKQ���ӈg��=�� �#/�r�?@�������~4&V��O*B)����;��vq�=�3����\ Α����m������Ί�.�p�׿|}���>V?g��I<��q1����@>�ke�zt`� �#/�r�v�U�c�p��k�����=�I�p��X�����ܺ%w���&��F��Z�0�Gda=K�a� �#/�ra,����;�5)�=���A</0�8 �s�p@.l������  ���=�� �#/�r��]Wk��C�X��g��@<  atp@. ����\;@�Z���Z�ρ"9  ;B�
p@. ����\����( .}���@� �bQ��9�8 �B�����{����  ���=�� �#/�ra,� �d�  �����\ Α���)
������ �ctp@. ����\���,[=�  h����z@m�p�� ȅ����  ث��/�\,!�s�p@.��(  �N�����bu��9�8 �@<  �NYX�2�X�r�X��X�r                                                                                                                                                                                                                                                                 @D�?�ءC�R�    IEND�B`�          [remap]

importer="texture"
type="StreamTexture"
path="res://.import/n.png-081d70e52f42ed435f724b65b4a1128c.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://n.png"
dest_files=[ "res://.import/n.png-081d70e52f42ed435f724b65b4a1128c.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
       [remap]

path="res://HTMLFiles.gdc"
            [remap]

path="res://Main.gdc"
 �PNG

   IHDR   �   �   �F�   sRGB ���  �IDATx���ۖ�*EQ<����9/e��lE .D���U	�[I/�                   pv����Z{��8���:몍Vm��o����	ηLAj�S��u�*۪�+��|����j����o,
����2�iw��o�;���9�[=��O���gxVԧE����v6�e�H�q��$D��C�B������.�,��J��O�A�h����e���(���u�j��}�� ����8�K�_T&ѫ��[����n�,�ĳ�_�KX���x�������V�I]�>�@��<�7���Z�3#=�"���Sb��i8@�?��mM"�k2ňH�2���p*/x�u�g���-�i9d�M]�sX��[O�"�:W��0�m��f�����W�d�즼�����l�ov=�³�f�4'���_����@�g_��}Ϝ,�r�i�5<�\��G}���B.��iyKp2��
S�^Vq�1<�G�R�́��,nqz��O)N#!�W3@�7��nYF�R��@�h?�j�f;U�L��t�hSW���z�>7s��B�-<��X��6��ᤴ���ե��#�S�V���]���je�du>}��$�+D?u�Q��21Z���R�(��I��䩺7�(��S��,�gN��!�Ht�9E~����O)
+ѭyN�?��2DQ���q����E��4'�<���|E��C!���L'���+��ZW/8��ɏ��;N��{F��f�����!��,�p������O���c�2@��>�V��aT�^�1
���uOo�KM�0چ�B";�^�5�ڗJ�,���Y�J��1�����_������V���mQF��/[�0y��lE���/�(���	퇗3���+CC��mD�z]� �[x5u\����@���U�wZ��9ۦ� Eϓwnd�/��-<;UҖ4z���$E�V�y�իIچj�a'fֺ-9�D��Q�s�W�6R݆��4�O��q�E��ii�5���O];!�5?�c�Gw��k�-.g�#)bxNZ��xP�i�Se�~`e�"��$���y��]�̇V�(CxN��3�6�zZ�<#1MxFI��_�`|G���չ��>Ϻ��o�8S���Q�Q�&x���B���u�*۪�� ��OW�`�^Ϻ                                 ����&�Ŏ��    IEND�B`�        ECFG      application/config/name         ScaleNX    application/run/main_scene         res://Main.tscn    application/config/icon         res://icon.png     autoload/HtmlFiles         *res://HTMLFiles.gd    importer_defaults/texture\              compress/bptc_ldr                compress/hdr_mode                compress/lossy_quality    ffffff�?      compress/mode                compress/normal_map           	   detect_3d                flags/anisotropic                flags/filter             flags/mipmaps                flags/repeat          
   flags/srgb              process/HDR_as_SRGB              process/fix_alpha_border            process/invert_color             process/premult_alpha             
   size_limit               stream            	   svg/scale        �?)   physics/common/enable_pause_aware_picking         )   rendering/environment/default_clear_color                    �?)   rendering/environment/default_environment          res://default_env.tres        