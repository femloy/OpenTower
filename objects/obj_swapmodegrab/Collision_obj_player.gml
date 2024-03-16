if state > states.normal
	exit;

with other
{
	if !hurted && (state == states.normal || state == states.jump || state == states.mach2 || state == states.ratmount || state == states.ratmountjump)
	{
		instance_destroy(other);
		baddiegrabbedID = instance_create(x, y, obj_swapplayergrabbable);
		baddiegrabbedID.spr_palette = spr_palette;
		baddiegrabbedID.paletteselect = paletteselect;
		baddiegrabbedID.patterntexture = global.palettetexture;
		if isgustavo && ispeppino
			baddiegrabbedID.spr_palette = spr_ratmountpalette;
		swap_player(false);
		xscale = other.image_xscale;
		pistolcharge = 0;
		pistolchargeshooting = false
		pistolanim = -4
		if !isgustavo
		{
			if !key_up_p2
			{
				swingdingthrow = false
				image_index = 0
				if movespeed <= 10
					sprite_index = spr_haulingstart
				else
					sprite_index = spr_swingding
				if !grounded
					vsp = -6
				swingdingendcooldown = 0
				state = states.grab
				grabbingenemy = true
				heavy = baddiegrabbedID.heavy
				baddiegrabbedID.state = states.grabbed
				baddiegrabbedID.grabbedby = 1
			}
			else
			{
				grabbingenemy = true
				baddiegrabbedID.state = states.grabbed
				baddiegrabbedID.grabbedby = 1
				sprite_index = spr_piledriver
				vsp = -14
				state = states.superslam
				image_index = 0
				image_speed = 0.35
			}
		}
		else
		{
			state = states.ratmountpunch
			brick = false
			with (instance_create(x, y, obj_brickcomeback))
				wait = true
			sprite_index = spr_lonegustavo_punch
			movespeed = other.hsp
			if (abs(movespeed) < 10)
				movespeed = (xscale * 10)
			instance_destroy(baddiegrabbedID)
		}
	}
}
