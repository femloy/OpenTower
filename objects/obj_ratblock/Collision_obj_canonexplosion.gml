if (sprite_index != spr_rattumbleblock && other.rat && other.sprite_index != spr_dynamiteexplosion)
{
	if (other.baddie)
		notification_push(notifs.ratblock_explode, [room]);
	instance_destroy();
}
