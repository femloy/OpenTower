function scr_switchgustavo()
{
    with (obj_player1)
    {
        visible = true
        ratmount_movespeed = 8
        gustavodash = 0
        isgustavo = 1
        state = states.ratmount
        jumpAnim = 0
        sprite_index = spr_player_ratmountidle
        brick = 1
        fmod_event_instance_release(snd_voiceok)
        snd_voiceok = fmod_event_create_instance("event:/sfx/voice/gusok")
    }
}

function scr_switchpeppino()
{
    with (obj_player1)
    {
        visible = true
        gustavodash = 0
        ratmount_movespeed = 8
        isgustavo = 0
        state = states.normal
        jumpAnim = 0
        sprite_index = spr_player_idle
        brick = 0
        fmod_event_instance_release(snd_voiceok)
        snd_voiceok = fmod_event_create_instance("event:/sfx/voice/ok")
    }
}
