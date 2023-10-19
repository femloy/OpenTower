if (other.state == states.gotoplayer)
	exit;
fmod_event_one_shot_3d("event:/sfx/misc/balloonpop", x, y);
create_particle(x, y, particle.balloonpop, 0);
other.vsp = -14;
other.jumpstop = true;
visible = false;
x = -100;
y = -100;
respawn = 100;
if (other.state == states.jump)
	other.sprite_index = other.spr_machfreefall;
if (other.state == states.climbwall)
{
	other.sprite_index = other.spr_machfreefall;
	other.state = states.jump;
}
