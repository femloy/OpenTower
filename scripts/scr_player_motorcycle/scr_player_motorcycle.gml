function scr_player_motorcycle()
{
	hsp = xscale * movespeed;
	if (grounded || !jumped)
		movespeed = Approach(movespeed, 13, 0.5);
	else
		movespeed = Approach(movespeed, 8, 0.5);
	image_speed = 0.35;
	if grounded
		jumped = false;
	if grounded && input_buffer_jump > 0 && vsp > 0
	{
		scr_fmod_soundeffect(jumpsnd, x, y);
		input_buffer_jump = 0;
		vsp = -11;
		jumped = true;
		jumpstop = false;
		sprite_index = spr_player_pizzacarjump;
		image_index = 0;
	}
	if !grounded && !key_jump2 && vsp < 0 && !jumpstop
	{
		vsp /= 10;
		jumpstop = true;
	}
	if ((place_meeting(x + sign(hsp), y, obj_solid) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_slope))
	{
		jumpstop = false;
		vsp = -11;
		state = states.tumble;
		sprite_index = spr_mach2jump;
		var i = 0;
		repeat (sprite_get_number(spr_pizzacar_debris) - 1)
		{
			with (create_debris(x, y, spr_pizzacar_debris))
			{
				image_index = i;
				vsp = irandom_range(-7, -12);
			}
			i++;
		}
	}
	switch sprite_index
	{
		case spr_player_pizzacarjump:
			if floor(image_index) == image_number - 1
				sprite_index = spr_player_pizzacarfall;
			break;
		case spr_player_pizzacarfall:
			if grounded && vsp > 0
			{
				sprite_index = spr_player_pizzacarland;
				image_index = 0;
			}
			break;
		case spr_player_pizzacarland:
			if floor(image_index) == image_number - 1
				sprite_index = spr_player_pizzacar;
			break;
		default:
			if !grounded && vsp > 0
				sprite_index = spr_player_pizzacarfall;
	}
}
