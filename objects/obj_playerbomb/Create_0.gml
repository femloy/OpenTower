hsp = 0;
vsp = 0;
grav = 0.5;
grounded = false;
state = states.fall;
dead = false;
movespeed = 0;
image_speed = 0.35;
countdownmax = 120;
countdown = countdownmax;
depth = -10;
mask_index = spr_player_mask;
platformid = -4;
hsp_carry = 0;
vsp_carry = 0;
var _palinfo = get_noise_palette_info();
spr_palette = _palinfo.spr_palette;
paletteselect = _palinfo.paletteselect;
patterntexture = _palinfo.patterntexture;
with (instance_create(x, y, obj_playerbombcollision))
	bombID = other.id;
if (place_meeting(x, y, obj_solid))
{
	x = obj_player1.x;
	y = obj_player1.y;
}
deadbuffer = 5;
baddie_arr = [];
