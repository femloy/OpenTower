if (state == states.grabbed && (object_index != obj_pepperman && object_index != obj_pizzafaceboss && object_index != obj_vigilanteboss && object_index != obj_pizzafaceboss_p3 && object_index != obj_noiseboss && object_index != obj_pf_fakepep))
	scr_enemy_grabbed();
else if state == states.lungeattack
	scr_enemy_lungeattack();
else if state == states.secret
	scr_enemy_secret();
if room == boss_pizzaface && state != states.pizzaheadjump
	use_collision = true;
scr_squash();
if state != states.stun && state != states.hit
	linethrown = false;
if state == states.stun && !thrown
	linethrown = false;
if (object_index != obj_vigilanteboss && object_index != obj_pizzafaceboss_p3 && object_index != obj_gustavograbbable && object_index != obj_noiseboss && object_index != obj_pizzafaceboss && object_index != obj_pepperman && object_index != obj_pf_fakepep && object_index != obj_fakepepboss && object_index != obj_pizzaball && (place_meeting(x + 1, y, obj_spike) || place_meeting(x - 1, y, obj_spike) || place_meeting(x, y + 1, obj_spike) || place_meeting(x, y - 1, obj_spike)))
{
	if elite
		elitehit = 0;
	instance_destroy();
}
if state != states.grabbed && state != states.pummel && object_index != obj_pepbat && object_index != obj_fakesanta && use_collision
	scr_collide();
if invtime > 0
	invtime--;
if stompbuffer > 0
	stompbuffer--;
if !thrown && killbyenemybuffer > 0
	killbyenemybuffer--;
if (sprite_index == walkspr && state != states.chase && floor(image_index) != image_number - 1)
	steppy = false;
if (sprite_index == walkspr && hsp != 0 && sign(hsp) == sign(image_xscale) && grounded && vsp > 0 && floor(image_index) == image_number - 1 && !steppy && object_index != obj_ghoul && state != states.chase)
{
	steppy = true;
	var _yy = y + 43;
	if (object_index == obj_pizzafaceboss_p2 || object_index == obj_pizzafaceboss_p3)
		_yy = y + 78;
	create_particle(x - (image_xscale * 20), _yy, particle.cloudeffect, 0);
}
if ((object_index != obj_pizzice || state != states.pizzagoblinthrow) && object_index != obj_pizzafaceboss_p3 && object_index != obj_fakepepboss && state != states.phase1hurt)
{
	if state == states.walk
		image_speed = 0.35;
	else if state != states.charge
		image_speed = 0.35;
}
if dodgebuffer > 0
	dodgebuffer--;
if object_index != obj_vigilanteboss && object_index != obj_pizzafaceboss_p3 && object_index != obj_gustavograbbable && object_index != obj_noiseboss && object_index != obj_pizzafaceboss && object_index != obj_pepperman && object_index != obj_pf_fakepep && object_index != obj_fakepepboss
{
	if (object_index != obj_bazookabaddie || !instance_exists(bazookaID))
	{
		var _taunted = false;
		with (instance_nearest(x, y, obj_player))
		{
			if state == states.backbreaker
			{
				_taunted = true;
				other.stunned = 0;
				if other.state != states.pizzagoblinthrow && !other.provoked && other.bombreset > 0
				{
					other.bombreset = 0;
					other.provoked = true;
				}
				other.scaredbuffer = 0;
			}
			else if other.state != states.pizzagoblinthrow
				other.provoked = false;
		}
		if !_taunted
		{
			with obj_swapmodefollow
			{
				if taunttimer > 0
				{
					other.stunned = 0;
					if other.state != states.pizzagoblinthrow && !other.provoked && other.bombreset > 0
					{
						other.bombreset = 0;
						other.provoked = true;
					}
					other.scaredbuffer = 0;
				}
			}
		}
	}
}
if state != states.pizzaheadjump && object_index != obj_pepperman && object_index != obj_noiseboss && object_index != obj_pizzafaceboss && object_index != obj_pf_fakepep && object_index != obj_fakepepboss && object_index != obj_vigilanteboss && object_index != obj_pizzafaceboss_p2 && object_index != obj_pizzafaceboss_p3 && object_index != obj_noisey && object_index != obj_gustavograbbable
{
	if (!instance_exists(obj_peddito))
	{
		if (y > (room_height + 100))
			instance_destroy();
		if (thrown && (x > (room_width + 100) || x < -100 || y < -100))
			instance_destroy();
		if (!thrown && (x > (room_width + 400) || x < -400 || y > (room_height + 400) || y < -400))
			instance_destroy(id, false);
	}
}
if state != states.hit
	player_instakillmove = false;
if (fmod_event_instance_is_playing(chargesnd) && state != states.charge)
	fmod_event_instance_stop(chargesnd);
