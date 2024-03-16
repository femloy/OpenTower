noise = instance_create(208, 402, obj_finaleN_prop)
noise.sprite_index = spr_playerN_finalattack1
noise.usepalette = true;

peppinoID = noone;
if global.swapmode
{
	peppinoID = instance_create((noise.x - 50), 402, obj_swapplayerprop);
	peppinoID.ispeppino = true;
	peppinoID.sprite_index = spr_player_idle;
	peppinoID.image_speed = 0.35;
	peppinoID.depth = 0;
	peppinoID.hsp = 0;
	peppinoID.vsp = 0;
}
with obj_player1
{
	if ispeppino
		swap_player(false);
}

pizzahead = instance_create(786, 369, obj_finaleN_prop);
pizzahead.sprite_index = spr_johnresurrected_pizzahead;
pizzahead.image_xscale = 1;
pizzaheadshot = -4;
pizzaheadshot_snd = fmod_event_create_instance("event:/sfx/playerN/finale_pizzahead");

state = states.normal;
buffer = 100;
whitefade = 0;
depth = -999;
shake = 0;
shake_max = 8;

bg1 = instance_create(0, 0, obj_finaleN_prop);
bg1.sprite_index = bg_towershot2;
bg1.hsp = 0.1;
bg1.depth = -100;
bg2 = instance_create(0, 0, obj_finaleN_prop);
bg2.sprite_index = bg_towershot3;
bg2.hsp = 0.15;
bg2.depth = -101;
bg3 = instance_create(0, 0, obj_finaleN_prop);
bg3.sprite_index = bg_towershot4;
bg3.hsp = 0.2;
bg3.depth = -102;
towershot = instance_create(0, 0, obj_finaleN_prop);
towershot.sprite_index = bg_towershot1;
towershot.depth = -103;
bg4 = instance_create(0, 0, obj_finaleN_prop);
bg4.image_speed = 1;
bg4.sprite_index = bg_towershot5;
bg4.depth = -104;
bg1.visible = false;
bg2.visible = false;
bg3.visible = false;
bg4.visible = false;
bg1.tiled = true;
bg2.tiled = true;
bg3.tiled = true;
bg4.tiled = true;
towershot.visible = false;
towershot.shake = 0;
