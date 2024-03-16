if (!other.ignore_grind && (other.state != states.tumble || (other.sprite_index != other.spr_tumble && other.sprite_index != other.spr_tumblestart && other.sprite_index != other.spr_tumbleend))
&& other.state != states.backbreaker && other.state != states.chainsaw && other.state != states.bump && other.y > other.yprevious
&& ((!other.isgustavo && (other.ispeppino || !other.noisecrusher) && other.y <= y + 10) || ((other.isgustavo || other.noisecrusher) && other.y < y)))
{
	if (!other.isgustavo && (other.ispeppino || !other.noisecrusher))
	{
		if other.state == states.punch
			other.movespeed = abs(other.hsp);
		
		var old_y = other.y;
		other.y = y - 49;
		var dif = old_y - other.y;
		with obj_camera
			offset_y += dif;
		if other.state == states.machcancel
		{
			if other.move != 0
				other.xscale = other.move;
			else if other.savedmove != 0
				other.xscale = other.savedmove;
			else if other.movespeed != 0
				other.xscale = sign(other.movespeed);
			other.movespeed = abs(other.hsp);
		}
		other.state = states.grind;
	}
	else if other.state != states.ratmountgrind
	{
		with other
		{
			if brick == true && ispeppino
			{
				with (instance_create(x, y, obj_brickcomeback))
					wait = true;
			}
			with (instance_create(x, y - 5, obj_parryeffect))
			{
				fmod_event_one_shot_3d("event:/sfx/pep/step", x, y);
				sprite_index = spr_grabhangeffect;
				image_speed = 0.35;
			}
			brick = false;
			with obj_camera
			{
				followtarget = other.id;
				state = states.camera_followtarget;
			}
		}
		other.y = y + 8;
		other.state = states.ratmountgrind;
		if !other.ispeppino
			other.movespeed = other.hsp;
	}
}
