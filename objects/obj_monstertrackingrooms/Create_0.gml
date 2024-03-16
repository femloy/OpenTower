if (instance_number(obj_monstertrackingrooms) > 1)
{
	instance_destroy();
	exit;
}
global.monsterlives_max = 3;
global.monsterlives = global.monsterlives_max;
global.monsterspeed = 0;
global.monster_targetRoom = kidsparty_2;
global.monster_targetDoor = "A";
map_width = 5;
map_height = 5;
sound_pos = new Vector2(-1, -1);
sound_buffer = 0;

room_grid = ds_grid_create(map_width, map_height);
ds_grid_clear(room_grid, -4);
ds_grid_add(room_grid, 0, 0, room_get_name(kidsparty_floor1_1))
ds_grid_add(room_grid, 1, 0, room_get_name(kidsparty_floor1_2))
ds_grid_add(room_grid, 2, 0, room_get_name(kidsparty_floor1_3))
ds_grid_add(room_grid, 3, 0, room_get_name(kidsparty_floor1_4))
ds_grid_add(room_grid, 0, 1, room_get_name(kidsparty_floor2_1))
ds_grid_add(room_grid, 1, 1, room_get_name(kidsparty_floor2_2))
ds_grid_add(room_grid, 2, 1, room_get_name(kidsparty_floor2_3))
ds_grid_add(room_grid, 3, 1, room_get_name(kidsparty_floor2_4))
ds_grid_add(room_grid, 0, 2, room_get_name(kidsparty_floor3_1))
ds_grid_add(room_grid, 1, 2, room_get_name(kidsparty_floor3_2))
ds_grid_add(room_grid, 2, 2, room_get_name(kidsparty_floor3_3))
ds_grid_add(room_grid, 3, 2, room_get_name(kidsparty_floor3_4))
ds_grid_add(room_grid, 0, 3, room_get_name(kidsparty_floor4_1))
ds_grid_add(room_grid, 1, 3, room_get_name(kidsparty_floor4_2))
ds_grid_add(room_grid, 2, 3, room_get_name(kidsparty_floor4_3))
ds_grid_add(room_grid, 3, 3, room_get_name(kidsparty_floor4_4))

monster_alarm[0] = 300;
monster_pos[0] = new Vector2(3, 0);
monster_dir[0] = new Vector2(1, 0);
monster_active[0] = true;
monster_room[0] = -4;

monster_alarm[1] = 300;
monster_pos[1] = new Vector2(3, 1);
monster_dir[1] = new Vector2(0, 0);
monster_active[1] = true;
monster_room[1] = -4;

monster_alarm[2] = 10;
monster_pos[2] = new Vector2(3, 2);
last_puppet_pos = new Vector2(monster_pos[2].x, monster_pos[2].y);
monster_dir[2] = new Vector2(0, 0);
monster_active[2] = true;
monster_room[2] = -4;

monster_alarm[3] = 300;
monster_pos[3] = new Vector2(3, 3);
monster_dir[3] = new Vector2(0, 0);
monster_active[3] = true;
monster_room[3] = -4;

monster_pos[4] = new Vector2(3, 4);
monster_alarm[4] = 360;
monster_active[4] = false;
monster_room[4] = -4;

for (var i = 0; i < array_length(monster_pos); i++)
{
	var bpos = monster_pos[i];
	monster_startpos[i] = new Vector2(bpos.x, bpos.y);
}

pineapple_effect = 0;
pineapple_effect_max = 5;
effect_buffer = 0;
effect_max = 1800;
player_posX = ds_grid_value_x(room_grid, 0, 0, map_width - 1, map_height - 1, room_get_name(room));
player_posY = ds_grid_value_y(room_grid, 0, 0, map_width - 1, map_height - 1, room_get_name(room));

