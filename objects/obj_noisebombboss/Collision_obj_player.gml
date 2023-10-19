if (!other.hurted && other.state != states.parry && (other.state != states.backbreaker || !instance_exists(obj_parryhitbox)))
	instance_destroy();
