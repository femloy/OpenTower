playerx = obj_swapmodefollow.x;
playery = obj_swapmodefollow.y;

if instance_exists(obj_swapplayergrabbable)
{
	playerx = obj_swapplayergrabbable.x;
	playery = obj_swapplayergrabbable.y;
}
playerx -= camera_get_view_x(view_camera[0]);
playery -= camera_get_view_y(view_camera[0]);

obj_player1.vsp = 0;
obj_player1.hsp = 0;
obj_player1.movespeed = 0;

taunt = false;
dest_x = obj_player1.x - camera_get_view_x(view_camera[0]);
dest_y = obj_player1.y - camera_get_view_y(view_camera[0]);

savedxscale = obj_player1.xscale;
spr_palette = obj_player.spr_palette;
paletteselect = obj_player1.player_paletteselect[(!obj_player1.player_paletteindex)];
patterntexture = obj_player1.player_patterntexture[(!obj_player1.player_paletteindex)];

if playerx != dest_x
	image_xscale = sign(dest_x - playerx);
else
	image_xscale = obj_player1.xscale;

buffer = 20;
speedx = abs(playerx - dest_x) / buffer;
speedy = abs(playery - dest_y) / buffer;
sprite = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0);
playersprite = spr_player_airdash2;
playerindex = 0;
ispeppino = obj_player1.ispeppino;
isgustavo = obj_player1.isgustavo;
noisecrusher = obj_player1.noisecrusher;

var vx = camera_get_view_x(view_camera[0]) + (SCREEN_WIDTH / 2);
var vy = camera_get_view_y(view_camera[0]) + (SCREEN_HEIGHT / 2);
var snd = fmod_event_create_instance("event:/sfx/voice/swap");
var s = 0;
if isgustavo
	spr_palette = spr_ratmountpalette;
if !ispeppino
{
	s = 1;
	playersprite = spr_playerN_spin;
}
else if isgustavo
{
	s = 2;
	playersprite = spr_player_ratmountattack;
}
if room == boss_pizzaface && !ispeppino && instance_exists(obj_pizzaface_thunderdark)
	spr_palette = spr_noisepalette_rage;

fmod_event_instance_set_parameter(snd, "state", s, true);
fmod_event_instance_play(snd);
fmod_event_instance_release(snd);
instance_destroy(obj_noiseanimatroniceffect);
instance_destroy(obj_swapmodegrab);
instance_destroy(obj_swapplayergrabbable, false);
instance_list = ds_list_create();
sound_list = ds_list_create();
scr_pause_deactivate_objects(false);
instance_deactivate_object(obj_pause);
depth = -999;
