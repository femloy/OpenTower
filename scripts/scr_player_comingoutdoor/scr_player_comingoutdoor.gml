function scr_player_comingoutdoor()
{
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;
	machhitAnim = false;
	hsp = 0;
	if c < 255
		c += 5;
	image_blend = make_colour_hsv(0, 0, c);
	if floor(image_index) == image_number - 1
	{
		movespeed = 0;
		if isgustavo
			state = states.ratmount;
		else
			state = states.normal;
		image_alpha = 1;
		c = 0;
		image_blend = make_colour_hsv(0, 0, 255);
		if !ispeppino && room == freezer_1
		{
			state = states.animation;
			sprite_index = spr_playerN_freezerintro;
			image_index = 0;
			xscale = 1;
			fmod_event_one_shot_3d("event:/sfx/playerN/freezerintro", x, y);
			exit;
		}
	}
	if sprite_index != spr_Timesup
	{
		if steppybuffer > 0
			steppybuffer--;
		else
		{
			steppybuffer = 16;
			fmod_event_one_shot_3d("event:/sfx/pep/step", x, y);
		}
	}
	if sprite_index != spr_Timesup
	{
		if isgustavo
			sprite_index = spr_ratmount_exitdoor;
		else
			sprite_index = spr_walkfront;
	}
	image_speed = 0.35;
}
