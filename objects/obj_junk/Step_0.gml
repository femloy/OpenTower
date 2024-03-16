if grounded && grabbed == 0 && !ratgrabbed
	thrown = false;
if !ratgrabbed
	state = states.normal;
if ratgrabbed && ratplayerid.ratgrabbedID != id
	ratgrabbed = false;
if grabbed == 1 && !ratgrabbed
{
	image_xscale = -playerid.xscale;
	grav = 0;
	playerid.baddiegrabbedID = id;
	if (playerid.state == states.finishingblow || playerid.state == states.grabbing || playerid.state == states.grab || playerid.state == states.throwing || playerid.state == states.slam || playerid.state == states.tacklecharge)
	{
		grav = 0;
		grounded = false;
		x = playerid.x;
		if playerid.sprite_index != spr_player_haulingstart && playerid.state != states.finishingblow
			y = playerid.y - 60;
		else if (floor(playerid.image_index) == 0)
			y = playerid.y - 20;
		else if (floor(playerid.image_index) == 1)
			y = playerid.y - 30;
		else if (floor(playerid.image_index) == 2)
			y = playerid.y - 40;
		else if (floor(playerid.image_index) == 3)
			y = playerid.y - 50;
		image_xscale = -playerid.xscale;
	}
	with playerid
	{
		move = key_left2 + key_right2;
		if (!(state == states.finishingblow || state == states.grab || state == states.grabbing || state == states.throwing || state == states.slam || state == states.tacklecharge || state == states.punch || state == states.superslam || state == states.backkick || state == states.uppunch || state == states.shoulder))
		{
			other.grav = 0.5;
			other.x = x;
			other.y = y;
			other.grabbed = false;
		}
	}
	hsp = 0;
	if playerid.state == states.finishingblow
	{
		x = playerid.x + (playerid.xscale * 50);
		y = playerid.y;
	}
	if playerid.state == states.grab && playerid.sprite_index == playerid.spr_swingding
	{
		if (floor(playerid.image_index) == 0)
		{
			depth = -8;
			x = playerid.x + (playerid.xscale * 25);
			y = playerid.y;
		}
		if (floor(playerid.image_index) == 1)
		{
			depth = -8;
			x = playerid.x;
			y = playerid.y;
		}
		if (floor(playerid.image_index) == 2)
		{
			depth = -8;
			x = playerid.x + (playerid.xscale * -25);
			y = playerid.y;
		}
		if (floor(playerid.image_index) == 3)
		{
			depth = 0;
			x = playerid.x + (playerid.xscale * -50);
			y = playerid.y;
		}
		if (floor(playerid.image_index) == 4)
		{
			depth = 0;
			x = playerid.x + (playerid.xscale * -25);
			y = playerid.y;
		}
		if (floor(playerid.image_index) == 5)
		{
			depth = 0;
			x = playerid.x;
			y = playerid.y;
		}
		if (floor(playerid.image_index) == 6)
		{
			depth = 0;
			x = playerid.x + (playerid.xscale * 25);
			y = playerid.y;
		}
		if (floor(playerid.image_index) == 7)
		{
			depth = 0;
			x = playerid.x + (playerid.xscale * 50);
			y = playerid.y;
		}
	}
	if playerid.state == states.shoulder
	{
		grav = 0.5;
		instance_create(x, y + 20, obj_bumpeffect);
		grabbed = false;
		thrown = true;
		x = playerid.x;
		y = playerid.y;
		if playerid.sprite_index == spr_player_shoulder
			vsp = 15;
		if playerid.sprite_index == spr_player_diagonaldownthrow
		{
			hsp = -image_xscale * 10;
			vsp = 15;
		}
		if playerid.sprite_index == spr_player_diagonalupthrow
		{
			hsp = -image_xscale * 10;
			vsp = -15;
		}
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_baddiegibs);
		with obj_camera
		{
			shake_mag = 3;
			shake_mag_acc = 3 / room_speed;
		}
	}
	if playerid.state == states.throwing
	{
		grav = 0.5;
		grabbed = false;
		thrown = true;
		x = playerid.x;
		y = playerid.y;
		hsp = -image_xscale * 10;
		vsp = -10;
	}
	if playerid.state == states.uppunch
	{
		instance_create(x + (-playerid.xscale * 15), y - 50, obj_bumpeffect);
		grav = 0.5;
		thrown = true;
		hsp = -image_xscale * 2;
		grabbed = false;
		vsp = -20;
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_baddiegibs);
		flash = true;
		with obj_camera
		{
			shake_mag = 3;
			shake_mag_acc = 3 / room_speed;
		}
	}
	if playerid.state == states.tacklecharge
	{
		x = playerid.x + (playerid.xscale * 15);
		y = playerid.y;
	}
	if playerid.state == states.superslam
	{
		if playerid.character == "P"
		{
			if (floor(playerid.image_index) == 0)
			{
				depth = 0;
				x = playerid.x + (playerid.xscale * 10);
				y = playerid.y;
			}
			if (floor(playerid.image_index) == 1)
			{
				depth = 0;
				x = playerid.x + (playerid.xscale * 5);
				y = playerid.y;
			}
			if (floor(playerid.image_index) == 2)
			{
				depth = 0;
				x = playerid.x;
				y = playerid.y;
			}
			if (floor(playerid.image_index) == 3)
			{
				depth = 0;
				x = playerid.x + (playerid.xscale * -5);
				y = playerid.y;
			}
			if (floor(playerid.image_index) == 4)
			{
				depth = 0;
				x = playerid.x + (playerid.xscale * -10);
				y = playerid.y;
			}
			if (floor(playerid.image_index) == 5)
			{
				depth = -8;
				x = playerid.x + (playerid.xscale * -5);
				y = playerid.y;
			}
			if (floor(playerid.image_index) == 6)
			{
				depth = -8;
				x = playerid.x;
				y = playerid.y;
			}
			if (floor(playerid.image_index) == 7)
			{
				depth = -8;
				x = playerid.x + (playerid.xscale * 5);
				y = playerid.y;
			}
		}
		else
		{
			depth = -7;
			x = playerid.x;
			y = playerid.y - 40;
		}
		if playerid.sprite_index == playerid.spr_piledriverland
		{
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_baddiegibs);
			grabbed = false;
			thrown = true;
			x = playerid.x;
			y = playerid.y;
			grav = 0.5;
			hsp = -image_xscale * 10;
			vsp = -10;
		}
	}
}
if (vsp > 0 && grounded && !place_meeting(x, y, obj_spike))
	hsp = 0;
if grabbed == 0 && ratgrabbed == 0 && use_collision
	scr_collide();
if (place_meeting(x, y, obj_swordhitbox) && thrown == 0)
{
	grabbed = false;
	thrown = true;
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_baddiegibs);
	instance_create(x, y, obj_baddiegibs);
	instance_create(x, y, obj_baddiegibs);
	with obj_camera
	{
		shake_mag = 3;
		shake_mag_acc = 3 / room_speed;
	}
	state = states.hurt;
	if (scr_solid(x, y))
	{
		x = playerid.x;
		y = playerid.y;
	}
	grav = 0.5;
	other.alarm[8] = 60;
	other.alarm[7] = 120;
	with playerid
	{
		move = key_right + key_left;
		if sprite_index == spr_uppercutfinishingblow
			other.vsp = -25;
		else
		{
			other.hsp = xscale * 15;
			other.vsp = -6;
		}
	}
}
if thrown
{
	var num = instance_place_list(x + hsp, y, obj_destructibles, global.instancelist, false);
	for (var i = 0; i < num; i++)
		instance_destroy(ds_list_find_value(global.instancelist, i));
	ds_list_clear(global.instancelist);
}
