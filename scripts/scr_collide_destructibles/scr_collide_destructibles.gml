function scr_collide_destructibles()
{
	with obj_player
	{
		if ((state == states.jump && sprite_index == spr_playerN_noisebombspinjump)
		|| (ghostdash && sprite_index != spr_ghostidle) || state == states.machcancel
		|| state == states.slipbanan || state == states.rideweenie || state == states.trickjump
		|| state == states.ratmountbounce || state == states.noisecrusher
		|| (state == states.pogo && pogochargeactive == 1))
		{
			var arr = [[xscale, 0], [hsp + xscale, 0], [0, vsp + 1], [0, vsp - 1], [0, 1], [0, -1]];
			for (var i = 0; i < array_length(arr); i++)
			{
				var b = arr[i];
				if (place_meeting(x + b[0], y + b[1], obj_destructibles))
				{
					var num = instance_place_list(x + b[0], y + b[1], obj_destructibles, global.instancelist, false);
					for (var j = 0; j < num; j++)
					{
						var inst = ds_list_find_value(global.instancelist, j);
						if inst != -4 && inst != -1 && inst != undefined
						{
							with inst
							{
								GamepadSetVibration(0, 0.8, 0.8, 0.5);
								instance_destroy();
							}
						}
					}
					ds_list_clear(global.instancelist);
				}
			}
		}
		
		if (state == states.trashroll || state == states.UNKNOWN_2 || state == states.boxxedpepspin
		|| ratmount_movespeed >= 12 || state == states.ratmountpunch || state == states.ratmounttumble
		|| state == states.punch || state == states.handstandjump || state == states.ratmountattack
		|| state == states.lungeattack || state == states.cheeseball || state == states.bombpepside
		|| state == states.rocket || state == states.shotgundash || state == states.faceplant
		|| state == states.slipnslide || state == states.tacklecharge || sprite_index == spr_barrelroll
		|| sprite_index == spr_barrelslipnslide || state == states.chainsawbump || state == states.mach3
		|| state == states.machcancel || state == states.knightpep || (state == states.boxxedpepjump && boxxeddash)
		|| (state == states.boxxedpep && boxxeddash) || state == states.machroll
		|| state == states.knightpepslopes || state == states.knightpepattack || state == states.tumble
		|| state == states.machcancel || state == states.hookshot || state == states.shoulderbash)
		{
			if (place_meeting(x + hsp, y, obj_destructibles))
			{
				if character != "V"
				{
					with (instance_place(x + hsp, y, obj_destructibles))
					{
						GamepadSetVibration(0, 0.8, 0.8, 0.5);
						instance_destroy();
					}
					if state == states.mach2
						machpunchAnim = true;
				}
			}
		}
		
		if state == states.hurt && thrown == 1
		{
			if (place_meeting(x - hsp, y, obj_destructibles))
			{
				with (instance_place(x - hsp, y, obj_destructibles))
				{
					GamepadSetVibration(0, 0.8, 0.8, 0.5);
					instance_destroy();
				}
			}
		}
		
		if ((state == states.knightpep || sprite_index == spr_lonegustavo_groundpoundstart
		|| state == states.ratmountbounce || state == states.machcancel
		|| sprite_index == spr_lonegustavo_groundpound || state == states.jetpackjump
		|| state == states.firemouth || state == states.slipbanan || state == states.superslam
		|| state == states.hookshot || (state == states.bombpepup && bombup_dir == 1)) && vsp > 0)
		{
			var vy = 1;
			if (state == states.ratmountbounce || sprite_index == spr_lonegustavo_groundpoundstart || sprite_index == spr_lonegustavo_groundpound)
				vy = vsp;
			if (place_meeting(x, y + vy, obj_destructibles))
			{
				var num = instance_place_list(x, y + vy, obj_destructibles, global.instancelist, false);
				for (i = 0; i < num; i++)
				{
					with (ds_list_find_value(global.instancelist, i))
					{
						GamepadSetVibration(0, 0.8, 0.8, 0.5);
						instance_destroy();
					}
				}
				ds_list_clear(global.instancelist);
				if (state == states.firemouth || state == states.jetpackjump)
				{
					with (instance_place(x, y + vy, obj_tntblock))
					{
						GamepadSetVibration(0, 0.8, 0.8, 0.5);
						instance_destroy();
					}
					if vsp > -11
						vsp = -11;
					jumpstop = false;
				}
			}
		}
		
		if state == states.firemouth
		{
			with (instance_place(x + xscale, y, obj_tntblock))
			{
				instance_destroy();
				if other.vsp > -11
					other.vsp = -11;
				jumpstop = false;
			}
			with (instance_place(x, y + vsp, obj_tntblock))
			{
				instance_destroy();
				if other.vsp > -11
					other.vsp = -11;
				jumpstop = false;
			}
			with (instance_place(x, y + 1, obj_tntblock))
			{
				instance_destroy();
				if other.vsp > -11
					other.vsp = -11;
				jumpstop = false;
			}
			with (instance_place(x, y - 1, obj_tntblock))
			{
				instance_destroy();
				if other.vsp > -11
					other.vsp = -11;
				jumpstop = false;
			}
		}
		
		var num = instance_place_list(x, y + 1, obj_destructibleplatform, global.instancelist, false);
		for (var k = 0; k < num; k++)
		{
			with (ds_list_find_value(global.instancelist, k))
			{
				if !falling
					notification_push(notifs.cheeseblock_activate, [room]);
				falling = true;
				if falling == 1
					image_speed = 0.35;
			}
		}
		ds_list_clear(global.instancelist);
		
		
		if (vsp <= 0.5 && (state == states.jump || state == states.machcancel || state == states.UNKNOWN_1
		|| state == states.ratmountjump || state == states.UNKNOWN_2 || state == states.mach3 
		|| state == states.machcancel || state == states.mach2 || state == states.antigrav || state == states.pogo
		|| (state == states.bombpepup && bombup_dir == -1) || state == states.punch || state == states.climbwall
		|| state == states.fireass || state == states.Sjump || state == states.UNKNOWN_3
		|| state == states.cheeseballclimbwall || state == states.mach3 || state == states.machcancel
		|| (state == states.punch && (sprite_index == spr_breakdanceuppercut || sprite_index == spr_breakdanceuppercutend))))
		{
			var vy = -1;
			if (state == states.punch && (sprite_index == spr_breakdanceuppercut || sprite_index == spr_breakdanceuppercutend))
			{
				vy = vsp;
				
				var i = 0;
				repeat (abs(vsp + 50))
				{
					instance_destroy(instance_place(x, y + i, obj_destructibles));
					i--;
				}
			}
			
			if (place_meeting(x, y + vy, obj_destructibles))
			{
				with (instance_place(x, y + vy, obj_destructibles))
				{
					GamepadSetVibration(0, 0.6, 0.6, 0.5);
					instance_destroy();
					with other
					{
						if state != states.UNKNOWN_3 && state != states.UNKNOWN_2 && state != states.Sjump && state != states.punch && state != states.climbwall
							vsp = 0;
						if state == states.Sjump
							vsp = -11;
					}
				}
			}
		}
		if (vsp >= 0 && (state == states.freefall || state == states.superslam || state == states.freefallland || state == states.ratmountgroundpound || (state == states.ratmountbounce && vsp >= 0) || (state == states.slipbanan && vsp >= 10)))
		{
			if (place_meeting(x, y + vsp + 2, obj_destructibles))
			{
				var num = instance_place_list(x, y + vsp + 2, obj_destructibles, global.instancelist, false);
				for (j = 0; j < num; j++)
					instance_destroy(ds_list_find_value(global.instancelist, j));
				ds_list_clear(global.instancelist);
			}
		}
		if (state == states.freefall || state == states.superslam || state == states.freefallland || state == states.slipbanan || (state == states.ratmountbounce && vsp > 0))
		{
			vy = 1;
			if state == states.ratmountbounce
				vy = vsp + 4;
			if (place_meeting(x, y + vy, obj_metalblock) && (freefallsmash >= 10 || state == states.slipbanan || state == states.ratmountbounce))
			{
				with (instance_place(x, y + vy, obj_metalblock))
					instance_destroy();
			}
		}
		if (state == states.crouchslide || state == states.machroll || state == states.mach2 || state == states.punch)
		{
			with (instance_place(x + hsp, y, obj_destructibles))
			{
				var _destroyed = false;
				with other
				{
					if (place_meeting(x + hsp, y, obj_bigdestructibles) && state != states.crouchslide && state != states.mach2 && state != states.machroll)
					{
						instance_destroy(other);
						_destroyed = true;
					}
					else if other.object_index != obj_bigdestructibles
					{
						instance_destroy(other);
						_destroyed = true;
					}
					if _destroyed && state == states.lungeattack
						hit_connected = true;
				}
			}
		}
	}
}
