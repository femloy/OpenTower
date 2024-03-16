if grounded
{
	with obj_camera
	{
		shake_mag = 3;
		shake_mag_acc = 3 / room_speed;
	}
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_baddiegibs);
	with (instance_create(x, y, obj_sausageman_dead))
	{
		sprite_index = other.sprite_index;
		image_speed = 0;
		image_index = other.image_index;
	}
	instance_destroy();
}
scr_collide();
