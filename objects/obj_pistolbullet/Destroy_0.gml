if sprite_index != sprite10391
{
	with (instance_create(x, y, obj_rancherbullet_debris))
	{
		image_xscale = other.image_xscale;
		sprite_index = spr_peppinobullet_dead;
		vsp = random_range(-3, -6);
		hsp = -image_xscale * 4;
		if other.sprite_index == spr_peppinobulletGIANT
			sprite_index = spr_peppinobulletGIANT_dead;
	}
}
else
{
	repeat 6
		create_particle(x + random_range(-25, 25), y + random_range(-25, 25), particle.shotgunimpact, 0);
}
