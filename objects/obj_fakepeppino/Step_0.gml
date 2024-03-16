if !touched
{
	var xx = obj_player1.x;
	var yy = obj_player1.y;
	var ixs = obj_player1.xscale;
	var v = obj_player1.vsp;
	var msk = obj_player1.mask_index;
	ds_queue_enqueue(followqueue, [xx, yy, ixs, v, msk]);
	if (ds_queue_size(followqueue) > LAG_STEPS)
	{
		var b = ds_queue_dequeue(followqueue);
		x = b[0];
		y = b[1];
		image_xscale = b[2];
		vsp = b[3];
		mask_index = b[4];
	}
	image_speed = 0.35;
	switch state
	{
		case states.normal:
			if sprite_index != spr_fakepeppino_land
			{
				if x != xprevious
					sprite_index = spr_fakepeppino_walk;
				else
					sprite_index = spr_fakepeppino_idle;
			}
			else if floor(image_index) == image_number - 1
				sprite_index = spr_fakepeppino_idle;
			if sprite_index == spr_fakepeppino_walk
			{
				if (!steppy && (floor(image_index) == 2 || floor(image_index) == 7))
				{
					steppy = true;
					create_particle(x, y + 38, particle.cloudeffect, 0);
				}
				if (steppy && floor(image_index) != 2 && floor(image_index) != 7)
					steppy = false;
			}
			if !grounded
			{
				state = states.jump;
				if vsp < 0
				{
					with (instance_create(x, y, obj_highjumpcloud1))
					{
						if (scr_solid(x, y + 64))
						{
							while (!scr_solid(x, y + 1))
								y++;
						}
					}
					sprite_index = spr_fakepeppino_jumpstart;
					image_index = 0;
				}
				else
				{
					sprite_index = spr_fakepeppino_fall;
					image_index = 0;
				}
			}
			break;
		
		case states.jump:
			if floor(image_index) == image_number - 1
			{
				if sprite_index == spr_fakepeppino_jumpstart
					sprite_index = spr_fakepeppino_jump;
				else if sprite_index == spr_fakepeppino_jump
					sprite_index = spr_fakepeppino_fall;
			}
			if grounded && vsp > 0
			{
				create_particle(x, y, particle.landcloud, 0);
				sprite_index = spr_fakepeppino_land;
				image_index = 0;
				state = states.normal;
			}
			break;
	}
	grounded = scr_solid(x, y + 1);
}
