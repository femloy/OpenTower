if !noise_grabbed
{
	if grabbed
		linethrown = false;
	if linethrown
	{
		vsp = 0;
		hsp = hithsp;
		if (place_meeting(x + sign(hithsp), y, obj_solid) || (place_meeting(x, y, obj_player) && obj_player.state != states.handstandjump))
		{
			instance_destroy();
			if obj_player1.flash
				obj_player1.flash = false;
			scr_hurtplayer(obj_player1);
		}
	}
	event_inherited();
	with obj_noiseboss
	{
		if (state == states.golf && ((other.x < (x - 16) && other.y > (y - 50)) || place_meeting(x, y - other.hsp, other) || place_meeting(x, y, other)))
		{
			if !other.noise
			{
				other.noise_grabbed = true;
				other.thrown = false;
				sprite_index = spr_playerN_golfswing;
				image_index = 0;
			}
			else
				scr_noise_do_hurt(other.id);
		}
	}
	if !linethrown && !thrown && noise && grounded && vsp > 0
	{
		instance_destroy();
		if obj_player1.flash
			obj_player1.flash = false;
		scr_hurtplayer(obj_player1);
	}
}
else
{
	with obj_noiseboss
	{
		other.x = x + (20 * image_xscale);
		other.y = y;
		if (sprite_index != spr_playerN_golfswing || floor(image_index) >= 9)
		{
			other.noise = true;
			other.noise_grabbed = false;
			other.image_xscale = -image_xscale;
			if wastedhits < 10
			{
				other.hsp = image_xscale * 8;
				other.vsp = -17;
			}
			else if wastedhits < 12
			{
				other.hithsp = image_xscale * 12;
				other.hsp = other.hithsp;
				other.linethrown = true;
			}
			else
			{
				other.hsp = image_xscale * 2;
				other.vsp = -14;
			}
		}
	}
}
