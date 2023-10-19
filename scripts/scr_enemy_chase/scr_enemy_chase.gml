function scr_enemy_chase()
{
	if (object_index == obj_minijohn || object_index == obj_banditochicken || object_index == obj_golfdemon)
	{
		var targetplayer = obj_player1;
		if (obj_player1.spotlight == 0)
			targetplayer = obj_player2;
		if (x != targetplayer.x && !(image_xscale == -sign(x - targetplayer.x)))
		{
			movespeed = 4;
			if (object_index == obj_golfdemon)
				movespeed = 6;
			image_xscale = -sign(x - targetplayer.x);
			momentum = -image_xscale * (movespeed + 4);
		}
		hsp = (image_xscale * movespeed) + momentum;
		momentum = Approach(momentum, 0, 0.1);
		if (grounded && vsp > 0)
			steppy--;
		if (steppy <= 0)
		{
			instance_create(x, y + 43, obj_cloudeffect);
			steppy = 20;
		}
	}
	if (object_index == obj_golfdemon)
	{
		invincible = true;
		sprite_index = spr_golfdemon_charge;
	}
	if (place_meeting(x, y + 1, obj_railparent))
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		hsp += (_railinst.movespeed * _railinst.dir);
	}
}
