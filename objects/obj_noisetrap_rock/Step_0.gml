if (obj_player.x > (x - 200) && obj_player.x < (x + 200))
{
	if pushing == 0
	{
		hsp = image_xscale * 3;
		pushing = true;
		sprite_index = spr_noisepushrock;
	}
}
if (place_meeting(x + hsp, y, obj_noiserock))
	obj_noiserock.hsp = hsp;
if ((obj_noiserock.falling == 1 || obj_noiserock.hit == 1) && jumpaway == 0)
{
	sprite_index = spr_playerN_jump;
	image_index = 0;
	image_xscale *= -1;
	hsp = image_xscale * 3;
	vsp = -5;
	jumpaway = true;
}
if (sprite_index == spr_playerN_jump && floor(image_index) == image_number - 1)
	sprite_index = spr_playerN_fall;
if sprite_index != spr_playerN_jump && sprite_index != spr_playerN_fall
	scr_collide();
else
{
	if vsp < 12
		vsp += grav;
	x += hsp;
	y += floor(vsp);
}
