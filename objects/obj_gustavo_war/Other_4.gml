if !obj_player1.ispeppino
{
	instance_destroy();
	with (instance_create(x, y + 12, obj_bucket_war))
		image_xscale = other.image_xscale;
}
