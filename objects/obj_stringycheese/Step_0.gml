targetplayer = instance_nearest(x, y, obj_player);
image_speed = 0.35;
switch (state)
{
	case states.normal:
		hand_xscale = (drawhandx < x) ? 1 : -1;
		idlebuffer = 0;
		spr_hand = spr_mrpinch_hand1;
		sprite_index = spr_mrpinch_face1;
		var _dir = point_direction(x, y, targetplayer.x, targetplayer.y);
		var spd = (shootbuffer > 0) ? 3 : 10;
		var tx = targetplayer.x;
		var ty = targetplayer.y;
		if (point_distance(x, y, handx, handy) >= (maxhandlen - 20))
		{
			tx = x + lengthdir_x(maxhandlen, _dir);
			ty = y + lengthdir_y(maxhandlen, _dir);
			_dir = point_direction(x, y, tx, ty);
		}
		handx = Approach(handx, tx, spd);
		handy = Approach(handy, ty, spd);
		if (handy < y)
			handy = y;
		drawhandx = lerp(drawhandx, handx, 0.2);
		drawhandy = lerp(drawhandy, handy, 0.2);
		if (shootbuffer > 0)
			shootbuffer--;
		if (shootbuffer <= 0 && place_meeting(handx, handy, obj_player))
		{
			playerid = instance_place(handx, handy, obj_player);
			with (playerid)
			{
				if (state == states.cheeseball)
				{
					repeat (3)
						create_debris(x + (xscale * 30), y + random_range(-8, 8), spr_cheesechunk);
				}
			}
			if (playerid.state != states.hook)
			{
				launch_hsp = sign(playerid.hsp) * 3;
				launch_vsp = -20;
				hsp = playerid.hsp;
				vsp = 10;
				with (playerid)
				{
					if (state == states.trashjump || state == states.trashjumpprep)
						create_debris(x, y, spr_player_trashlid);
					tauntstoredstate = state;
					tauntstoredmovespeed = movespeed;
					tauntstoredsprite = sprite_index;
					state = states.stringfall;
					stringid = other.id;
					movespeed = hsp;
					other.previousx = x;
                    other.previousy = y;
					if (abs(movespeed) >= 16)
						movespeeddeccel = 1.8;
					else
						movespeeddeccel = 0.5;
				}
				state = states.hook;
			}
		}
		break;
	case states.hook:
		sprite_index = spr_mrpinch_face2;
		spr_hand = spr_mrpinch_hand2;
		handx = playerid.x;
		handy = playerid.y;
		drawhandx = handx;
		drawhandy = handy;
		if (handy < (y - 200) || playerid.state == states.tube)
		{
			state = states.normal;
			with (playerid)
			{
				if (state == states.stringfall)
				{
					if (tauntstoredstate == states.cheesepepjump)
						state = states.cheesepepjump;
					else
					{
						sprite_index = spr_machfreefall;
						state = states.jump;
					}
				}
			}
			break;
		}
		else
		{
			drawhandx = handx;
			drawhandy = handy;
			hand_xscale = playerid.xscale;
			if playerid.state != states.tube
			{
				with (playerid)
				{
					sprite_index = spr_player_mrpinch;
					stringid = other.id;
					state = states.stringfall;
					if (grounded && vsp > 0)
					{
						hsp_carry = sign(other.x - x) * 4;
						if (abs(hsp) > abs(hsp_carry) && sign(hsp) != sign(hsp_carry))
							hsp_carry = -hsp;
					}
					if (y > other.y)
					{
						if (y > other.y + (other.maxhandlen / 2) && vsp > 0 && y > other.y)
						{
							other.state = states.hookshot;
							other.shootbuffer = 60;
							other.launch_dir = point_direction(0, 0, other.launch_hsp, other.launch_vsp);
							stringid = other.id;
						}
					}
					var _solid = false;
					if place_meeting(x, y - 1, obj_solid)
                        _solid = true;
                    if (_solid || (vsp > 0 && y < other.y) || (x == other.previousx && y == other.previousy))
						other.idlebuffer++;
					else
						other.idlebuffer = 0;
					other.previousx = x;
                    other.previousy = y;
					if (other.idlebuffer > 60)
					{
						other.state = states.normal;
						other.shootbuffer = 20;
						other.idlebuffer = 0;
						state = states.normal;
					}
				}
			}
			else
				state = states.normal;
			break;
		}
		
	case states.hookshot:
		sprite_index = spr_mrpinch_face2;
		hand_index = spr_mrpinch_hand2;
		hand_xscale = playerid.xscale;
		handy = playerid.y;
		handx = playerid.x;
		drawhandx = handx;
		drawhandy = handy;
		var s1 = 0.9;
		hsp += lengthdir_x(s1, launch_dir);
		vsp += lengthdir_y(s1, launch_dir);
		with (playerid)
		{
			sprite_index = spr_player_mrpinch;
			other.shootbuffer = 10;
			hsp = other.hsp;
			vsp = other.vsp;
			if (y <= other.y)
			{
				other.shootbuffer = 0;
				movespeed = abs(movespeed);
				if (movespeed != 0)
					xscale = sign(movespeed);
				vsp = other.launch_vsp;
				instance_create(x, y, obj_speedlinesup);
				dir = xscale;
				jumpAnim = true;
				momemtum = true;
				jumpstop = true;
				sprite_index = spr_machfreefall;
				state = states.jump;
				with (other)
				{
					state = states.transition;
					shootbuffer = 80;
				}
				notification_push(notifs.mrpinch_launch, [room, other.id, id]);
			}
		}
		break;
	case states.transition:
		hand_xscale = 1;
		spr_hand = spr_mrpinch_hand3;
		sprite_index = spr_mrpinch_face3;
		handx = Approach(handx, x - 40, 4);
		handy = Approach(handy, y + 5, 4);
		drawhandx = handx;
		drawhandy = handy;
		if (shootbuffer > 0)
			shootbuffer--;
		else
		{
			state = states.normal;
			shootbuffer = 30;
		}
		break;
}
hand_index += 0.35;
if (hand_index > (sprite_get_number(hand_index) - 1))
	hand_index = frac(hand_index);
