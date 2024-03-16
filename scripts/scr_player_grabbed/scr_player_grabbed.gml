function scr_player_grabbed()
{
	var _obj_player = (object_index == obj_player2) ? obj_player1 : obj_player2;
	if fightball == 0
		xscale = -_obj_player.xscale;
	_obj_player.baddiegrabbedID = id;
	if _obj_player.state == states.mach3 && fightball == 1
	{
		x = _obj_player.x;
		y = _obj_player.y;
	}
	if (_obj_player.state == states.grabbing || _obj_player.state == states.grab || _obj_player.state == states.throwing || _obj_player.state == states.slam || _obj_player.state == states.tacklecharge)
	{
		x = _obj_player.x;
		if _obj_player.sprite_index != _obj_player.spr_haulingstart
			y = _obj_player.y - 40;
		else if (floor(_obj_player.image_index) == 0)
			y = _obj_player.y;
		else if (floor(_obj_player.image_index) == 1)
			y = _obj_player.y - 10;
		else if (floor(_obj_player.image_index) == 2)
			y = _obj_player.y - 20;
		else if (floor(_obj_player.image_index) == 3)
			y = _obj_player.y - 30;
		xscale = -_obj_player.xscale;
	}
	with _obj_player
	{
		move = key_left2 + key_right2;
		if key_slap && sprite_index == spr_grab
		{
			global.hit += 1;
			if other.object_index == obj_pizzaball
				global.golfhit += 1;
			image_index = 0;
			sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4);
			instance_create(other.x, other.y, obj_slapstar);
			instance_create(other.x, other.y, obj_baddiegibs);
			other.flash = true;
			with obj_camera
			{
				shake_mag = 3;
				shake_mag_acc = 3 / room_speed;
			}
		}
		if (!(state == states.grab || (state == states.mach3 && fightball == 1) || (state == states.ratmount || state == states.ratmountattack || state == states.ratmountjump || state == states.ratmountspit) || state == states.finishingblow || state == states.grabbing || state == states.throwing || state == states.slam || state == states.tacklecharge || state == states.punch || state == states.superslam || state == states.backkick || state == states.uppunch || state == states.shoulder))
		{
			baddiegrabbedID = obj_null;
			other.x = _obj_player.x;
			other.y = _obj_player.y;
			other.state = states.hurt;
			other.alarm[8] = 60;
			other.alarm[7] = 120;
			other.image_index = 0;
		}
	}
	if (_obj_player.state == states.ratmount || _obj_player.state == states.ratmountjump)
	{
		visible = false;
		x = _obj_player.x;
		y = _obj_player.y;
	}
	if _obj_player.state == states.tacklecharge
	{
		x = _obj_player.x + (_obj_player.xscale * 20);
		y = _obj_player.y;
	}
	if _obj_player.state == states.finishingblow && _obj_player.image_index < 5
	{
		x = _obj_player.x + (_obj_player.xscale * 60);
		y = _obj_player.y + 14;
	}
	if (place_meeting(x, y, obj_swordhitbox))
	{
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
		if (scr_solid(x, y) || collision_line(x, y, _obj_player.x, _obj_player.y, obj_solid, false, true) != -4)
		{
			x = _obj_player.x;
			y = _obj_player.y;
		}
		other.alarm[8] = 60;
		other.alarm[7] = 120;
		with _obj_player
		{
			move = key_right + key_left;
			if sprite_index == spr_uppercutfinishingblow
			{
				other.movespeed = 0;
				other.vsp = -25;
			}
			else
			{
				other.movespeed = 15;
				other.vsp = -6;
			}
		}
	}
	if _obj_player.state == states.superslam && _obj_player.sprite_index == _obj_player.spr_piledriver
	{
		if _obj_player.character == "P" && _obj_player.ispeppino
		{
			if (floor(_obj_player.image_index) == 0)
			{
				x = _obj_player.x + (_obj_player.xscale * 10);
				y = _obj_player.y;
			}
			if (floor(_obj_player.image_index) == 1)
			{
				x = _obj_player.x + (_obj_player.xscale * 5);
				y = _obj_player.y;
			}
			if (floor(_obj_player.image_index) == 2)
			{
				x = _obj_player.x;
				y = _obj_player.y;
			}
			if (floor(_obj_player.image_index) == 3)
			{
				x = _obj_player.x + (_obj_player.xscale * -5);
				y = _obj_player.y;
			}
			if (floor(_obj_player.image_index) == 4)
			{
				x = _obj_player.x + (_obj_player.xscale * -10);
				y = _obj_player.y;
			}
			if (floor(_obj_player.image_index) == 5)
			{
				x = _obj_player.x + (_obj_player.xscale * -5);
				y = _obj_player.y;
			}
			if (floor(_obj_player.image_index) == 6)
			{
				x = _obj_player.x;
				y = _obj_player.y;
			}
			if (floor(_obj_player.image_index) == 7)
			{
				x = _obj_player.x + (_obj_player.xscale * 5);
				y = _obj_player.y;
			}
		}
		else
		{
			x = _obj_player.x;
			y = _obj_player.y - 40;
		}
	}
	if _obj_player.state == states.grab && _obj_player.sprite_index == _obj_player.spr_swingding
	{
		if (floor(_obj_player.image_index) == 0)
		{
			x = _obj_player.x + (_obj_player.xscale * 25);
			y = _obj_player.y;
		}
		if (floor(_obj_player.image_index) == 1)
		{
			x = _obj_player.x;
			y = _obj_player.y;
		}
		if (floor(obj_player1.image_index) == 2)
		{
			x = obj_player1.x + (obj_player1.xscale * -25);
			y = obj_player1.y;
		}
		if (floor(obj_player1.image_index) == 3)
		{
			x = obj_player1.x + (obj_player1.xscale * -50);
			y = obj_player1.y;
		}
		if (floor(obj_player1.image_index) == 4)
		{
			x = obj_player1.x + (obj_player1.xscale * -25);
			y = obj_player1.y;
		}
		if (floor(obj_player1.image_index) == 5)
		{
			x = obj_player1.x;
			y = obj_player1.y;
		}
		if (floor(obj_player1.image_index) == 6)
		{
			x = _obj_player.x + (_obj_player.xscale * 25);
			y = _obj_player.y;
		}
		if (floor(_obj_player.image_index) == 7)
		{
			x = _obj_player.x + (_obj_player.xscale * 50);
			y = _obj_player.y;
		}
	}
	if (_obj_player.sprite_index == _obj_player.spr_piledriverland && floor(_obj_player.image_index) == (_obj_player.image_number - 1))
	{
		with _obj_player
		{
			state = states.jump;
			vsp = -8;
			sprite_index = spr_machfreefall;
		}
		thrown = true;
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_baddiegibs);
		flash = true;
		x = _obj_player.x;
		y = _obj_player.y;
		state = states.hurt;
		hithsp = -image_xscale * 10;
		hitvsp = -10;
		other.alarm[8] = 60;
		other.alarm[7] = 120;
	}
	if _obj_player.state != states.mach3
		sprite_index = spr_hurt;
	else
	{
		sprite_index = spr_fightball;
		image_index = _obj_player.image_index;
	}
	image_speed = 0.4;
}
