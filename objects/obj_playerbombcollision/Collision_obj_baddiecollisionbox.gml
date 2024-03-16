var baddie = other.baddieID
if (!instance_exists(baddie))
	exit;

if baddie.object_index == obj_gustavograbbable
	exit;
if baddie.object_index == obj_fakepepboss && baddie.state == states.deformed
	exit;

if baddie.object_index == obj_pepperman
{
	with baddie
	{
		if wastedhits == 9 && phase == 1 && !pizzahead && state == states.contemplate
		{
			with (instance_create(other.x, other.y, obj_explosioneffect))
				sprite_index = spr_bombexplosion;
			scr_boss_do_hurt_phase2(obj_player1);
			if x != other.x
				image_xscale = sign(other.x - x);
			instance_destroy(other.bombID, false);
			instance_destroy(other);
			exit;
		}
		else if state == states.mini && ministate != states.transition
		{
			with (instance_create(other.x, other.y, obj_explosioneffect))
				sprite_index = spr_bombexplosion;
			instance_destroy(other.bombID, false);
			instance_destroy(other);
			with obj_camera
			{
				shake_mag = 3;
				shake_mag_acc = 5 / room_speed;
			}
			var lay1 = layer_get_id("Backgrounds_scroll");
			var lay2 = layer_get_id("Backgrounds_2");
			var lay3 = layer_get_id("Backgrounds_1");
			layer_set_visible(lay3, true);
			var bg1 = layer_background_get_id(lay1);
			var bg2 = layer_background_get_id(lay2);
			layer_background_change(bg1, bg_peppermanbosscloud1);
			layer_background_change(bg2, bg_peppermanboss1);
			layer_hspeed(lay1, 1);
			obj_bosscontroller.alarm[1] = 5;
			scr_sleep(25);
			instance_destroy(obj_peppermanartdude);
			instance_destroy(obj_peppermanbowlingball);
			instance_destroy(obj_peppermanbowlingballspawner);
			instance_destroy(obj_peppermanGIANTbowlingball);
			destroyable = true;
			spr_dead = spr_pepperman_minifall;
			instance_destroy();
			exit;
		}
	}
}

if (baddie.object_index == obj_vigilanteboss && (baddie.state == states.hit || (baddie.state == states.mach2 && (!baddie.kick)) || baddie.flickertime > 0 || baddie.reposition))
	exit;

if (baddie.object_index == obj_noiseboss && (baddie.state == states.walk || baddie.state == states.droptrap) && baddie.droptrap)
{
	with bombID
		deadbuffer--;
	exit;
}
if baddie.object_index == obj_pizzafaceboss && baddie.state == states.pizzaface_ram && baddie.substate == states.land && baddie.elitehit == 1
{
	with bombID
	{
		deadbuffer = 100;
		array_push(baddie_arr, [baddie.id, obj_baddie]);
		instance_destroy();
	}
	exit;
}
if ((!baddie.invincible) || baddie.object_index == obj_vigilanteboss || baddie.object_index == obj_fakepepboss || baddie.object_index == obj_pizzafaceboss_p2)
{
	with bombID
	{
		deadbuffer = 100;
		array_push(baddie_arr, [baddie.id, obj_baddie]);
		instance_destroy();
	}
}
else if ((baddie.object_index != obj_pizzafaceboss || ((baddie.state != states.pizzaface_ram || baddie.substate != states.jump) && baddie.state != states.walk)) && (baddie.object_index != obj_pepperman || baddie.state != states.mini))
{
	with bombID
		deadbuffer--;
}
