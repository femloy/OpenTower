image_speed = 0.35;
state = states.normal;
idle = 0;
hsp = 0;
vsp = 0;
hsp_carry = 0;
vsp_carry = 0;
grav = 0.5;
platformid = -4;
arrowID = -4;
drawing = false;
money_y = 0;
noisette = false;
spr_helicopter = spr_stick_helicopter;
kiss_snd = fmod_event_create_instance("event:/sfx/noisette/kiss");
if (!obj_player1.ispeppino || global.swapmode)
{
	sprite_index = spr_noisettestick_idle;
	noisette = true;
	spr_helicopter = spr_noisettestick_helicopter;
}
