if other.state != states.chainsaw
{
	repeat 8
	{
		with (create_debris(x, y, spr_slimedebris))
		{
			vsp = random_range(-5, 0);
			hsp = random_range(-3, 3);
		}
	}
	if other.state != states.cheesepep
	{
	}
	other.state = states.cheesepep;
	other.movespeed = 0;
	other.sprite_index = other.spr_cheesepepintro;
	instance_destroy();
}
