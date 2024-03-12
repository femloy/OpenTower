function scr_switchgustavo(peppino = true, skip_gloves = false)
{
    with (obj_player1)
    {
		if ispeppino
		{
	        ratmount_movespeed = 8;
	        gustavodash = 0;
	        isgustavo = true;
			if peppino
			{
				visible = true;
		        state = states.ratmount;
				sprite_index = spr_player_ratmountidle;
		        jumpAnim = false;
			}
	        brick = true;
	        fmod_event_instance_release(snd_voiceok);
	        snd_voiceok = fmod_event_create_instance("event:/sfx/voice/gusok");
		}
		else
        {
            isgustavo = false;
            noisecrusher = true;
            if peppino
            {
                visible = true;
                jumpAnim = false;
                state = states.normal;
                sprite_index = spr_idle;
                if (room == street_jail && !skip_gloves)
                {
                    actor_buffer = 40;
                    sprite_index = spr_playerN_glovesstart;
                    image_index = 0;
                    state = states.animation;
                }
            }
        }
    }
	with (obj_swapmodefollow)
    {
        isgustavo = true;
        self.get_character_spr();
    }
}

function scr_switchpeppino(peppino = true)
{
    with (obj_player1)
    {
        if ispeppino
        {
            gustavodash = 0;
            ratmount_movespeed = 8;
            isgustavo = false;
            brick = false;
            fmod_event_instance_release(snd_voiceok);
            snd_voiceok = fmod_event_create_instance("event:/sfx/voice/ok");
            if peppino
            {
                visible = true;
                state = states.normal;
                jumpAnim = false;
                sprite_index = spr_player_idle;
            }
        }
        else
        {
            isgustavo = false;
            noisecrusher = false;
            if peppino
            {
                jumpAnim = false;
                sprite_index = spr_idle;
                visible = true;
                state = states.normal;
            }
        }
    }
    with (obj_swapmodefollow)
    {
        isgustavo = false;
        self.get_character_spr();
    }
}
