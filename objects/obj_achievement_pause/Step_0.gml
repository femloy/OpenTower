scr_menu_getinput();
yoffset--;
move = key_left2 + key_right2;
if move != 0
{
	achievement += move;
	achievement = clamp(achievement, -1, array_length(achievements) - 1);
}
if achievement == -1 && key_down2
	achievement = 0;
if key_up2
	achievement = -1;
if key_back
{
	key_jump = true;
	achievement = -1;
}
if achievement == -1 && key_jump
	alarm[0] = 1;
