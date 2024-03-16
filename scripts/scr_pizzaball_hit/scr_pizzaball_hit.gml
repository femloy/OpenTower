function scr_pizzaball_hit()
{
	x = hitX + irandom_range(-6, 6);
	y = hitY + irandom_range(-6, 6);
	hitLag--;
	sprite_index = stunfallspr;
	if hitLag <= 0
	{
		x = hitX;
		y = hitY;
		var s = -1;
		with (instance_nearest(x, y, obj_player))
			s = tauntstoredstate;
		notification_push(notifs.pizzaball, [obj_player1]);
		var p = obj_player1.id;
		if (s == states.mach2 || (p.sprite_index == p.spr_machslidestart || p.sprite_index == p.spr_machslide || p.sprite_index == p.spr_machslideend))
			scr_pizzaball_go_to_thrown(hithsp * 0.5, hitvsp * 0.5);
		else
			scr_pizzaball_go_to_thrown(hithsp * 1.5, -12);
		global.golfhit++;
	}
}
function scr_pizzaball_grabbed()
{
	var pl = (grabbedby == 1) ? obj_player1 : obj_player2;
	with pl
	{
		sprite_index = spr_golfidle;
		image_index = 0;
		state = states.golf;
		golfid = other.id;
		hsp = 0;
		vsp = 0;
	}
	player = pl;
	state = states.golf;
	create_transformation_tip(lang_get_value("golftip"), "golf");
}
function scr_pizzaball_go_to_thrown(_hsp, _vsp, capped_vsp = true)
{
	instance_create_unique(156, SCREEN_HEIGHT + 400, obj_pizzaball_golfhit)
	hitbuffer = 8;
	hitspeed = abs(_hsp);
	if (sign(_hsp) != 0)
		image_xscale = sign(_hsp);
	jumpspeed = abs(_vsp);
	if capped_vsp && jumpspeed < 12
		jumpspeed = 12;
	vsp = -jumpspeed;
	bounced = false;
	state = states.thrown;
	substate = states.thrown;
}
