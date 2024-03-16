if ((state == states.walk || (state == states.stun && !savedthrown)) && flickertime <= 0 && wastedhits == 7) && !pizzahead
{
	if phase == 1
	{
		with (instance_create(other.x, other.y, obj_explosioneffect))
			sprite_index = spr_bombexplosion;
		scr_boss_do_hurt_phase2(obj_player1);
		if x != other.x
			image_xscale = sign(other.x - x);
		instance_destroy(other.bombID, false);
		instance_destroy(other);
	}
	else
	{
		instance_destroy(other.bombID, false);
		instance_destroy(other);
		scr_doise_end_start();
	}
}
