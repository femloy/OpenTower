if room == rm_editor
	exit;
if (obj_player.state == states.knightpep || (obj_player.state == states.chainsaw && (obj_player.tauntstoredstate == states.knightpep || obj_player.tauntstoredstate == states.knightpepslopes)) || obj_player.state == states.knightpepattack || obj_player.state == states.knightpepslopes || obj_player.state == states.knightpepbump)
	sprite_index = spr_swordstonetaken;
else
	sprite_index = spr_swordstone;
if (sprite_index == spr_swordstone && !instance_exists(ID) && room != boss_pizzaface)
{
	with (instance_create(x, y - 20, obj_grabmarker))
		other.ID = id;
}
else if (sprite_index == spr_swordstonetaken && instance_exists(ID))
	instance_destroy(ID);
