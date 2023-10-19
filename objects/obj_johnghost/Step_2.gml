var cx = camera_get_view_x(view_camera[0]);
switch (state)
{
	case states.walk:
		if (playerid.x != x)
			image_xscale = sign(playerid.x - x);
		currentx = Approach(currentx, targetx, 2);
		x = cx + currentx;
		if (currentx == targetx)
		{
			state = states.charge;
			attack_buffer = attack_max;
		}
		y = Approach(y, playerid.y, 8);
		break;
	case states.charge:
		if (playerid.x != x)
			image_xscale = sign(playerid.x - x);
		y = Approach(y, playerid.y, 8);
		x = cx + currentx;
		if (attack_buffer > 0)
			attack_buffer--;
		else
		{
			state = states.punch;
			create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
		}
		break;
	case states.punch:
		if (!hitboxcreate)
		{
			with (instance_create(x, y, obj_forkhitbox))
			{
				ID = other.id;
				other.hitboxcreate = true;
			}
		}
		x += (image_xscale * 14);
		break;
}
