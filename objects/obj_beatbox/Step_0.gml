if (obj_player1.sprite_index != spr_player_breakdance)
{
	instance_create(x, y, obj_genericpoofeffect);
	instance_destroy();
}
scr_collide();
fmod_event_instance_set_3d_attributes(snd, x, y);
