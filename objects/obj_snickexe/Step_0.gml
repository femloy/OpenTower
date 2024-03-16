x = median(x - maxspeed, obj_player1.x, x + maxspeed);
y = median(y - maxspeed, obj_player1.y, y + maxspeed);
if x != obj_player.x
	image_xscale = -sign(x - obj_player.x);
if global.snickchallenge == 0
	instance_destroy();
if (hitboxcreate == 0 && (obj_player1.instakillmove == 0 && obj_player1.state != states.handstandjump))
{
	hitboxcreate = true;
	with (instance_create(x, y, obj_forkhitbox))
	{
		sprite_index = other.sprite_index;
		ID = other.id;
	}
}
if (place_meeting(x, y, obj_player1) && (obj_player1.instakillmove == 1 || obj_player1.state == states.handstandjump))
{
	repeat 6
	{
		with (instance_create(x + random_range(-100, 100), y + random_range(-100, 100), obj_balloonpop))
			sprite_index = spr_shotgunimpact;
	}
	x = room_width / 2;
	y = -100;
}
if (room == ruin_11 || room == ruin_3)
{
	x = room_width / 2;
	y = -100;
}
