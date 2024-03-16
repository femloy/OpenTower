with (instance_create(1632, 1824, obj_boilingsauce))
	image_xscale = 4;
with obj_camera
{
	shake_mag = 15;
	shake_mag_acc = 30 / room_speed;
}
repeat 5
	create_debris(x, y, spr_metalblockdebris);
