function scr_throwenemy()
{
	if (instance_exists(other.baddieID))
	{
		with other.baddieID
		{
			hp -= 1;
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
			alarm[3] = 3;
			global.hit += 1;
			if other.object_index == obj_pizzaball
				global.golfhit += 1;
			global.combotime = 60;
			global.heattime = 60;
			alarm[1] = 5;
			stunned = 1000;
			thrown = true;
			state = states.stun;
		}
	}
}
