var tx = playerid.x - 32;
var ty = playerid.y - 60 - 64;
switch state
{
	case 0:
		state++;
		xoffset = x - tx;
		yoffset = y - ty;
		break;
	case 1:
		depth = -99;
		x = tx + xoffset;
		y = ty + yoffset;
		xoffset = Approach(xoffset, 0, 4);
		yoffset = Approach(yoffset, 0, 4);
		if xoffset == 0 && yoffset == 0
		{
			buffer = 100;
			state++;
		}
		break;
	case 2:
		x = lerp(x, tx, 0.2);
		y = lerp(y, ty, 0.2);
		if buffer > 0
			buffer--;
		else
		{
			instance_destroy();
			scr_fmod_soundeffect(global.snd_breakblock, x, y);
			repeat 7
				create_debris(x + (sprite_width / 2), y + (sprite_height / 2), spr_pumpkinchunks);
		}
		break;
}
