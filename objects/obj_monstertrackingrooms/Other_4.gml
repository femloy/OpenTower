player_posX = ds_grid_value_x(room_grid, 0, 0, map_width - 1, map_height - 1, room_get_name(room));
player_posY = ds_grid_value_y(room_grid, 0, 0, map_width - 1, map_height - 1, room_get_name(room));
for (var i = 0; i < array_length(monster_room); i++)
{
	if i == 4
	{
	}
	else
		monster_room[i] = ds_grid_get(room_grid, monster_pos[i].x, monster_pos[i].y);
}
if player_posX != -1 && player_posY != -1
{
	if (monster_room[0] == room_get_name(room) && monster_active[0])
		robot_create(false, false);
	if (monster_room[1] == room_get_name(room) && monster_active[1])
		blob_create(false, false);
	if (monster_room[3] == room_get_name(room) && monster_active[3])
		hillbilly_create(false, false);
	if monster_active[4]
	{
		monster_pos[4].x = player_posX;
		monster_pos[4].y = player_posY;
		instance_create(obj_player1.x, obj_player1.y, obj_pineapplemonster);
	}
}
