function scr_robot_normal()
{
	image_speed = 0.35;
	sprite_index = walkspr;
	hsp = image_xscale * movespeed;
	if (place_meeting(x + hsp, y, obj_solid) || (place_meeting(x + hsp, y, obj_hallway) && !place_meeting(x, y, obj_hallway)))
		image_xscale *= -1;
	if random_buffer <= 0
	{
		turnbuffer = turnmax;
		state = states.turn;
		sprite_index = turnspr;
		image_speed = 0.25;
		old_xscale = image_xscale;
		image_xscale *= -1;
		image_index = 0;
	}
}
function scr_robot_turn()
{
	image_speed = 0.25;
	hsp = 0;
	if (image_index > image_number - 1)
	{
		state = states.normal;
		sprite_index = walkspr;
		image_index = 0;
		image_xscale = old_xscale;
	}
}
function scr_robot_chase()
{
	sprite_index = chasespr;
	if ((playerinst.x - x) != 0)
	{
		image_xscale = sign(playerinst.x - x);
		hsp = image_xscale * movespeed_chase;
	}
	if (playerinst.x > (x - 16) && playerinst.x < (x + 16))
		hsp = 0;
	var _col = collision_line(x, y, playerinst.x, playerinst.y, obj_solid, false, true);
	if (playerinst.y < (y - attack_threshold_y) && _col == noone && playerinst.x > (x - attack_threshold_x) && playerinst.x < (x + attack_threshold_x))
	{
		hsp = 0;
		state = states.throwing;
	}
	if ((global.monsterspeed >= 1 && !point_in_camera(x, y, view_camera[0])) || distance_to_object(playerinst) > distance_to_idle)
		state = states.normal;
}
function scr_robot_attack()
{
	sprite_index = spr_monstershroom_idle;
	hsp = 0;
	if (!instance_exists(throw_inst))
	{
		throw_inst = instance_create(x, y, obj_robotmonsterhand);
		with throw_inst
		{
			fake = other.fake;
			targetRoom = other.targetRoom;
			targetDoor = other.targetDoor;
			angle = point_direction(x, y, other.playerinst.x, other.playerinst.y);
			baddieID = other.id;
			monsterid = other.monsterid;
		}
	}
}
function scr_robot_detect()
{
	var _col = collision_line(x, y, playerinst.x, playerinst.y, obj_solid, false, true);
	var _player_colX = (image_xscale > 0) ? (playerinst.x < (x + threshold_x) && playerinst.x > x) : (playerinst.x > (x - threshold_x) && playerinst.x < x);
	var _player_colY = playerinst.y > (y - threshold_y) && playerinst.y < (y + threshold_y);
	if ((global.monsterspeed >= 1 && point_in_camera(x, y, view_camera[0])) || (_col == noone && _player_colX && _player_colY))
	{
		if image_yscale < 0
		{
			y += (47 * image_yscale);
			image_yscale = 1;
		}
		state = states.chase;
		sprite_index = chasespr;
		image_index = 0;
	}
}
