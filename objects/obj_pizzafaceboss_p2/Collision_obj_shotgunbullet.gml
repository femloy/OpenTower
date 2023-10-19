if (state != states.stun)
{
	state = states.stun;
	stunned = 1000;
	thrown = false;
	hsp = -image_xscale * 8;
	vsp = -4;
	lastattack = pizzaface_p2_attacks.gun;
	with (obj_player)
		shotgunAnim = false;
}
instance_destroy(other);
