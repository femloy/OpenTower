var _dir = point_direction(x, y, x_to, y_to);
hsp = lengthdir_x(spd, _dir);
vsp = lengthdir_y(spd, _dir);
x = Approach(x, x_to, abs(hsp));
y = Approach(y, y_to, abs(vsp));
if !finish
{
	if (abs(x - x_to) <= 18 && abs(y - y_to) <= 18)
	{
		instance_destroy();
		scr_bosscontroller_particle_anim(spr_genericpoofeffect, 0, x, y, 0.5);
		with obj_bosscontroller
			player_hp++;
	}
}
if !obj_player1.ispeppino
	sprite_index = spr_bossfight_noiseHP;
else
	sprite_index = spr_bossfight_playerhp;
spr_palette = obj_player1.spr_palette;
paletteselect = obj_player1.paletteselect;
patterntexture = global.palettetexture;
