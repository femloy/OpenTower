pause = false;
i = false;
color = make_color_rgb(121, 103, 151);
scr_init_input();
player1 = -4;
player2 = -4;
selected = 0;
stickpressed = false;
image_speed = 0;
depth = -500;
backbuffer = 2;
savedmusicmuffle = 0;

pause_menu = ["pause_resume", "pause_options", "pause_restart", "pause_exit"];
pause_menu_map = ds_map_create();
ds_map_set(pause_menu_map, "pause_resume", [0, function()
{
	scr_pause_activate_objects();
	pause_unpause_music();
	instance_destroy(obj_option);
	instance_destroy(obj_keyconfig);
}]);
ds_map_set(pause_menu_map, "pause_achievements", [5, function()
{
	fmod_event_one_shot("event:/sfx/ui/select");
	with (instance_create(x, y, obj_achievement_pause))
		depth = other.depth - 1;
}]);
ds_map_set(pause_menu_map, "pause_options", [1, function()
{
	fmod_event_one_shot("event:/sfx/ui/select");
	with (instance_create(x, y, obj_option))
		depth = other.depth - 1;
}]);
ds_map_set(pause_menu_map, "pause_restart", [2, function()
{
	if (room == Endingroom || room == tower_soundtest || room == tower_soundtestlevel || room == Creditsroom || room == Johnresurrectionroom)
		exit;
	if !global.snickchallenge
	{
		var rm = global.leveltorestart;
		if rm != -4 && rm != -1
		{
			alarm[5] = 1;
			roomtorestart = rm;
			pause_unpause_music();
			stop_music();
			scr_pause_activate_objects();
			scr_pause_stop_sounds();
			instance_destroy(obj_option);
			instance_destroy(obj_keyconfig);
			pause = false;
		}
		else
			fmod_event_one_shot("event:/sfx/ui/select");
	}
}]);
var exit_function = function()
{
	if (room == Endingroom || room == Creditsroom || room == Johnresurrectionroom)
		exit;
	pause_unpause_music();
	stop_music();
	scr_pause_stop_sounds();
	instance_destroy(obj_option);
	instance_destroy(obj_keyconfig);
	fmod_event_instance_stop(global.snd_bossbeaten, true);
	fmod_event_instance_stop(pausemusicID, true);
	obj_music.music = -4;
	var sl = ds_list_create();
	var il = ds_list_create();
	var arr = -4;
	ds_list_copy(sl, sound_list);
	ds_list_copy(il, instance_list);
	if global.leveltorestart != -4
	{
		if global.leveltorestart != boss_fakepepkey && global.leveltorestart != tower_tutorial1N
			gamesave_async_save();
		
		hub = true;
		arr = ["hubgroup"];
		global.stargate = false;
		global.leveltorestart = -4;
	}
	else
	{
		hub = false;
		arr = ["menugroup"];
		with obj_player1
		{
			character = "P";
			ispeppino = true;
			scr_characterspr();
		}
	}
	ds_list_add(il, id);
	with (textures_offload(arr))
	{
		ds_list_clear(sound_list);
		ds_list_clear(instance_list);
		ds_list_copy(sound_list, sl);
		ds_list_copy(instance_list, il);
		pause = true;
		pauseID = other.id;
	}
	instance_deactivate_object(id);
	ds_list_destroy(sl);
	ds_list_destroy(il);
};
ds_map_set(pause_menu_map, "pause_exit", [3, exit_function]);
ds_map_set(pause_menu_map, "pause_exit_title", [3, exit_function]);

cursor_index = 0;
cursor_sprite_number = sprite_get_number(spr_angelpriest);
cursor_sprite_height = sprite_get_height(spr_angelpriest);
cursor_x = -1000;
cursor_y = -1000;
cursor_actualx = 0;
cursor_actualy = 0;
update_cursor = false;
hub = true;
treasurefound = false;
treasurealpha = 0;
secretcount = 0;
secretalpha = 0;
transfotext = -4;
transfotext_size = 0;
roomtorestart = -4;
pausemusicID = -4;
pausemusic_original = fmod_event_create_instance("event:/music/pause");
pausemusic_halloween = fmod_event_create_instance("event:/music/halloweenpause");
pausemusicID = pausemusic_original;
savedsecretpause = false;
savedmusicpause = false;
savedpillarpause = false;
savedpanicpause = false;
savedkidspartypause = false;
fade = 0;
fadein = false;
screensprite = -4;
screensize = 0;
guisprite = -4;
instance_list = ds_list_create();
sound_list = ds_list_create();
priest_list = ds_list_create();
start = false;
pause_icons = array_create(0);
scr_pauseicon_add(spr_pauseicons, 0, -20, -12);
scr_pauseicon_add(spr_pauseicons, 1, 5, -15);
scr_pauseicon_add(spr_pauseicons, 2, -10);
scr_pauseicon_add(spr_pauseicons, 3, -10);
scr_pauseicon_add(spr_pauseicons, 4, -10);
scr_pauseicon_add(spr_pauseicons, 8, 0, -12);
alarm[1] = 1;
