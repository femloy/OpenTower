image_xscale = playerid.xscale;
if playerid.state != states.rocket && playerid.gusdashpadbuffer <= 0 && playerid.state != states.mach3 && playerid.ratmount_movespeed < 12 && playerid.state != states.crouchslide && playerid.state != states.shoulderbash
	instance_destroy();
x = playerid.x + (((playerid.sprite_index == spr_player_Sjumpcancel) ? 20 : 0) * playerid.xscale);
y = playerid.y - (playerid.character == "M" ? 10 : 0);
if playerid.state == states.rocket
	x = playerid.x + (playerid.xscale * 18);
if playerid.state == states.ratmount
	x = playerid.x + (playerid.xscale * 18);
if playerid.sprite_index == playerid.spr_fightball
	x = playerid.x + (playerid.xscale * 18);
visible = !(room == rank_room);
if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
	visible = false;
if playerid.sprite_index == playerid.spr_rocketstart
	visible = false;
