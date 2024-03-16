var _transfo = false;
var _state = other.state;
with other
{
	if (!scr_transformationcheck() && state != states.comingoutdoor && state != states.door)
	{
		if state == states.ghost
			notification_push(notifs.priest_ghost, [ghosttimer, room]);
		if (state == states.mort || state == states.mortjump || state == states.morthook || state == states.mortattack || state == states.mortjump || state == states.boxxedpep || state == states.boxxedpepjump || state == states.boxxedpepspin || state == states.ghost || state == states.barrelslide || state == states.barrel || state == states.barreljump)
		{
			if hsp != 0
				xscale = sign(hsp);
			movespeed = abs(hsp);
		}
		with obj_mortprojectile
		{
			create_particle(x, y, particle.genericpoofeffect);
			instance_destroy();
		}
		transformationsnd = false;
		state = states.normal;
		sprite_index = spr_idle;
		dir = xscale;
		ghostdash = false;
		ghostpepper = 0;
		_transfo = true;
		instance_create(x, y, obj_genericpoofeffect);
	}
}
if _transfo
{
	fmod_event_one_shot("event:/sfx/pep/pray");
	var p = other.id;
	with (instance_create(other.x - 540, camera_get_view_y(view_camera[0]) - 100, obj_priestangel))
	{
		priestID = other.id;
		playerid = p;
	}
	with other
	{
		if (state == states.mort || state == states.morthook || state == states.mortjump || state == states.mortattack)
			create_debris(x, y - 40, spr_mortdead);
	}
	if sprite_index != spr_angelpriest
		sprite_index = spr_priest_pray;
	if (collect && ds_list_find_index(global.saveroom, id) == -1)
	{
		notification_push(notifs.priest_collect, [room, id, _state]);
		ds_list_add(global.saveroom, id);
		var val = 500;
		global.collect += val;
		global.combotime = 60;
		with (instance_create(x + 16, y, obj_smallnumber))
			number = string(val);
		scr_sound_multiple("event:/sfx/misc/collect", x, y);
		if escape
			ds_list_add(global.escaperoom, id);
		var d = round(val / 16);
		for (var i = 0; i < val; i += d)
			create_collect(other.x + irandom_range(-60, 60), other.y + irandom_range(-60, 60), choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect), d);
	}
}
