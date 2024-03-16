var _x = x;
var _y = y;
event_inherited();
if (x != _x || y != _y)
	sprite_index = walkspr;
else
	sprite_index = idlespr;
visible = obj_player1.visible;
if room == timesuproom
	visible = false;
if idlespr == spr_noisey_ctop_idle && image_xscale == -1
{
	if sprite_index == walkspr
		sprite_index = spr_noisey_ctop_walkleft;
	else if sprite_index == idlespr
		sprite_index = spr_noisey_ctop_idleleft;
}
