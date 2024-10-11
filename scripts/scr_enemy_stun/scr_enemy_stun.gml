function scr_enemy_stun()
{
	if object_index == obj_ninja
		attack = true;
	switch global.stylethreshold
	{
		case 0:
			stunned -= 1;
			break;
		case 1:
			stunned -= 0.65;
			break;
		case 2:
			stunned -= 0.8;
			break;
		case 3:
			stunned -= 1;
	}
	if stuntouchbuffer > 0
		stuntouchbuffer--;
	var t = thrown;
	if object_index != obj_pepperman && object_index != obj_fakepepboss && object_index != obj_pf_fakepep
	{
		if sprite_index != spr_tank_hitwall
		{
			if thrown == 0
				sprite_index = stunfallspr;
			else
				sprite_index = spr_dead;
		}
		else if (floor(image_index) == image_number - 1 && sprite_index == spr_tank_hitwall)
		{
			state = states.walk;
			stunned = 0;
			sprite_index = spr_tank_walk;
		}
	}
	else if object_index == obj_pepperman
	{
		if thrown
			sprite_index = spr_dead;
		else if sprite_index != spr_pepperman_shoulderhurt && sprite_index != spr_pepperman_shoulderhurtstart
			sprite_index = stunfallspr;
		if (sprite_index == spr_pepperman_shoulderhurtstart && floor(image_index) == image_number - 1)
			sprite_index = spr_pepperman_shoulderhurt;
	}
	else if (object_index == obj_fakepepboss || object_index == obj_pf_fakepep)
	{
		if !thrown
		{
			if sprite_index != spr_fakepeppino_vulnerable
				sprite_index = stunfallspr;
		}
		else
			sprite_index = spr_dead;
	}
	image_speed = 0.35;
	if linethrown
	{
		if thrown
		{
			if (abs(hithsp) > abs(hitvsp))
				hitvsp = 0;
			hsp = hithsp;
			vsp = hitvsp;
			if hithsp != 0
				scr_destroy_destructibles(hithsp, 0);
			if hitvsp != 0
				scr_destroy_destructibles(0, hitvsp);
		}
	}
	if (hitvsp < 0 && place_meeting(x, y - 1, obj_solid) && !place_meeting(x, y - 1, obj_destructibles))
	{
		if thrown == 1
		{
			if ((!elite || elitehit <= 0) && elitehurt && destroyable)
				instance_destroy();
			thrown = false;
		}
	}
	if (hithsp != 0 && place_meeting(x + hithsp, y, obj_solid) && !place_meeting(x + hithsp, y, obj_destructibles))
	{
		if thrown == 1
		{
			if ((!elite || elitehit <= 0) && elitehurt && destroyable)
				instance_destroy();
			thrown = false;
		}
	}
	if blur_effect > 0
		blur_effect--;
	else if thrown
	{
		blur_effect = 2;
		with (create_blur_afterimage(x, y, sprite_index, image_index - 1, image_xscale))
			playerid = other.id;
	}
	if grounded && vsp > 0 && thrown
	{
		if ((!elite || elitehit <= 0) && elitehurt && destroyable)
			instance_destroy();
		thrown = false;
	}
	if t != thrown && t && elite
	{
		elitehit--;
		if elitehit < 0
			elitehit = 0;
		if (elitehit > 0 || !destroyable)
		{
			event_perform(ev_destroy, 0);
			var b = ds_list_find_index(global.baddieroom, id);
			if b != -1
				ds_list_delete(global.baddieroom, b);
			image_xscale *= -1;
			hsp = 5 * -image_xscale;
			if object_index == obj_pizzafaceboss
				x += (sign(hsp) * 30);
			flash = false;
		}
		else if elitehit <= 0 && destroyable
			instance_destroy();
	}
	if grounded && elite
		stunned -= 5;
	if stunned <= 0 && grounded
	{
		vsp = 0;
		image_index = 0;
		sprite_index = walkspr;
		state = states.walk;
		stunned = 0;
		if object_index == obj_golfdemon && !idle
		{
			state = states.chase;
			movespeed = 6;
		}
	}
	if (place_meeting(x, y + 1, obj_railparent))
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		railmovespeed = _railinst.movespeed * _railinst.dir;
		if grounded && !thrown
			hsp = railmovespeed;
	}
	else
	{
		railmovespeed = Approach(railmovespeed, 0, 0.5);
		if grounded
			hsp = Approach(hsp, 0, 0.3);
	}
	if !thrown
		grav = 0.5;
	if (abs(hsp) > 4 && grounded)
	{
		if (!instance_exists(dashcloudid))
		{
			with (instance_create(x, y, obj_dashcloud))
			{
				image_xscale = sign(other.hsp);
				other.dashcloudid = id;
			}
		}
	}
}
