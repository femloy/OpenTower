playerx = Approach(playerx, dest_x, speedx);
playery = Approach(playery, dest_y, speedy);
playerindex += 0.35;

if buffer > 0
	buffer--;
if abs(playerx - dest_x) <= 2 && abs(playery - dest_y) <= 2 && buffer <= 0
{
	scr_pause_activate_objects(false);
	instance_activate_object(obj_pause);
	
	if !taunt
	{
		with instance_create(dest_x + camera_get_view_x(view_camera[0]), dest_y + camera_get_view_y(view_camera[0]), obj_swapdeatheffect)
		{
			image_xscale = other.image_xscale;
			image_index = 0;
			ispeppino = other.ispeppino;
			isgustavo = other.isgustavo;
			
			if !other.ispeppino
			{
				hsp = -image_xscale * 8;
				vsp = -15;
				sprite_index = spr_player_outofpizza1;
				if other.noisecrusher
					sprite_index = spr_player_ratmounthurt;
			}
			else
			{
				hsp = -image_xscale * 2;
				vsp = -8;
				sprite_index = spr_playerN_bossdeath1;
			}
		}
		with obj_player1
			event_perform(ev_step, ev_step_end);
		instance_destroy();
	}
	else
		alarm[0] = 1;
}