function robot_create(argument0, argument1)
{
	if (!instance_exists(obj_robotmonster))
	{
		var _inst = instance_create(x, y, obj_robotmonster);
		var _dir = monster_dir[0];
		with _inst
		{
			fake = argument1;
			if argument0
			{
				var _hinst = -4;
				with obj_hallwaymonster
				{
					if ((_dir.x < 0 && x > (room_width / 2)) || (_dir.x > 0 && x < (room_width / 2)))
						_hinst = id;
				}
				image_xscale = sign(_dir.x);
				if (instance_exists(_hinst))
				{
					x = _hinst.x + 32;
					y = _hinst.bbox_bottom - 51;
				}
				else
					instance_destroy();
			}
			else
			{
				var _doorInst = -4;
				with obj_doorMonster
				{
					if (!place_meeting(x, y - 32, obj_solid))
						_doorInst = id;
				}
				if (!instance_exists(_doorInst))
					_doorInst = asset_get_index("obj_door" + obj_player1.targetDoor);
				if _dir.x != 0
					image_xscale = _dir.x;
				if (instance_exists(_doorInst))
				{
					x = _doorInst.x + 32;
					y = _doorInst.y - 14;
				}
				else
					instance_destroy();
			}
		}
	}
}
function blob_create(argument0, argument1)
{
	if (!instance_exists(obj_blobmonster))
	{
		var _inst = instance_create(x, y, obj_blobmonster);
		var _dir = monster_dir[1];
		with _inst
		{
			fake = argument1;
			if argument0
			{
				var _hinst = -4;
				with obj_hallwaymonster
				{
					if ((_dir.x < 0 && x > (room_width / 2)) || (_dir.x > 0 && x < (room_width / 2)))
						_hinst = id;
				}
				image_xscale = sign(_dir.x);
				if (instance_exists(_hinst))
				{
					x = _hinst.x + 32;
					y = _hinst.y + 60;
				}
				else
					instance_destroy();
			}
			else
			{
				var _doorInst = -4;
				with obj_doorMonster
					_doorInst = id;
				if (!instance_exists(_doorInst))
					_doorInst = asset_get_index("obj_door" + obj_player1.targetDoor);
				if _dir.x != 0
					image_xscale = _dir.x;
				if (instance_exists(_doorInst))
				{
					x = _doorInst.x + 32;
					y = _doorInst.y - 14;
					if (place_meeting(x, y, obj_monstersolid))
					{
						var i = 0;
						while (place_meeting(x, y, obj_monstersolid))
						{
							y++;
							i++;
							if i > room_height
								break;
						}
					}
				}
				else
					instance_destroy();
			}
		}
	}
}
function puppet_create()
{
	instance_create_unique(0, 0, obj_puppetmonster);
}
function hillbilly_create(argument0, argument1)
{
	if (!instance_exists(obj_hillbillymonster))
	{
		var _inst = instance_create(x, y, obj_hillbillymonster);
		var _dir = monster_dir[3];
		with _inst
		{
			fake = argument1;
			if argument0
			{
				var _hinst = -4;
				with obj_hallwaymonster
				{
					if ((_dir.x < 0 && x > (room_width / 2)) || (_dir.x > 0 && x < (room_width / 2)))
						_hinst = id;
				}
				image_xscale = sign(_dir.x);
				if (instance_exists(_hinst))
				{
					x = _hinst.x + 32;
					y = _hinst.bbox_bottom - 51;
				}
				else
					trace("destroy1");
			}
			else
			{
				var _doorInst = -4;
				with obj_doorMonster
				{
					if (!place_meeting(x, y - 32, obj_solid))
						_doorInst = id;
				}
				if (!instance_exists(_doorInst))
					_doorInst = asset_get_index("obj_door" + obj_player1.targetDoor);
				if _dir.x != 0
					image_xscale = _dir.x;
				if (instance_exists(_doorInst))
				{
					x = _doorInst.x + 32;
					y = _doorInst.y - 14;
				}
				else
					trace("destroy2");
			}
		}
	}
}
function grid_meeting(argument0, argument1)
{
	if (argument0 < 0 || argument0 > (map_width - 1) || argument1 < 0 || argument1 > (map_height - 1))
		return false;
	if (ds_grid_get(room_grid, argument0, argument1) != -4)
		return true;
	return false;
}
function grid_length_x(argument0, argument1, argument2)
{
	for (var count = 0; grid_meeting(argument0 + argument2, argument1); argument0 += argument2)
		count++;
	return count;
}
function room_place(argument0, argument1)
{
	if (argument0 < 0 || argument0 > (map_width - 1) || argument1 < 0 || argument1 > (map_height - 1))
		return noone;
	return ds_grid_get(room_grid, argument0, argument1);
}
