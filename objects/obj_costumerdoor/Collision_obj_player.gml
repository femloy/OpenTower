with (obj_player)
{
	if (grounded && state != states.transition)
	{
		global.timeractive = false;
		global.panic = false;
		global.panicbg = false;
		image_speed = 0.35;
		x = other.x + 30;
		xscale = -1;
		state = states.transition;
		image_index = 0;
		costumercutscenetimer = 70;
		sprite_index = spr_player_knock;
		movespeed = 0;
		hsp = 0;
	}
}
