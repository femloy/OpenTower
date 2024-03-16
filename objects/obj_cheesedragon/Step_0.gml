if obj_player1.spotlight == 1
	playerid = obj_player1;
else
	playerid = obj_player2;
if (floor(image_index) == image_number - 1 && (sprite_index == spr_cheesedragon_flames || sprite_index == spr_cheesedragon_stomp))
{
	sprite_index = spr_cheesedragon_idle;
	attacked = false;
	attackcycle = choose(0, 2);
}
if (attackcycle == 0 && attacked == 0 && floor(image_index) == 13 && sprite_index == spr_cheesedragon_stomp)
{
	with obj_baddie
	{
		if grounded
		{
			vsp = -11;
			hsp = 0;
		}
	}
	with obj_camera
	{
		shake_mag = 20;
		shake_mag_acc = 60 / room_speed;
	}
	instance_create(playerid.x + -250, -10, obj_bowlingball);
	instance_create(playerid.x + -125, -10, obj_bowlingball);
	instance_create(playerid.x, -10, obj_bowlingball);
	instance_create(playerid.x + 125, -10, obj_bowlingball);
	instance_create(playerid.x + 250, -10, obj_bowlingball);
	attacked = true;
}
if (attackcycle == 2 && floor(image_index) > 13 && floor(image_index) < 21 && sprite_index == spr_cheesedragon_flames && alarm[1] == -1)
	alarm[1] = 1;
if (floor(image_index) == image_number - 1 && sprite_index == spr_cheesedragon_hurt)
	sprite_index = spr_cheesedragon_goingup;
if sprite_index == spr_cheesedragon_goingup
	y -= 4;
if y == -1000
	instance_destroy();
