if defused == 1
	countdown -= 0.5;
if countdown < 50
	sprite_index = bomblit_spr;
var _destroyed = false;
if countdown <= 0
{
	_destroyed = true;
	instance_destroy();
}
if kickbuffer > 0
{
	if (!place_meeting(x, y, obj_player))
		kickbuffer = 0;
}
switch state
{
	case states.normal:
		hsp = movespeed * image_xscale;
		if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_ratblock))
			image_xscale *= -1;
		if (place_meeting(x + hsp, y, obj_ratblock) || place_meeting(x, y + vsp, obj_ratblock))
			instance_destroy();
		if (scr_solid(x + 1, y) || scr_solid(x - 1, y))
			drop = true;
		if grounded
		{
			if movespeed > 0
				movespeed -= 0.5;
		}
		if (place_meeting(x, y + 1, obj_railparent))
		{
			var _railinst = instance_place(x, y + 1, obj_railparent);
			hsp = _railinst.movespeed * _railinst.dir;
		}
		if vsp < 12
			vsp += grav;
		scr_collide();
		break;
	case states.grabbed:
		grounded = false;
		x = playerid.x + (-playerid.xscale * 6);
		y = playerid.y - 55;
		image_xscale = playerid.xscale;
		if playerid.state != states.bombgrab && playerid.state != states.superslam
			state = states.normal;
		if state == states.grabbed && _destroyed
		{
			var h = playerid.hurted;
			var _savedstate = playerid.state;
			scr_hurtplayer(playerid);
			if ((playerid.hurted && !h) || (playerid.state != _savedstate && playerid.state == states.hurt))
				notification_push(notifs.hurt_player, [id, _savedstate, obj_canonexplosion]);
		}
		if playerid.state == states.superslam
		{
			if playerid.grounded
				instance_destroy();
		}
		break;
	default:
		state = states.normal;
		break;
}
if sprite_index == bomblit_spr
{
	if (!fmod_event_instance_is_playing(snd))
		fmod_event_instance_play(snd);
	fmod_event_instance_set_3d_attributes(snd, x, y);
}
if sprite_index == spr_bomb
{
	if (floor(image_index) == 5 && !bouncesound)
	{
		bouncesound = true;
		fmod_event_one_shot_3d("event:/sfx/pep/bombbounce", x, y);
	}
	else if (floor(image_index) != 5)
		bouncesound = false;
}
