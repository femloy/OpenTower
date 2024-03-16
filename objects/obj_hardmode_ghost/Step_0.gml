highest_y = -270;
var _instY = collision_line(obj_player1.x, obj_player1.y, obj_player1.x, obj_player1.y - 270, obj_solid, false, true);
if _instY != -4
	highest_y = -abs(obj_player1.y - (_instY.y + _instY.sprite_height)) - 32;
if random_buffer > 0
	random_buffer--;
else
{
	var _col = collision_line(x, y, obj_player1.x, obj_player1.y, obj_solid, false, true);
	if (!place_meeting(x, y, obj_solid) && !place_meeting(x, y, obj_slope) && _col == noone)
	{
		var n = irandom(array_length(content) - 1);
		with (instance_create(x, y, content[n]))
		{
			important = true;
			state = states.stun;
			stunned = 50;
		}
		random_buffer = (random_max - (50 * global.heatmeter_threshold)) + irandom_range(-(60 * global.heatmeter_threshold), random_random - (30 * global.heatmeter_threshold));
	}
}
hsp = Wave(-288, 288, 10, 0);
vsp = Wave(highest_y + 78, highest_y + 152, 1, 0);
x = obj_player1.x + hsp;
y = obj_player1.y + obj_player1.vsp + vsp;
