if sprite_index == spr_piraneapple_projectile
	instance_destroy();
else
{
	instance_destroy();
	if other.minigun
		instance_destroy(other);
}
