switch state
{
	case states.normal:
		if (place_meeting(x, y, obj_player))
		{
			var num = instance_place_list(x, y, obj_player, global.instancelist, false);
			for (var i = 0; i < num; i++)
			{
				var b = ds_list_find_value(global.instancelist, i);
				if b.state == states.mach3
				{
					player_inst = b;
					hsp = sign(player_inst.hsp);
					if hsp == 0
						hsp = player_inst.xscale;
					instance_destroy(inst);
					fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y);
					with b
					{
						hitX = x;
						hitY = y;
						hitLag = 10;
						tauntstoredmovespeed = movespeed;
						tauntstoredsprite = sprite_index;
						tauntstoredstate = state;
						tauntstoredvsp = vsp;
						state = states.chainsaw;
					}
					state = states.hit;
					hitX = x;
					hitY = y;
					hitLag = 10;
					with obj_camera
					{
						shake_mag = 10;
						shake_mag_acc = 10 / room_speed;
					}
				}
			}
		}
		break;
	
	case states.hit:
		x = hitX + irandom_range(-1, 1);
		y = hitY + irandom_range(-1, 1);
		if hitLag > 0
			hitLag--;
		else
		{
			x = hitX;
			y = hitY;
			instance_destroy();
		}
		break;
}
