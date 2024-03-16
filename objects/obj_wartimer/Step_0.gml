if room == rank_room
{
	visible = false;
	instance_destroy();
}
else
	visible = true;
timer_y = Approach(timer_y, SCREEN_HEIGHT, 2);
timer_index += 0.25;
if (floor(timer_index) > (sprite_get_number(spr_wartimer_panic) - 1))
	timer_index = frac(timer_index);
