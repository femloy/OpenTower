hsp = 0;
vsp = 0;
grav = 0.5;
grounded = false;
movespeed = 0;
image_speed = 0.35;
countdownmax = 120;
countdown = countdownmax;
depth = -10;
kick = false;
drop = false;
mask_index = spr_player_mask;
platformid = -4;
hsp_carry = 0;
vsp_carry = 0;
var i = 0;
while (scr_solid(x, y))
{
	x += obj_noiseboss.image_xscale;
	i++;
	if i > room_width
		break;
}
