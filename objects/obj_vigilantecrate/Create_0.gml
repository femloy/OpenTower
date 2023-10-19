hsp = 0;
vsp = 0;
grav = 0.5;
hsp_carry = 0;
vsp_carry = 0;
grounded = false;
cow = true;
platformid = -4;
state = 0; // not an enum
alarm[0] = 50;
alertmax = 5;
alertvisible = true;
alarm[1] = alertmax;
create_red_afterimage(x, y, sprite_index, image_index - 1, image_xscale);
alarm[3] = 10;
