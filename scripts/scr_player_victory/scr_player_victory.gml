function scr_player_victory()
{
	hsp = 0;
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;
	machhitAnim = false;
	global.heattime = 60;
	if (place_meeting(x, y, obj_keydoor) || place_meeting(x, y, obj_geromedoor))
		sprite_index = spr_victory;
	if (place_meeting(x, y, obj_startgate))
		sprite_index = spr_entergate;
	if (floor(image_index) == (image_number - 1))
		image_speed = 0;
	else
		image_speed = 0.35;
}
