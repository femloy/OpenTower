if !dead
{
	with (instance_create(x, y, obj_playerbombexplosion))
	{
		for (var i = 0; i < array_length(other.baddie_arr); i++)
			ds_queue_enqueue(hitqueue, other.baddie_arr[i]);
		mask_index = spr_playerbomb_hitbox;
	}
}
else
{
	notification_push(notifs.player_explosion, []);
	fmod_event_one_shot_3d("event:/sfx/pep/bump", x, y);
	with (instance_create(x, y, obj_sausageman_dead))
	{
		sprite_index = spr_playerN_noisebombdead;
		usepalette = true;
		spr_palette = other.spr_palette;
		paletteselect = other.paletteselect;
		oldpalettetexture = other.patterntexture;
		vsp = -irandom_range(4, 6);
		hsp = sign(hsp) * 5;
	}
}
