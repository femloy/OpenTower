function cutscene_medieval_start()
{
	with obj_player
	{
		state = states.actor;
		sprite_index = spr_walkfront;
		image_speed = 0.35;
		other.xscale = xscale;
		other.spr_idle = spr_idle;
		with (instance_create(x, y, obj_actor))
		{
			use_palette = true;
			spr_palette = other.spr_palette;
			paletteselect = other.paletteselect;
			depth = other.depth;
			image_speed = 0.35;
			sprite_index = other.sprite_index;
			image_xscale = other.xscale;
			spr_idle = other.spr_idle;
			visible = false;
		}
	}
	cutscene_end_action();
}
function cutscene_medieval_start2()
{
	with obj_actor
	{
		sprite_index = spr_idle;
		visible = true;
	}
	cutscene_end_action();
}
