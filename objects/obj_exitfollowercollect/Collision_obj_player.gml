if (object_index == obj_stickfollower || object_index == obj_gustavofollower || object_index == obj_noisefollower)
	exit;
if (!other.ispeppino || global.swapmode)
{
	var t = other.id;
	fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
	notification_push(notifs.baddie_kill, [room, id, object_index]);
	ds_list_add(global.baddieroom, id);
	global.combotime = 60;
	instance_create(x, y, obj_bangeffect);
	instance_create(x, y, obj_genericpoofeffect);
	with (instance_create(x, y, obj_sausageman_dead))
	{
		if other.object_index == obj_fakepepfollower
		{
			use_palette = true;
			spr_palette = spr_peppalette;
			paletteselect = 1;
			if obj_player1.ispeppino
				paletteselect = obj_player1.paletteselect;
		}
		else if other.object_index == obj_snottyexit
		{
			use_palette = true;
			spr_palette = palette_cheeseslime;
			paletteselect = 1;
		}
		if other.use_palette
		{
			use_palette = true;
			paletteselect = other.paletteselect;
			spr_palette = other.spr_palette;
			oldpalettetexture = other.palettetexture;
		}
		if t.state == states.machcancel && t.hsp != 0
			image_xscale = -sign(hsp);
		else
			image_xscale = -t.xscale;
		sprite_index = other.spr_dead;
		hsp = -image_xscale * 10;
	}
	instance_destroy(id, false);
}
