ds_list_destroy(baddielist);
if (state == states.victory || state == states.transition)
	event_perform(ev_destroy, 0);
