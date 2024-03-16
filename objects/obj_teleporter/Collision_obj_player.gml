if player < 0
{
	if start == 1
	{
		if other.state != states.teleport && other.state != states.backbreaker && other.state != states.chainsaw && other.state != states.hit && other.state != states.gotoplayer
		{
			fmod_event_one_shot_3d("event:/sfx/misc/teleporterstart", x, y);
			player = other.id;
			player.visible = false;
			storedstate = player.state;
			player.tauntstoredstate = player.state;
			storedmovespeed = player.movespeed;
			storedgrav = player.grav;
			storedimageindex = player.image_index;
			storedspriteindex = player.sprite_index;
			storedfreefallsmash = player.freefallsmash;
			repeat 8
				create_particle(x + random_range(50, -50), y + random_range(50, -50), particle.teleporteffect, 0);
			alarm[0] = 25;
			player.hsp = 0;
			player.vsp = 0;
			player.movespeed = 0;
			player.grav = 0;
			player.alarm[8] = 100;
			player.alarm[7] = 50;
			player.alarm[5] = 2;
			player.hurted = true;
			player.state = states.teleport;
			with (instance_create(player.x, player.y, obj_parryeffect))
				sprite_index = spr_peppinoteleporteffect;
		}
	}
}
