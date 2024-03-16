if (instance_exists(other.baddieID) && !other.baddieID.invincible && other.baddieID.destroyable && playerid.state != states.chainsaw && other.baddieID.state != states.hit && !other.baddieID.thrown)
{
	with other
	{
		fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y);
		fmod_event_one_shot_3d("event:/sfx/mort/mortslap", x, y);
		var lag = 5;
		baddieID.hitLag = lag;
		baddieID.hitX = baddieID.x;
		baddieID.hitY = baddieID.y;
		baddieID.mach3destroy = true;
		baddieID.hp -= 1;
		instance_create(baddieID.x, baddieID.y, obj_parryeffect);
		baddieID.alarm[3] = 3;
		baddieID.state = states.hit;
		baddieID.image_xscale = -other.image_xscale;
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_baddiegibs);
		instance_create(x, y, obj_baddiegibs);
		instance_create(x, y, obj_baddiegibs);
		with obj_camera
		{
			shake_mag = 3;
			shake_mag_acc = 3 / room_speed;
		}
		baddieID.hitvsp = -4;
		baddieID.hithsp = other.image_xscale * 10;
	}
	Mort_DownMovement();
}
