mask_index = spr_pepperman_statues1;
if hitLag <= 0
	scr_collide();
else
{
	x = hitX + irandom_range(-4, 4);
	y = hitY + irandom_range(-4, 4);
	hitLag--;
	if hitLag <= 0
	{
		x = hitX;
		y = hitY;
	}
}
if !fall && grounded && vsp > 0
{
	fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
	fall = true;
	if (instance_exists(obj_player1) && obj_player1.ispeppino && !global.swapmode)
	{
		grabID = instance_create(x + (32 * image_xscale), y, obj_grabmarker);
		with grabID
			ID = other.id;
	}
	with obj_camera
	{
		shake_mag = 3;
		shake_mag_acc = 5 / room_speed;
	}
}
if contemplated
{
	with obj_pepperman
	{
		if (thrown || state == states.phase1hurt)
			instance_destroy(other);
		else if state != states.contemplate && state != states.hit && state != states.stun
		{
			other.contemplated = false;
			marbleblockID = -4;
		}
	}
}
image_index = round(maxhp - hp);
if floor(image_index) == image_number - 1
	instance_destroy(grabID);
