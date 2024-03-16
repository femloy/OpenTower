if other.cutscene == 0 && sprite_index != spr_bigmushroom_bounce && other.state != states.gotoplayer
{
	other.jumpstop = true;
	with other
	{
		grounded = false;
		if state == states.machslide
			state = states.jump;
		if (state == states.normal || state == states.freefall)
			state = states.jump;
		if state == states.climbwall
			state = states.mach2;
	}
	if (sprite_index != spr_bigmushroom_bounce || image_index > 5)
		fmod_event_one_shot_3d("event:/sfx/misc/mushroombounce", x, y);
	sprite_index = spr_bigmushroom_bounce;
	if (other.state == states.jump || other.state == states.normal)
	{
		other.sprite_index = other.spr_machfreefall;
		other.image_index = 0;
	}
	image_index = 0;
	other.noisewalljump = 0;
	other.vsp = -14;
	other.jumpstop = true;
	if other.isgustavo && other.state != states.ratmountskid && other.state != states.mach3
	{
		if other.ratmount_movespeed < 12
		{
			other.sprite_index = spr_player_ratmountmushroombounce;
			if !other.brick
				other.sprite_index = spr_lonegustavo_jumpstart;
		}
		else
		{
			other.sprite_index = spr_player_ratmountdashjump;
			if !other.brick
				other.sprite_index = spr_lonegustavo_dashjump;
		}
		other.jumpAnim = true;
		other.state = states.ratmountjump;
		other.image_index = 0;
	}
}
