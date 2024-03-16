function scr_player_titlescreen()
{
	if object_index == obj_player1
		targetDoor = "A";
	if (sprite_index == spr_pepcooter && !instance_exists(obj_superdashcloud))
		instance_create(x - 100, y, obj_superdashcloud);
	sprite_index = spr_player_idle;
	image_speed = 0.35;
}
