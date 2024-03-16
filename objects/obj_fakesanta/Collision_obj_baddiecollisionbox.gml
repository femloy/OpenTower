var baddieID = id;
if (instance_exists(baddieID) && instance_exists(other.baddieID) && baddieID.thrown != 1 && !other.baddieID.mach3destroy && baddieID.state != states.hit && other.baddieID.thrown == 1 && other.baddieID.state != states.hit)
{
	fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y);
	if !baddieID.important
	{
		global.style += (5 + global.combo);
		global.combotime = 60;
		global.heattime = 60;
	}
	var lag = 5;
	if (baddieID.object_index != obj_tank || baddieID.hp <= 0)
	{
		baddieID.hitLag = lag;
		baddieID.hitX = baddieID.x;
		baddieID.hitY = baddieID.y;
		if (baddieID.object_index != obj_tank || baddieID.hp <= 0)
			baddieID.hp -= 1;
		instance_create(baddieID.x, baddieID.y, obj_parryeffect);
		baddieID.alarm[3] = 3;
		baddieID.state = states.hit;
		baddieID.image_xscale = other.baddieID.image_xscale;
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
		baddieID.hitvsp = -8;
		baddieID.hithsp = -other.baddieID.image_xscale * 15;
		baddieID.killbyenemybuffer = 10;
		other.baddieID.killbyenemybuffer = 10;
		if (baddieID.destroyable && (!baddieID.elite || baddieID.elitehit <= 0))
			instance_destroy(baddieID);
	}
}
