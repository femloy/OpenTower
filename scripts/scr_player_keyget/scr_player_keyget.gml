function scr_player_keyget()
{
	hsp = 0;
	vsp = 0;
	image_speed = 0.35;
	movespeed = 0;
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;
	machhitAnim = false;
	global.combotime = 60;
	sprite_index = spr_keyget;
	if (!keysound && floor(image_index) >= 16)
	{
		keysound = true;
		scr_fmod_soundeffect(snd_voiceok, obj_player1.x, obj_player1.y);
	}
	if floor(image_index) == image_number - 1
	{
		global.keyget = false;
		state = states.normal;
		image_index = 0;
		with instance_create(x, y, obj_keyfollow)
		{
			if other.goblinkey
				sprite_index = spr_goblinkey;
		}
		goblinkey = false;
	}
}
