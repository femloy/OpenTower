image_speed = 0.35;
state = states.normal;
image_xscale = choose(-1, 1);
alarm[0] = 80 + irandom(70);
hsp = 0;
vsp = 0;
hsp_carry = 0;
vsp_carry = 0;
grav = 0.5;
platformid = -4;
idlespr = spr_toppincheese;
movespr = spr_toppincheese_run;
tauntspr = spr_toppincheese_taunt;
depth = 1;
while (scr_solid(x, y))
	y--;
