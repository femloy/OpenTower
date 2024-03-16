if global.horse
	exit;
with obj_player
{
	if other.image_yscale == 1
	{
		if (((key_down && !place_meeting(x, y + 1, obj_destructibles) && place_meeting(x, y + 1, other) && ((state == states.crouch || character == "S" || character == "M") || state == states.machroll || (state == states.tumble && sprite_index == spr_dive))) || ((state == states.crouchslide || (state == states.tumble && key_down) || state == states.machcancel || state == states.UNKNOWN_1 || state == states.UNKNOWN_4 || state == states.freefall || state == states.freefallland) && !place_meeting(x, y + 1, obj_destructibles) && place_meeting(x, y + 1, other))) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
		{
			obj_player1.lastroom = room;
			obj_player2.lastroom = room;
			other.depth = -10;
			fmod_event_one_shot_3d("event:/sfx/pep/box", x, y);
			obj_player1.box = true;
			obj_player2.box = true;
			mach2 = 0;
			obj_camera.chargecamera = 0;
			x = other.x;
			obj_player1.targetDoor = other.targetDoor;
			obj_player1.targetRoom = other.targetRoom;
			obj_player2.targetDoor = other.targetDoor;
			obj_player2.targetRoom = other.targetRoom;
			if global.coop == 1
			{
				var _box = other.id;
				with obj_player
				{
					x = _box.x;
					y = _box.y - 76;
				}
				obj_player1.sprite_index = obj_player1.spr_downpizzabox;
				obj_player1.image_index = 0;
				obj_player1.state = states.door;
				obj_player2.sprite_index = obj_player2.spr_downpizzabox;
				obj_player2.image_index = 0;
				if obj_player2.state != states.gotoplayer
					obj_player2.state = states.door;
			}
			else
			{
				sprite_index = spr_downpizzabox;
				image_index = 0;
				state = states.door;
			}
		}
	}
	if other.image_yscale == -1
	{
		if (((key_up && !place_meeting(x, y - 1, obj_destructibles) && place_meeting(x, y - 10, other) && (state == states.normal || state == states.machcancel || state == states.pogo || state == states.UNKNOWN_1 || state == states.UNKNOWN_3 || state == states.machcancel || state == states.jump || state == states.mach1 || state == states.mach2 || state == states.mach3 || state == states.Sjumpprep || (state == states.punch && sprite_index == spr_breakdanceuppercut))) || ((state == states.Sjump || state == states.machcancel || state == states.Sjumpland) && !place_meeting(x, y - 1, obj_destructibles) && place_meeting(x, y - 1, other))) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
		{
			obj_player1.lastroom = room;
			obj_player2.lastroom = room;
			fmod_event_one_shot_3d("event:/sfx/pep/box", x, y);
			other.depth = -10;
			obj_player1.box = true;
			obj_player2.box = true;
			other.depth = -8;
			mach2 = 0;
			obj_camera.chargecamera = 0;
			x = other.x;
			y = other.y + 24;
			obj_player1.targetDoor = other.targetDoor;
			obj_player1.targetRoom = other.targetRoom;
			obj_player2.targetDoor = other.targetDoor;
			obj_player2.targetRoom = other.targetRoom;
			obj_player1.vsp = 0;
			obj_player2.vsp = 0;
			if global.coop == 1
			{
				_box = other.id;
				with obj_player
				{
					x = _box.x;
					y = _box.y + 24;
				}
				obj_player1.sprite_index = obj_player1.spr_uppizzabox;
				obj_player1.image_index = 0;
				obj_player1.state = states.door;
				obj_player2.sprite_index = obj_player2.spr_uppizzabox;
				obj_player2.image_index = 0;
				if obj_player2.state != states.gotoplayer
					obj_player2.state = states.door;
			}
			else
			{
				sprite_index = spr_uppizzabox;
				image_index = 0;
				state = states.door;
			}
		}
	}
}
if (place_meeting(x, y + 1, obj_doorA) || place_meeting(x, y - 1, obj_doorA))
	targetDoor = "A";
if (place_meeting(x, y + 1, obj_doorB) || place_meeting(x, y - 1, obj_doorB))
	targetDoor = "B";
if (place_meeting(x, y + 1, obj_doorC) || place_meeting(x, y - 1, obj_doorC))
	targetDoor = "C";
if (place_meeting(x, y + 1, obj_doorD) || place_meeting(x, y - 1, obj_doorD))
	targetDoor = "D";
if (place_meeting(x, y + 1, obj_doorE) || place_meeting(x, y - 1, obj_doorE))
	targetDoor = "E";
if (place_meeting(x, y + 1, obj_doorF) || place_meeting(x, y - 1, obj_doorF))
	targetDoor = "F";
if (place_meeting(x, y + 1, obj_doorG) || place_meeting(x, y - 1, obj_doorG))
	targetDoor = "G";
