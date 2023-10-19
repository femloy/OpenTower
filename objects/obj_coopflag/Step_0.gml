if (obj_player1.spotlight == 1)
{
	x = obj_player1.x;
	y = obj_player1.y;
	image_xscale = obj_player1.xscale;
	if (obj_player1.character == "P" && sprite_index != spr_flagpeppino)
	{
		alarm[1] = -1;
		visible = true;
		sprite_index = spr_flagpeppino;
		alarm[0] = 150;
		alarm[2] = 200;
	}
	else if (obj_player1.character == "N" && sprite_index != spr_flagnoise)
	{
		visible = true;
		sprite_index = spr_flagnoise;
		alarm[1] = -1;
		alarm[0] = 150;
		alarm[2] = 200;
	}
}
else
{
	x = obj_player2.x;
	y = obj_player2.y;
	image_xscale = obj_player2.xscale;
	if (obj_player2.character == "P" && sprite_index != spr_flagpeppino)
	{
		visible = true;
		sprite_index = spr_flagpeppino;
		alarm[1] = -1;
		alarm[0] = 150;
		alarm[2] = 200;
	}
	else if (obj_player2.character == "N" && sprite_index != spr_flagnoise)
	{
		visible = true;
		sprite_index = spr_flagnoise;
		alarm[1] = -1;
		alarm[0] = 150;
		alarm[2] = 200;
	}
}
