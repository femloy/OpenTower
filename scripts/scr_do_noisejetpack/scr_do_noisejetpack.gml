function scr_do_noisejetpack()
{
	if (global.noisejetpack && !grounded && key_jump && walljumpbuffer <= 0)
	{
		input_buffer_jump = 0;
		trace("noisejetpack");
		state = states.noisejetpack;
		sprite_index = spr_playerN_doublejump;
		image_index = 0;
		vsp = -11;
	}
}
