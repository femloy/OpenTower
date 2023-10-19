if (state == states.golf)
	exit;
x = other.x;
kicked = false;
hsp = 0;
movespeed = 0;
slopespeed = 0;
vsp = -22;
thrown = true;
with (obj_camera)
{
	follow_golf = true;
	targetgolf = other.id;
}
