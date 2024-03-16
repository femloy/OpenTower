if state == states.stun && hp == 0 && stunned > 40 && slapped == 0
{
	slapped = true;
	instance_create(x + (obj_player.xscale * 40), y, obj_punchdust);
	state = states.grabbed;
	obj_player.state = states.grab;
	instance_destroy(other);
}
if (hp == 0 && !(state == states.stun && stunned > 40) && state != states.grabbed && slapped == 0)
{
	instance_create(x, y, obj_spikehurteffect);
	other.image_xscale = image_xscale;
	slapped = true;
	flash = true;
	instance_create(x, y, obj_bumpeffect);
	stunned = 200;
	if other.x != x
		image_xscale = -sign(x - other.x);
	vsp = -5;
	hsp = -image_xscale * 3;
	state = states.stun;
}
else if state != states.grabbed && slapped == 0
{
	if hp > 0
		hp -= 1;
	if slapped == 0
		instance_create(x, y, obj_slapstar);
	with (instance_create(x, y, obj_spikehurteffect))
		other.image_xscale = image_xscale;
	slapped = true;
	state = states.stun;
	stunned = 40;
	if other.x != x
		image_xscale = -sign(x - other.x);
	vsp = -3;
	hsp = -image_xscale * 2;
}
