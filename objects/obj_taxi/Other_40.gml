if (move && !instance_exists(obj_taxitransition))
{
	with obj_player
	{
		lastroom = room;
		targetRoom = other.targetRoom;
		targetDoor = other.targetDoor;
	}
	obj_camera.chargecamera = 0;
	ds_list_add(global.saveroom, id);
	with (instance_create(x, y, obj_taxitransition))
	{
		bgsprite = spr_taxitransition_bg1;
		if other.police
		{
			sprite_index = spr_taxitransition_cop;
			if obj_player1.ispeppino
				fmod_event_one_shot("event:/sfx/voice/muffledscream");
		}
		else if obj_player1.isgustavo
			sprite_index = spr_taxitransition_gus;
		else if global.panic
		{
			bgsprite = spr_taxitransition_bg2;
			sprite_index = spr_taxitransition_pizzaface;
			if obj_player1.ispeppino
				fmod_event_one_shot("event:/sfx/voice/muffledscream");
		}
		else
			sprite_index = spr_taxitransition_pep;
		
		if !obj_player1.ispeppino
		{
			switch sprite_index
			{
				case spr_taxitransition_pep:
					sprite_index = spr_taxitransition_noise;
					break;
				case spr_taxitransition_gus:
					sprite_index = spr_taxitransition_gusN;
					break;
				case spr_taxitransition_cop:
					sprite_index = spr_taxitransition_copN;
					break;
				case spr_taxitransition_pizzaface:
					sprite_index = spr_taxitransition_pizzafaceN;
					break;
			}
			if obj_player1.noisecrusher
				sprite_index = spr_taxitransition_gusN;
		}
	}
}
