function scr_player_tacklecharge()
{
	if windingAnim < 2000
		windingAnim++;
	if (!place_meeting(x, y + 1, obj_railparent))
		hsp = xscale * movespeed;
	else
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		hsp = (xscale * movespeed) + (_railinst.movespeed * _railinst.dir);
	}
	move2 = key_right2 + key_left2;
	move = key_right + key_left;
	movespeed = 10;
	crouchslideAnim = true;
	if movespeed < 24 && move == xscale
		movespeed += 0.05;
	if !key_jump2 && jumpstop == 0 && vsp < 0.5
	{
		vsp /= 20;
		jumpstop = true;
	}
	if grounded && vsp > 0
		jumpstop = false;
	if input_buffer_jump > 0 && can_jump
	{
		input_buffer_jump = 0;
		image_index = 0;
		sprite_index = spr_player_secondjump1;
		scr_fmod_soundeffect(jumpsnd, x, y);
		vsp = -11;
	}
	if (scr_solid(x + hsp, y) && !place_meeting(x + hsp, y, obj_slope) && !place_meeting(x + hsp, y, obj_destructibles))
	{
		if baddiegrabbedID != obj_null
		{
			if (baddiegrabbedID.object_index == obj_player1 || baddiegrabbedID.object_index == obj_player2)
			{
				with baddiegrabbedID
				{
					other.thrown = true;
					instance_create(x, y, obj_slapstar);
					instance_create(x, y, obj_baddiegibs);
					other.flash = true;
					x = other.x;
					y = other.y;
					state = states.hurt;
					hsp = -image_xscale * 10;
					vsp = -10;
					alarm[8] = 60;
					alarm[7] = 120;
					other.baddiegrabbedID = obj_null;
				}
			}
		}
		movespeed = 0;
		state = states.bump;
		hsp = -2.5;
		vsp = -3;
		mach2 = 0;
		image_index = 0;
		instance_create(x + 10, y + 10, obj_bumpeffect);
	}
	sprite_index = spr_charge;
	image_speed = 0.65;
	if key_down && grounded
	{
		sprite_index = spr_crouchslip;
		if character == "P"
			machhitAnim = false;
		state = states.crouchslide;
	}
	if !key_attack && move != xscale && grounded
	{
		image_index = 0;
		state = states.machslide;
		sprite_index = spr_machslidestart;
	}
	if move == -xscale && grounded
	{
		image_index = 0;
		state = states.machslide;
		sprite_index = spr_machslideboost;
	}
	if move == xscale && !key_attack && grounded
		state = states.normal;
	if (!instance_exists(dashcloudid) && grounded)
	{
		with (instance_create(x, y, obj_dashcloud))
		{
			image_xscale = other.xscale;
			other.dashcloudid = id;
		}
	}
}
