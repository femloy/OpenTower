if (hurted == 0 && other.grounded == 0 && other.team == 0 && (state != states.backbreaker || parrytimer <= 0) && state != states.parry)
{
	instance_destroy(other);
	instance_create(x, y, obj_canonexplosion);
}
