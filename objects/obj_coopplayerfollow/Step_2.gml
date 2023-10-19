event_inherited();
if (ds_queue_size(spritequeue) > LAG_STEPS)
{
	var _sprinfo = ds_queue_dequeue(spritequeue);
	sprite_index = _sprinfo[0];
	image_index = _sprinfo[1];
	if (sprite_index == obj_player2.spr_idle)
	{
		if (x != xprevious)
			sprite_index = obj_player2.spr_move;
	}
}
