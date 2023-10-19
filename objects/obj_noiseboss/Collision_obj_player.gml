




if ((state == states.mach2 && hsp != 0) || (state == states.pizzahead_spinningkick && image_index > 3) || (state == states.freefall && !grounded) || state == states.machslide || state == states.pogo || state == states.jetpack || state == states.bounce)
{
	if (other.flash)
		other.flash = false;
	scr_hurtplayer(other);
}
else if (((state == states.walk || (state == states.stun && !savedthrown)) && flickertime <= 0 && wastedhits == 7 && (other.instakillmove || other.state == states.handstandjump)) && !pizzahead)
{
	if (phase == 1)
		scr_boss_do_hurt_phase2(other);
	else
	{
		instance_destroy(obj_noisey);
		instance_destroy(obj_noiseyspawner);
		instance_destroy(obj_noiseyspawner2);
		fightballcount = 0;
		substate = states.fightball;
		state = states.finale;
		sprite_index = spr_playerN_fightball;
		image_index = 0;
		image_speed = 0.35;
		other.state = states.actor;
		other.image_speed = 0.35;
		other.sprite_index = spr_player_fightball;
		other.image_index = 0;
	}
}
