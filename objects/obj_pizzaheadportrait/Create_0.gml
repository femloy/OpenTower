event_inherited();
pizzahead = false;
override_throw = false;
spd = 6;
vsp = 0;
grav = 0.5;
hasgrabbed = false;
image_speed = 0.35;
bounce = 3;
land = false;
move = true;
depth = -10;
mask_index = sprite_index;
alarm[1] = 10;
idlespr = spr_pizzahead_TVprojectile;
bouncespr = spr_pizzahead_TVprojectilebounce;
var palinfo = get_pep_palette_info();
if !obj_player1.ispeppino
{
	palinfo = get_noise_palette_info();
	sprite_index = spr_pizzahead_TVprojectileN;
	idlespr = spr_pizzahead_TVprojectileN;
	bouncespr = spr_pizzahead_TVprojectilebounceN;
}
spr_palette = palinfo.spr_palette;
paletteselect = palinfo.paletteselect;
patterntexture = palinfo.patterntexture;
