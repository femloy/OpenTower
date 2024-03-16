var puppet_pos = monster_pos[2];
if player_posX != -1 && player_posY != -1 && player_posY == puppet_pos.y && sound_pos.x != -1 && sound_pos.y != -1
{
	last_puppet_pos.x = puppet_pos.x;
	last_puppet_pos.y = puppet_pos.y;
	puppet_pos.x = player_posX;
	puppet_pos.y = player_posY;
	sound_buffer = 0;
	monster_room[2] = ds_grid_get(room_grid, monster_pos[2].x, monster_pos[2].y);
}
if (monster_room[2] == room_get_name(room))
	puppet_create(true, false);
