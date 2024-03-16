if (instance_exists(baddieID) && baddieID.state != states.hit && baddieID.invtime == 0 && other.thrown == 1 && !baddieID.invincible && (baddieID.object_index != obj_noiseboss || (other.object_index != obj_pepjunk || !other.noisethrow)) && baddieID.destroyable)
{
	if (baddieID.destroyable && (!baddieID.elite || baddieID.elitehit <= 0))
	{
		instance_destroy();
		instance_destroy(baddieID);
	}
	else
	{
		var lag = 2;
		baddieID.hitLag = lag;
		baddieID.hitX = baddieID.x;
		baddieID.hitY = baddieID.y;
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
}
