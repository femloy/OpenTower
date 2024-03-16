mask_index = spr_player_mask;
if obj_player1.state == states.backbreaker && state != states.backbreaker
{
	storedstate = state;
	storedsprite = sprite_index;
	state = states.backbreaker;
	instance_create(x, y, obj_tinytaunt);
	sprite_index = tauntspr;
	image_index = irandom(sprite_get_number(tauntspr) - 1);
}
switch state
{
	case states.normal:
		sprite_index = movespr;
		hsp = image_xscale * 2;
		if (scr_solid(x + sign(hsp), y))
		{
			image_xscale *= -1;
			hsp *= -1;
		}
		else if (!(scr_solid(x + (image_xscale * 32), y + 31) || place_meeting(x + (image_xscale * 32), y + 31, obj_platform)))
		{
			image_xscale *= -1;
			hsp *= -1;
		}
		x += hsp;
		break;
	case states.idle:
		sprite_index = idlespr;
		hsp = 0;
		break;
	case states.backbreaker:
		hsp = 0;
		vsp = 0;
		if obj_player1.state != states.backbreaker
		{
			state = storedstate;
			sprite_index = storedsprite;
		}
		break;
}
vsp = 0;
