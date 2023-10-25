var a = random_range(-40, 40);
alarm[0] = 5;

var xx = x + a;
var yy = y + a;
if (instance_exists(obj_drawcontroller))
{
	array_push(obj_drawcontroller.particles, 
	{
		x: xx,
		y: yy,
		sprite_index: spr_cloudeffect,
		image_number: sprite_get_number(spr_cloudeffect),
		image_index: 0,
		image_speed: 0.35
	});
}
