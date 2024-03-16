if !trapped
{
	if comeback == 1 && obj_player1.state != states.ratmountpunch && obj_player1.sprite_index != spr_lonegustavo_hurt && obj_player1.state != states.ratmountgroundpound
	{
		other.brick = true;
		if other.state != states.ratmountcrouch && other.state != states.backbreaker && other.state != states.bump && other.state != states.ratmounthurt
		{
			if !other.grounded
				other.sprite_index = spr_player_ratmountfall;
			else
				other.sprite_index = spr_player_ratmountidle;
		}
		if other.state == states.ratmountjump
		{
			other.sprite_index = spr_player_ratmountfall;
			other.jumpAnim = false;
		}
		else if other.state == states.bump
			other.sprite_index = spr_player_ratmountbump;
		instance_create(other.x, other.y, obj_genericpoofeffect);
		instance_destroy();
	}
}
else if other.state == states.ratmountpunch && baddieID == noone
{
	fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y);
	vsp = -6;
	hsp = other.xscale * 8;
	trapped = false;
	wait = true;
	comeback = false;
	alarm[0] = 30;
}
