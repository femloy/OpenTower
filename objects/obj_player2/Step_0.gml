if room == rm_editor
{
	visible = 0;
	exit;
}
visible = false;
x = -10000;
y = -10000;
scr_getinput2();
if !global.coop
{
	obj_player1.spotlight = true;
	x = -1000;
	y = -1000;
	state = states.titlescreen;
	if (instance_exists(obj_coopflag))
		instance_destroy(obj_coopflag);
	if (instance_exists(obj_cooppointer))
		instance_destroy(obj_cooppointer);
}
else if key_start && !fightball && obj_player1.state != states.mach3 && obj_player1.state != states.grabbed
	state = states.gotoplayer;
if !visible && state == states.comingoutdoor
{
	coopdelay++;
	image_index = 0;
	if coopdelay == 50
	{
		visible = true;
		coopdelay = 0;
	}
}
