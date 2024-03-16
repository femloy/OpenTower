if (state != states.grabbed && (other.state != states.handstandjump || invincible) && (other.state != states.tumble || (other.sprite_index != other.spr_tumble && other.sprite_index != other.spr_tumblestart && other.sprite_index != other.spr_tumbleend)) && state != states.stun && (state == states.chase || state == states.walk))
{
	var s = other.state;
	if other.flash
		other.flash = false;
	scr_hurtplayer(other);
	if other.state != s && other.state != states.parry
	{
		state = states.stun;
		hsp = -image_xscale * 7;
		vsp = -6;
		stunned = 100;
	}
}
