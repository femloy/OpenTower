hsp = 0;
vsp = 0;
hsp_carry = 0;
vsp_carry = 0;
grav = 0.5;
platformid = -4;
image_speed = 0.35;
introstate = 0;
introbuffer = 0;
peppermanid = -4;
prop = 0;
proparr = [
	[spr_pepperman_scared, spr_pepperman_sour, spr_pepperman_mask, -7],
	[spr_playerV_hurt, spr_playerV_angryidle, spr_player_mask, -6],
	[spr_playerN_hurt, spr_playerN_panicidle, spr_player_mask, -5],
	[spr_fakepeppino_stun, spr_fakepeppino_intro3loop, spr_player_mask, -4]
];
with (obj_music)
{
	if (music != noone)
		fmod_event_instance_set_parameter(music.event, "state", 2, false);
}
if (room == rm_testing4)
{
	with (obj_player)
		state = states.actor;
}
instance_destroy(obj_superattackeffect);
instance_destroy(obj_blackoutline);
warbg_stop();
steppysnd = false;
snd_spin = fmod_event_create_instance("event:/sfx/pizzahead/spin");
snd_laugh = fmod_event_create_instance("event:/sfx/voice/pizzahead");
