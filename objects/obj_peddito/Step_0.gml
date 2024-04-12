if state == 0
{
	x = Approach(x, obj_noiseboss.x, abs(hsp));
	y = lerp(y, obj_noiseboss.y, 0.08);
	if place_meeting(x, y, obj_noiseboss)
	{
		state++;
		noisex = obj_noiseboss.x - x;
		noisey = obj_noiseboss.y - y;
		vsp = 0;
		with obj_noiseboss
		{
			fmod_event_one_shot("event:/sfx/voice/noisescream");
			substate = states.ending;
			sprite_index = spr_playerN_bossintro;
			image_index = 0;
		}
	}
}
else
{
	vsp = Approach(vsp, -11, 0.8);
	x += hsp;
	y += vsp;
	with obj_noiseboss
	{
		x = other.x + other.noisex;
		y = other.y + other.noisey;
	}
	if x > room_width + 1200
	{
		instance_destroy();
		instance_destroy(obj_noiseboss);
		layer_set_visible(layer_get_id("Assets_2"), false);
		var lay1 = layer_get_id("Backgrounds_4");
		var lay2 = layer_get_id("Backgrounds_5");
		var bg1 = layer_background_get_id(lay1);
		var bg2 = layer_background_get_id(lay2);
		layer_background_sprite(bg1, bg_doisebossBG2end);
		layer_background_sprite(bg2, bg_doisebossBG1end);
		layer_background_speed(bg2, 0.35);
		layer_hspeed(lay1, 0);
		layer_vspeed(lay1, 0);
		layer_hspeed(lay2, 0);
		layer_vspeed(lay2, 0);
		instance_destroy(obj_doisecreature);
		if !obj_player1.ispeppino
		{
			with (instance_create(0, 0, obj_pizzahead_whitefade))
				whitefade = 1;
		}
	}
}
