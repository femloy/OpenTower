targetplayer = obj_player1.id;
mask_index = spr_player_mask;
switch state
{
	case states.transition:
		scr_fakepepclone_transitioncutscene();
		break;
	case states.walk:
		scr_fakepepclone_walk();
		break;
	case states.grabdash:
		scr_fakepepboss_grabdash();
		break;
	case states.grabthrow:
		scr_fakepepboss_grabthrow();
		break;
	case states.jump:
		scr_fakepepboss_jump();
		break;
	case states.freefall:
		scr_fakepepboss_freefall();
		break;
	case states.mach2:
		scr_fakepepboss_mach2();
		break;
	case states.Sjumpprep:
		scr_fakepepclone_Sjumpprep();
		break;
	case states.Sjump:
		scr_fakepepclone_Sjump();
		break;
	case states.throwing:
		scr_fakepepclone_throwing();
		break;
	case states.backbreaker:
		scr_fakepepboss_backbreaker();
		break;
}
if state == states.Sjump
{
	if (!instance_exists(hitboxID))
	{
		with (instance_create(x, y, obj_forkhitbox))
		{
			ID = other.id;
			other.hitboxID = id;
			sprite_index = other.sprite_index;
		}
	}
}
if ((state == states.grabdash || (state == states.mach2 && attackspeed >= 10) || (state == states.throwing && sprite_index == spr_fakepeppino_flailing) || state == states.freefall) && alarm[0] == -1)
{
	alarm[0] = 10;
	if state == states.freefall
		alarm[0] = 5;
}
if state == states.jump
	grav = 0.4;
else
	grav = 0.5;
scr_collide();
scr_fakepep_update_sounds();
