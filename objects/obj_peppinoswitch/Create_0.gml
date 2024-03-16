global.switchbuffer = 0;
image_speed = 0.35;
playerid = obj_player1.id;
image_xscale = 1;
escape = false;
depth = -5;
sprite_index = spr_peppinoswitch1;
switchstart = spr_peppinoswitch1;
switchend = spr_peppinoswitch2;
spr_sign = spr_gustavosign;
collisioned = false;
if !obj_player1.ispeppino
{
	sprite_index = spr_noiseswitch1;
	switchstart = spr_noiseswitch1;
	switchend = spr_noiseswitch2;
	spr_sign = spr_noisesign;
}
