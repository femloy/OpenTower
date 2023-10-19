with (instance_create(0, 0, obj_pizzahead_whitefade))
{
	persistent = true;
	whitefade = 1.3;
	deccel = 0.005;
}
fmod_event_instance_set_parameter(snd, "state", 4, true);
fmod_event_one_shot("event:/sfx/pizzahead/finaleexplosion");
room = boss_pizzafacehub;
