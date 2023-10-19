function scr_pizzaball_golf()
{
	sprite_index = spr_pizzaball_stun;
	image_speed = 0.35;
	vsp = 0;
	hsp = 0;
	var _i = 9;
	if (!player.ispeppino)
		_i = 7;
	if (player.key_up || shootup)
		arrow = true;
	else
		arrow = false;
	x = player.x + (23 * player.xscale);
	y = (player.y + 23) - 25;
	if (player.sprite_index == player.spr_golfswing && floor(player.image_index) == _i)
	{
		x = player.x;
		y = player.y;
		global.golfhit++;
		notification_push(notifs.pizzaball, [player.object_index]);
		GamepadSetVibration(0, 0.8, 0.8, 0.65);
		fmod_event_one_shot_3d("event:/sfx/misc/golfpunch", x, y);
		if (player.key_up || shootup)
			scr_pizzaball_go_to_thrown(player.xscale * 15, -16, false);
		else if (player.key_down)
			scr_pizzaball_go_to_thrown(player.xscale * 18, 5, false);
		else
			scr_pizzaball_go_to_thrown(player.xscale * 17, -7, false);
		if (scr_solid(x, y))
		{
			x = player.x;
			y = player.y;
			while (scr_solid(x, y))
				x += player.xscale;
		}
		with (instance_create(player.x + (50 * player.xscale), player.y, obj_bangeffect))
			depth = -11;
	}
}
