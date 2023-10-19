if (obj_player1.state == states.bombpep && obj_player1.sprite_index != obj_player1.spr_bombpepend && (place_meeting(x + 1, y, obj_player1) || place_meeting(x - 1, y, obj_player1) || place_meeting(x, y - 1, obj_player1) || place_meeting(x, y + 1, obj_player1)))
{
	with (obj_player1)
	{
		instance_create(x, y, obj_bombexplosion);
		GamepadSetVibration(0, 1, 1, 0.9);
		hurted = true;
		vsp = -4;
		image_index = 0;
		sprite_index = spr_bombpepend;
		state = states.bombpep;
		bombpeptimer = 0;
	}
}
if (obj_player2.state == states.bombpep && obj_player2.sprite_index != obj_player2.spr_bombpepend && (place_meeting(x + 1, y, obj_player2) || place_meeting(x - 1, y, obj_player2) || place_meeting(x, y - 1, obj_player2) || place_meeting(x, y + 1, obj_player2)))
{
	with (obj_player2)
	{
		GamepadSetVibration(1, 1, 1, 0.9);
		instance_create(x, y, obj_bombexplosion);
		hurted = true;
		vsp = -4;
		image_index = 0;
		sprite_index = spr_bombpepend;
		state = states.bombpep;
		bombpeptimer = 0;
	}
}
