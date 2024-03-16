cutscenetimer--;
if cutscenetimer < 0 && moving == 0 && throwcoin == 0
{
	cutscenetimer = 30;
	moving = true;
}
if moving == 1 && cutscenetimer > 0
	x += 1;
if cutscenetimer < 0 && moving == 1 && throwcoin == 0
{
	moving = false;
	throwcoin = true;
	cutscenetimer = 20;
}
if cutscenetimer < 0 && throwcoin == 1 && numberofcoinsthrow != 0
{
	numberofcoinsthrow -= 1;
	cutscenetimer = 30;
	with (instance_create(x, y, obj_pizzacoin))
	{
		hsp = image_xscale * 5;
		vsp = -7;
	}
}
if numberofcoinsthrow == 0 && done == 0
{
	with obj_player
	{
		image_index = 0;
		sprite_index = spr_player_levelcomplete;
		image_speed = 0.35;
		instance_create(x, y, obj_costumerpizza);
		costumercutscenetimer = 100;
	}
	done = true;
}
