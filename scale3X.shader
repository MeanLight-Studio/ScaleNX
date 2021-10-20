shader_type canvas_item;

void fragment(){
	vec2 pixel_size = TEXTURE_PIXEL_SIZE;
	vec2 result_pixel_size = pixel_size / 3.0;
	
	vec2 current_pixel = (ceil(UV / pixel_size) - result_pixel_size) * pixel_size;
	
	int i = int(floor(UV.x / result_pixel_size.x)) % 3;
	int j = int(floor(UV.y / result_pixel_size.y)) % 3;
	
	int pixel_index = i + j*3;
	
	vec4 A = texture(TEXTURE, current_pixel - pixel_size);
	vec4 B = texture(TEXTURE, current_pixel - pixel_size * vec2(0.0, 1.0));
	vec4 C = texture(TEXTURE, current_pixel - pixel_size * vec2(-1.0, 1.0));
	vec4 D = texture(TEXTURE, current_pixel - pixel_size * vec2(1.0, 0.0));
	vec4 E = texture(TEXTURE, current_pixel);
	vec4 F = texture(TEXTURE, current_pixel - pixel_size * vec2(-1.0, 0.0));
	vec4 G = texture(TEXTURE, current_pixel - pixel_size * vec2(1.0, -1.0));
	vec4 H = texture(TEXTURE, current_pixel - pixel_size * vec2(0.0, -1.0));
	vec4 I = texture(TEXTURE, current_pixel + pixel_size);
	
	COLOR = E;
	
	switch(pixel_index){
		case 0:
			if(D==B && D!=H && B!=F)
				COLOR=D;
			break;
		case 1:
			if ((D==B && D!=H && B!=F && E!=C) || (B==F && B!=D && F!=H && E!=A))
				COLOR=B;
			break;
		case 2:
			if(B==F && B!=D && H!=F)
				COLOR=F;
			break;
		case 3:
			if((H==D && H!=F && D!=B && E!=A) || (D==B && D!=H && B!=F && E!=G))
				COLOR=D;
			break;
		case 5:
			if((B==F && B!=D && F!=H && E!=I) || (F==H && F!=B && H!=D && E!=C))
				COLOR=F;
			break;
		case 6:
			if(H==D && H!=F && D!=B)
				COLOR=D;
			break;
		case 7:
			if((F==H && F!=B && H!=D && E!=G) || (H==D && H!=F && D!=B && E!=I))
				COLOR=H;
			break;
		case 8:
			if(F==H && F!=B && H!=D)
				COLOR=F;
			break;
	}
}