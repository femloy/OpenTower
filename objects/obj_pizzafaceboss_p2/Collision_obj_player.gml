if (other.state == states.knightpep && other.sprite_index != other.spr_knightpepstart && other.sprite_index != other.spr_knightpepthunder)
{
	fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y);
	state = states.stun;
	stunned = 1000;
	lastattack = pizzaface_p2_attacks.pullinglevel;
	throwsword = false;
	other.state = states.normal;
	other.jumpstop = true;
	other.vsp = -11;
	instance_destroy(obj_swordstone);
}
