if sprite_index != spr_pizzaball_roll
	image_speed = 0.35;
else
	image_speed = movespeed / 10;
if image_speed < 0.2
	image_speed = 0.2;
current = place_meeting(x, y + 1, obj_current);
switch state
{
	case states.normal:
		scr_pizzaball_normal();
		break;
	case states.tumble:
		scr_pizzaball_roll();
		break;
	case states.golf:
		scr_pizzaball_golf();
		break;
}
if kicked
	mask_index = msk_pizzaball_crouch;
else
	mask_index = spr_pizzaball_idle2;
with (instance_place(x, y + 1, obj_destructibleplatform))
{
	falling = true;
	if falling == 1
		image_speed = 0.35;
}
if grounded && obj_player.state == states.freefallland
	vsp = -11;
