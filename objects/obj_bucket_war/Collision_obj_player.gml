with (instance_create(x, y + 23, obj_gustavo_warmissile))
{
	sprite_index = spr_bucket_war
	speed = 15
	rotate_speed = 10
	direction = 90
}
instance_destroy()
instance_create(x, y, obj_bangeffect)
