instance_create(x, y, obj_slapstar);
instance_create(x, y, obj_slapstar);
instance_create(x, y, obj_slapstar);
instance_create(x, y, obj_bossdefeatflash);
obj_tv.message = "VICTORY!!!";
obj_tv.showtext = true;
obj_tv.alarm[0] = 260;
obj_tv.tvsprite = spr_tvclap;
obj_tv.image_speed = 0.1;
obj_player.image_index = 0;
obj_player.x = 608;
obj_player.hsp = 0;
obj_player.y = 498;
obj_player.sprite_index = spr_player_levelcomplete;
obj_player.state = states.bossintro;
if reset == 0
{
	instance_create(x, y, obj_bangeffect);
	if stomped == 0 && shot == 0
	{
		if cigar == 1
		{
			with obj_camera
			{
				shake_mag = 5;
				shake_mag_acc = 20 / room_speed;
			}
			with (instance_create(x, y, obj_sausageman_dead))
				sprite_index = spr_noisesatellitedead;
		}
		else
		{
			with obj_camera
			{
				shake_mag = 5;
				shake_mag_acc = 20 / room_speed;
			}
			with (instance_create(x, y, obj_sausageman_dead))
				sprite_index = spr_noisesatellitedead;
		}
	}
	if stomped == 1 && shot == 0
	{
		if cigar == 1
		{
			with (instance_create(x, y, obj_sausageman_dead))
			{
				sprite_index = spr_noisesatellitedead;
				with obj_camera
				{
					shake_mag = 5;
					shake_mag_acc = 20 / room_speed;
				}
				hsp = 0;
				vsp = 0;
				cigar = true;
			}
		}
		else
		{
			with (instance_create(x, y, obj_sausageman_dead))
			{
				sprite_index = spr_noisesatellitedead;
				with obj_camera
				{
					shake_mag = 5;
					shake_mag_acc = 20 / room_speed;
				}
				hsp = 0;
				vsp = 0;
			}
		}
	}
	if shot == 1 && stomped == 0
	{
		if cigar == 1
		{
			with (instance_create(x, y, obj_sausageman_dead))
			{
				sprite_index = spr_noisesatellitedead;
				with obj_camera
				{
					shake_mag = 20;
					shake_mag_acc = 40 / room_speed;
				}
				hsp *= 3;
				vsp *= 3;
				cigar = true;
			}
		}
		else
		{
			with (instance_create(x, y, obj_sausageman_dead))
			{
				sprite_index = spr_noisesatellitedead;
				with obj_camera
				{
					shake_mag = 20;
					shake_mag_acc = 40 / room_speed;
				}
				hsp *= 3;
				vsp *= 3;
			}
		}
	}
}
