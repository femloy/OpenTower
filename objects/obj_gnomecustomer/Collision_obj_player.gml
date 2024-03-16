if other.state == states.gotoplayer
	exit;
if (!instance_exists(obj_deliverytimer) && obj_player1.ispeppino && !global.swapmode)
	exit;
if (ds_list_find_index(global.saveroom, id) == -1)
{
	other.vsp = 10;
	var xx = x + (customer_x * image_xscale);
	var yy = y + (customer_y * image_yscale);
	var player = other.id;
	var door = id;
	global.heattime = 60;
	xscale = sign(image_xscale);
	if other.ispeppino && !global.swapmode
	{
		if (!instance_exists(obj_cutscene_handler))
		{
			var _xscale = player.xscale;
			if player.x != x
				_xscale = sign(x - player.x);
			instance_destroy(obj_deliverytimer);
			instance_destroy(obj_deliveryfollower);
			with (instance_create(xx + (72 * image_xscale), yy, obj_deliveryfolloweranim))
				sprite_index = spr_gnomepizza_idle;
			with (instance_create(0, 0, obj_cutscene_handler))
			{
				var door_xscale = -sign(door.image_xscale * 16);
				depth = other.depth - 1;
				scene_info = [
					[cutscene_customer_check, door.gnome_id, player, door],
					[cutscene_customer_start, player],
					[cutscene_customer_create, xx, yy, other.spr_idle, other.spr_happy, -door_xscale],
					[cutscene_customer_end, player]
				];
			}
		}
	}
	else
	{
		var t = other.id;
		fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
		notification_push(notifs.baddie_kill, [room, id, object_index]);
		ds_list_add(global.saveroom, id);
		global.combotime = 60;
		global.combo += 2;
		instance_create(x, y, obj_bangeffect);
		instance_create(x, y, obj_genericpoofeffect);
		with (instance_create(x, y, obj_sausageman_dead))
		{
			image_xscale = -t.xscale;
			sprite_index = other.sprite_index;
			hsp = t.xscale * 10;
		}
		with (instance_create(x, y, obj_sausageman_dead))
		{
			image_xscale = -t.xscale;
			sprite_index = other.spr_idle;
			hsp = t.xscale * 10;
			depth = -14;
		}
		with (instance_create(player.x, player.y, obj_pizzaboxunopen))
		{
			content = other.content;
			depth = player.depth;
			visible = false;
		}
		instance_destroy();
	}
}
