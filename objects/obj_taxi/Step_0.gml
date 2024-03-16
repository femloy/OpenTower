if police_buffer > 0
	police_buffer--;
else
	x += hsp;
if hsp != 0 && police_buffer <= 0
{
	dust += 1;
	if dust == 40
	{
		dust = 0;
		create_particle(x, y + 43, particle.cloudeffect);
	}
}
if (place_meeting(x, y, obj_doorA))
	targetDoor = "A";
if (place_meeting(x, y, obj_doorB))
	targetDoor = "B";
if (place_meeting(x, y, obj_doorC))
	targetDoor = "C";
if (place_meeting(x, y, obj_doorD))
	targetDoor = "D";
if (place_meeting(x, y, obj_doorE))
	targetDoor = "E";
if (place_meeting(x, y, obj_doorF))
	targetDoor = "F";
if (place_meeting(x, y, obj_doorG))
	targetDoor = "G";
