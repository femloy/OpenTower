var p = obj_player1;
with (other)
{
	if (team != 1)
	{
		switch (object_index)
		{
			case obj_spitcheesespike:
				vsp = -6;
			case obj_robotknife:
			case obj_slugbullet:
			case obj_ufobullet:
			case obj_enemybullet:
				var current_hspd = abs(hsp);
				var _dir = sign(hsp);
				_dir = image_xscale * -1;
				if (!other.collisioned)
					p.xscale = _dir;
				hsp = _dir * current_hspd;
				image_xscale = _dir;
				break;
			case obj_rancher_bullet:
				_dir = sign(image_xscale);
				_dir = image_xscale * -1;
				if (!other.collisioned)
					p.xscale = _dir;
				image_xscale = _dir;
				break;
			case obj_arcprojectile:
				current_hspd = abs(hsp);
				_dir = sign(hsp);
				_dir = _dir * -1;
				if (!other.collisioned)
					p.xscale = _dir;
				image_xscale = _dir;
				hsp = _dir * current_hspd;
				vsp = -7;
				break;
			case obj_noisegoblin_arrow:
			case obj_whoophand:
				current_hspd = abs(speed);
				_dir = sign(speed);
				if (!other.collisioned)
				{
					if (direction < 90 || direction > 270)
						obj_player1.xscale = -1;
					else
						obj_player1.xscale = 1;
				}
				if (((direction < 90 || direction > 270) && x < other.x) || ((direction > 90 || direction < 270) && x > other.x))
					_dir = -1;
				speed = _dir * speed;
				image_angle = point_direction(x, y, xstart, ystart);
				if (object_index == obj_whoophand)
				{
					dir = _dir;
					stop = false;
					image_alpha = 1;
					alarm[0] = 80;
				}
				break;
			case obj_pizzard_bolt:
				_dir = sign(image_xscale);
				_dir = -_dir;
				if (!other.collisioned)
					p.xscale = _dir;
				image_xscale = _dir;
				break;
			case obj_pizzice_projectile:
				if (team != 1)
				{
					image_xscale *= -1;
					image_yscale *= -1;
					if (!other.collisioned)
						p.xscale = image_xscale;
				}
				break;
		}
	}
	team = 1;
}
if (!collisioned)
	event_user(0);
