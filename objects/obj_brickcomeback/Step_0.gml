if obj_player.isgustavo == 0
{
	instance_create(x, y, obj_genericpoofeffect);
	instance_destroy();
}
if !trapped
{
	if (obj_player1.state == states.ratmountgrind || obj_player1.state == states.ratmountladder || obj_player1.state == states.ratmountcrouch)
	{
		wait = true;
		sprite_index = spr_lonebrick_wait;
		alarm[0] = 30;
		depth = obj_player1.depth + 1;
		comeback = false;
	}
	if comeback == 1
	{
		depth = obj_player1.depth + 1;
		x = Approach(x, obj_player1.x, cbspeed);
		y = Approach(y, obj_player1.y, cbspeed);
		cbspeed = Approach(cbspeed, 20, 1);
	}
	else if wait == 0
	{
		x += hsp;
		y += vsp;
		if vsp < 20
			vsp += 0.5;
	}
	if comeback
		sprite_index = spr_lonebrick_comeback;
}
else if baddieID == noone
{
	vsp = -10;
	if ((y + vsp) < 80 || scr_solid(x, y - 78))
		vsp = 0;
	y += vsp;
}
else if (!instance_exists(baddieID))
	trapped = false;
