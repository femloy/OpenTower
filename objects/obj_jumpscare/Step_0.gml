if state < 2
{
	with obj_player1
	{
		hsp = 0;
		vsp = 0;
	}
}
global.combotime = 0;
instance_destroy(obj_comboend);
if sprite_index == spr_tvstatic
{
	image_index -= 0.35;
	if (floor(image_index) <= 0)
	{
		with obj_player1
		{
			if state == states.actor
				state = states.animatronic;
		}
		fmod_event_one_shot("event:/sfx/ui/tvswitchback");
		instance_destroy();
	}
}
