with (instance_create(x, y, obj_sausageman_dead))
{
	sprite_index = spr_hamkuff_stun;
	usepalette = false;
}
with obj_player1
	supercharge += 1;
global.combo += 1;
global.enemykilled += 1;
global.combotime = 60;
var combototal = 10 + floor(global.combo * 0.5);
global.collect += combototal;
global.comboscore += combototal;
fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
repeat 3
{
	with (create_debris(x, y, spr_slapstar))
	{
		hsp = random_range(-5, 5);
		vsp = random_range(-10, 10);
	}
}
instance_create(x, y, obj_bangeffect);
with obj_camera
{
	shake_mag = 3;
	shake_mag_acc = 3 / room_speed;
}
