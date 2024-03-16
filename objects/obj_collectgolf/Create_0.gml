if room == rm_editor
	exit;
with other
{
	image_speed = 0.35;
	global.collected = false;
	global.collectsound = 0;
}
if obj_player.character == "S"
	sprite_index = spr_snickcollectible1;
depth = 11;
