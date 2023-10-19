if (other.state != states.chainsaw && other.skateboarding == 0)
{
	fmod_event_one_shot_3d("event:/sfx/misc/honkhonk", x, y);
	instance_create(x, y, obj_genericpoofeffect);
	other.movespeed = 10;
	other.state = states.mach2;
	other.skateboarding = true;
	other.clowntimer = 300;
}
