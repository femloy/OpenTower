if object_index == other.object_index && image_xscale == other.image_xscale && hsp != 0 && other.hsp != 0 && id < other.id && state != states.grabbed && state != states.stun && state != states.turn && other.state != states.turn && other.state != states.grabbed && other.state != states.stun
	hsp = -other.image_xscale;
