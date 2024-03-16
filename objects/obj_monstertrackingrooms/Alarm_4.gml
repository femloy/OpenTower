if monster_active[4] && room != kidsparty_entrance1 && room != kidsparty_entrance2
{
	var n = irandom(3);
	if (!instance_exists(obj_pineapplemonster))
	{
		monster_pos[4].x = player_posX;
		monster_pos[4].y = player_posY;
		instance_create(obj_player1.x, obj_player1.y, obj_pineapplemonster);
	}
	with obj_pineapplemonster
	{
		sprite_index = choose(spr_monsterpineapple_pose1, spr_monsterpineapple_pose2, spr_monsterpineapple_pose3);
		image_index = 0;
	}
	switch n
	{
		case 0:
			monster_dir[0].x = choose(-1, 1);
			robot_create(true, false);
			break;
		case 1:
			monster_dir[1].x = choose(-1, 1);
			blob_create(true, false);
			break;
		case 2:
			monster_dir[2].x = choose(-1, 1);
			hillbilly_create(true, false);
			break;
		case 3:
			puppet_create(true, false);
			break;
	}
}
