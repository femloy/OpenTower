event_inherited();
image_speed = 0.35;
depth = -6;
xoffset = 25;
yoffset = 0;
usable = true;
spritequeue = ds_queue_create();
ispeppino = false;
isgustavo = false;
animatronic = 0;
character = "P";
alarm[0] = 5;
taunttimer = 0;
tauntID = noone;
breakdance_pressed = 0;
breakdance_speed = 0.25;
breakdance_index = 0;
notecreate = 0;
grabbuffer = 0;
steppybuffer = 0;

get_character_spr = function()
{
	var palinfo = ispeppino ? get_pep_palette_info() : get_noise_palette_info();
	paletteselect = palinfo.paletteselect;
	patterntexture = palinfo.patterntexture;
	
	taunttimer = 0;
	breakdance_pressed = 0;
	breakdance_index = 0;
	instance_destroy(tauntID);
	tauntID = -4;
	scr_characterspr();
	
	if ispeppino
	{
		spr_palette = spr_peppalette;
		spr_idle = spr_player_idle;
		spr_move = spr_player_move;
		spr_air = spr_player_flyingfollower;
		spr_animatronic = spr_pepanimatronic;
		spr_fightball = spr_player_fightball;
		
		if isgustavo
		{
			spr_palette = spr_ratmountpalette;
			spr_idle = spr_player_ratmountidle;
			spr_move = spr_player_ratmountmove;
			spr_air = spr_player_ratmountballoon;
			spr_animatronic = spr_pepanimatronic;
			spr_suplexdash = spr_lonegustavo_punch;
			spr_fall = spr_player_ratmountgroundpoundfall;
			spr_dead = spr_player_ratmountgameover;
			spr_taunt = spr_player_ratmounttaunt;
			spr_walkfront = spr_ratmount_exitdoor;
		}
	}
	else
	{
		spr_palette = spr_noisepalette;
		spr_idle = spr_playerN_idle;
		spr_move = spr_playerN_move;
		spr_air = spr_playerN_doublejump;
		spr_animatronic = spr_playerN_animatronic;
		spr_fightball = spr_playerN_fightball;
	}
}
get_character_spr();

is_visible = true;
sprite_index = spr_idle;
