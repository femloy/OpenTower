enum afterimage
{
	simple,
	mach3effect,
	heatattack,
	firemouth,
	blue,
	blur,
	enemy,
	fakepep,
	noise,
	
	enum_length
}

depth = 1;
global.afterimage_list = ds_list_create();
alpha = array_create(afterimage.enum_length, 1);
alpha[afterimage.heatattack] = 0.5;
shd_alpha = shader_get_uniform(shd_firemouth_afterimage, "newAlpha");
shd_color_red = shader_get_uniform(shd_color_afterimage, "red");
shd_color_green = shader_get_uniform(shd_color_afterimage, "green");
shd_color_blue = shader_get_uniform(shd_color_afterimage, "blue");
