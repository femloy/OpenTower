collisioned = false;
dmg = 30;
parryable = false;
parried = false;
team = 1;

function SUPER_player_hurt(damage, player)
{
	if !collisioned && player.state != states.arenaround
	{
		if (instance_exists(obj_bosscontroller))
			obj_bosscontroller.player_hp -= damage;
		collisioned = true;
		with player
		{
			var lag = 8;
			if (state == states.chainsaw || state == states.hit)
			{
				x = hitX;
				y = hitY;
			}
			hitLag = lag;
			hitX = x;
			hitY = y;
			xscale = (x != other.x) ? sign(other.x - x) : other.image_xscale;
			hitxscale = (x != other.x) ? sign(other.x - x) : other.image_xscale;
			sprite_index = spr_hurt;
			hithsp = 15;
			hitstunned = 100;
			hitvsp = -8;
			state = states.hit;
			instance_create(other.x, other.y, obj_parryeffect);
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_baddiegibs);
			instance_create(x, y, obj_baddiegibs);
			with obj_camera
			{
				shake_mag = 3;
				shake_mag_acc = 3 / room_speed;
			}
		}
	}
}
function SUPER_parry()
{
	if !parried
	{
		team = 0;
		parried = true;
	}
}
function SUPER_boss_hurt(player)
{
	if !collisioned && team != player.team
	{
		with player
			boss_hurt_noplayer(other.dmg);
		collisioned = true;
	}
}
function boss_hurt(player)
{
	SUPER_boss_hurt(player);
}
function parry()
{
	SUPER_parry();
}
function player_hurt(damage, player)
{
	SUPER_player_hurt(damage, player);
}
