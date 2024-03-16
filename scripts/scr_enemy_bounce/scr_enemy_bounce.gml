function scr_enemy_bounce()
{
	if !grounded
		hsp = image_xscale * movespeed;
	else
		hsp = 0;
	if (sprite_index == jumpprepspr && floor(image_index) == image_number - 1)
	{
		if global.bosshealth == 8
		{
			attack = 10;
			jumpheight = 14;
			movespeed = 3;
		}
		if global.bosshealth == 7
		{
			attack = 10;
			jumpheight = 7;
			movespeed = 5;
		}
		if global.bosshealth == 6
		{
			attack = 10;
			jumpheight = 14;
			movespeed = 6;
		}
		if global.bosshealth == 5
		{
			attack = 50;
			jumpheight = 16;
			movespeed = 5;
		}
		if global.bosshealth == 4
		{
			attack = 10;
			jumpheight = 20;
			movespeed = 3;
		}
		if global.bosshealth == 3
		{
			attack = 250;
			jumpheight = 16;
			movespeed = 3;
		}
		if global.bosshealth == 2
		{
			attack = 200;
			jumpheight = 12;
			movespeed = 5;
		}
		if global.bosshealth == 1
		{
			attack = 120;
			jumpheight = 10;
			movespeed = 2;
		}
		sprite_index = jumpspr;
		vsp = -jumpheight;
	}
	if vsp > 1 && jumpspr
		sprite_index = airspr;
	if sprite_index == airspr && grounded
	{
		image_index = 0;
		with obj_camera
		{
			shake_mag = 4;
			shake_mag_acc = 4 / room_speed;
		}
		sprite_index = landspr;
	}
	if (sprite_index == landspr && floor(image_index) == image_number - 1)
	{
		if (global.bosshealth == 8 && !instance_exists(obj_noisey))
			instance_create(room_width - (room_width / 4), 60, obj_noisey);
		else if (global.bosshealth == 7 && !instance_exists(obj_noisey))
		{
			instance_create(room_width - (room_width / 4), 60, obj_noisey);
			instance_create(room_width / 4, 60, obj_noisey);
		}
		else if (global.bosshealth == 6 && !instance_exists(obj_noisey))
		{
			instance_create(room_width - (room_width / 4), 60, obj_noisey);
			instance_create(room_width / 4, 60, obj_noisey);
		}
		else if (global.bosshealth == 5 && !instance_exists(obj_noisey))
		{
			instance_create(room_width - (room_width / 4), 60, obj_noisey);
			instance_create(room_width / 4, 60, obj_noisey);
		}
		else if global.bosshealth == 4
		{
			if (!instance_exists(obj_noisey))
				instance_create(room_width / 4, 60, obj_noisey);
		}
		else if global.bosshealth == 3
		{
			instance_create(x, y, obj_crushershockwave);
			with (instance_create(x, y, obj_crushershockwave))
			{
				movespeed = -3;
				image_xscale = -1;
			}
			if (!instance_exists(obj_noisey))
				instance_create(room_width - (room_width / 4), 60, obj_noisey);
		}
		if global.bosshealth == 2
		{
			instance_create(x, y, obj_crushershockwave);
			with (instance_create(x, y, obj_crushershockwave))
			{
				movespeed = -3;
				image_xscale = -1;
			}
			if (!instance_exists(obj_noisey))
			{
				instance_create(room_width - (room_width / 4), 60, obj_noisey);
				instance_create(room_width / 4, 60, obj_noisey);
			}
		}
		if global.bosshealth == 1
		{
			instance_create(x, y, obj_crushershockwave);
			with (instance_create(x, y, obj_crushershockwave))
			{
				movespeed = -3;
				image_xscale = -1;
			}
			if (!instance_exists(obj_noisey))
			{
				instance_create(room_width - (room_width / 4), 60, obj_noisey);
				instance_create(room_width / 4, 60, obj_noisey);
			}
		}
		image_index = 0;
		state = states.idle;
		sprite_index = idlespr;
	}
	image_speed = 0.35;
	scr_collide();
}
