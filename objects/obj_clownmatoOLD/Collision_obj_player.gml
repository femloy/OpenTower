if (other.cutscene || other.state == states.firemouth)
	exit;
with (other)
{
	vsp = -18;
	sprite_index = spr_machfreefall;
	jumpstop = true;
	state = states.jump;
}
sprite_index = spr_clownmato_bounce;
image_index = 0;
