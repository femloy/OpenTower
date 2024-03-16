if (!instance_exists(bombID))
	exit;

array_push(bombID.baddie_arr, [other.id, obj_johnecheese]);
instance_destroy(bombID);
