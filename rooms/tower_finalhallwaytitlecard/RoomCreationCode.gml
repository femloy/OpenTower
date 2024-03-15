pal_swap_init_system(shd_pal_swapper);
global.roommessage = "PIZZA TOWER ISLAND";
global.leveltosave = "exit";
global.exitrank = false;

global.player_damage = 0;
global.swap_damage[0] = 0;
global.swap_damage[1] = 0;

with (obj_player)
{
	state = states.titlescreen;
	targetRoom = tower_finalhallway;
	targetDoor = "C";
}

with (instance_create(x, y, obj_titlecard))
{
	titlecard_sprite = spr_titlecards;
	titlecard_index = 15;
	title_sprite = spr_titlecards_title2;
	title_index = 5;
	title_music = -4;
	music = true;
	fadealpha = 1;
}
