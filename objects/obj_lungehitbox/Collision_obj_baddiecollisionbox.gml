var _baddieID = other.baddieID;
if (!instance_exists(_baddieID))
	exit;
if (_baddieID.state != states.grabbed && !_baddieID.invincible && _baddieID.hittable && _baddieID.state != states.ghostpossess)
{
	with (playerid)
	{
		if ((floor(image_index) < 4 || (global.attackstyle == 3 && image_index < 6)) && (state == states.lungeattack || state == states.handstandjump) && state != states.chainsaw && _baddieID.state != states.hit)
		{
			var lag = 5;
			var baddie_id = _baddieID.id;
			movespeed = 6;
			if (ds_list_find_index(hitlist, baddie_id) == -1)
			{
				ds_list_add(hitlist, baddie_id);
				with (_baddieID)
				{
					hp -= 0.5;
					instance_create(x, y, obj_bangeffect);
					state = states.hit;
					image_xscale = -other.xscale;
					hit_connected = true;
					hithsp = ((other.x + ((other.movespeed + 0.5) * 60 * other.xscale)) - x) / 60;
					hitvsp = (other.y - 180 - y) / 60;
					trace([hithsp, hitvsp]);
					hitLag = lag;
					hitX = x;
					hitY = y;
					invtime = lag + 5;
					flash = true;
					if (!important)
					{
						global.combotime = 60;
						global.heattime = 60;
					}
				}
				hit_connected = true;
				lunge_hits++;
				finisher_hits++;
				lunge_hit_buffer = 100;
				if (state == states.handstandjump)
				{
					state = states.lungeattack;
					randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_player_suplexmash5, spr_player_suplexmash6, spr_player_suplexmash7, spr_punch]);
					image_index = 0;
				}
				tauntstoredstate = state;
				tauntstoredsprite = sprite_index;
				tauntstoredmovespeed = movespeed;
				tauntstoredvsp = 0;
				state = states.chainsaw;
				hitLag = lag;
				hitX = x;
				if (hit_connected)
					hitvsp = 0;
				else
					hitvsp = vsp;
				hitY = y;
				var debriscount = floor(lunge_hits / 5);
				repeat (2 + debriscount)
				{
					with (create_debris(x, y, spr_slapstar))
						vsp = irandom_range(-6, -11);
				}
				instance_create(other.x, other.y, obj_parryeffect);
			}
		}
	}
}
