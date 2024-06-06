var _x = x
var _y = y
if obj_player1.state == states.arenaintro
{
	var _sprite = spr_player_levelcomplete;
	if !ispeppino
		_sprite = spr_playerN_levelcomplete;
	image_speed = 0.35;
	if sprite_index != _sprite
	{
		sprite_index = _sprite;
		image_index = 0;
	}
	interp = 0.01;
	event_inherited();
	x = _x;
	y = _y;
	if !is_visible
	{
		is_visible = true;
		create_particle(x, y, particle.genericpoofeffect);
	}
	if floor(image_index) == image_number - 1
		image_index = image_number - 1;
	if sprite_index == spr_playerN_levelcomplete
	{
		var ix = floor(image_index);
		if ix == image_number - 1
			image_index = image_number - 1;
		var _step = false;
		var mv = 2;
		if ix >= 0 && ix < 12
		{
			x += image_xscale * mv
			_step = true;
		}
		else if ix >= 15 && ix < 27
		{
			x += -image_xscale * mv;
			_step = true;
		}
		if steppybuffer > 0
			steppybuffer--;
		else
		{
			steppybuffer = 10;
			if _step
				create_particle(x, y + 43, particle.cloudeffect, 0);
		}
	}
	exit;
}
if taunttimer > 0
{
	taunttimer--;
	image_speed = 0;
	interp = 0.01;
	event_inherited();
	x = _x;
	y = _y;
	exit;
}
var old_x = x;
event_inherited();

var _movespeed = abs(old_x - x);
var maxmovespeed = 8;
if _movespeed < floor(maxmovespeed) / 2
	image_speed = 0.35;
else if _movespeed > floor(maxmovespeed) / 2 && _movespeed < maxmovespeed
	image_speed = 0.45;
else
	image_speed = 0.6;

image_blend = obj_player1.image_blend;
image_xscale = obj_player1.xscale * obj_player1.scale_xs;
image_yscale = obj_player1.yscale * obj_player1.scale_ys;
following_moonwalk_fix();
visible = true;

usable = true;
if instance_exists(obj_titlecard)
	usable = false;
if !obj_player1.visible || room == rank_room
{
	visible = false;
	usable = false;
}
if instance_exists(obj_swapdeatheffect) || instance_exists(obj_noiseanimatroniceffect)
{
	visible = false;
	usable = false;
}
if place_meeting(x, y + 1, obj_solid) || (place_meeting(x, y + 1, obj_platform) && !place_meeting(x, y, obj_platform)) || place_meeting(x, y + 1, obj_slope)
{
	if x != xprevious
		sprite_index = spr_move;
	else
		sprite_index = spr_idle;
}
else if sprite_index != spr_air && (sprite_index != spr_playerN_doublejumpfall || ispeppino) && animatronic <= 0
{
	sprite_index = spr_air;
	image_index = 0;
}
if sprite_index == spr_playerN_doublejump && floor(image_index) == image_number - 1
	sprite_index = spr_playerN_doublejumpfall;
if animatronic > 0
{
	animatronic--;
	if ispeppino && animatronic == 0
	{
		with instance_create(x, y, obj_peshinodebris)
			image_index = 0;
		with instance_create(x, y, obj_peshinodebris)
			image_index = 1;
		with instance_create(x, y, obj_peshinodebris)
			image_index = 2;
	}
	usable = false;
	sprite_index = spr_animatronic;
}
if instance_exists(obj_pizzafaceboss_p3intro) || instance_exists(obj_pizzahead_finalecutsceneN)
{
	visible = false;
	usable = false;
}

var spr = noone;
switch obj_player1.sprite_index
{
	case obj_player1.spr_walkfront:
		spr = spr_walkfront;
		break;
	case obj_player1.spr_Timesup:
		spr = spr_Timesup;
		break;
	case obj_player1.spr_uppizzabox:
		spr = spr_uppizzabox;
		break;
	case obj_player1.spr_downpizzabox:
		spr = spr_downpizzabox;
		break;
	case obj_player1.spr_deathend:
		spr = spr_deathend;
		break;
	case spr_player_ratmountgameover:
		spr = spr_deathend;
		break;
}

if spr != noone
{
	usable = false;
	sprite_index = spr;
	image_index = obj_player1.image_index;
	image_speed = obj_player1.image_speed;
	x = obj_player1.x;
	if spr == spr_Timesup || spr == spr_walkfront || spr == spr_deathend
		x += round(xoffset * space);
	if floor(image_index) >= sprite_get_number(sprite_index) - 1
		image_index = sprite_get_number(sprite_index) - 1;
	y = obj_player1.y;
	if spr == spr_deathend
	{
		x += sign(space) * 40;
		y -= 10;
	}
}
if instance_exists(obj_backtohub_fadeout)
|| (obj_player1.state == states.backtohub && obj_player1.y < camera_get_view_y(view_camera[0]))
{
	visible = false;
	usable = false;
}
if instance_exists(obj_bosscontroller)
{
	if obj_player1.state == states.actor && obj_player1.sprite_index != spr_noise_duelend
	|| obj_player1.state == states.taxi || obj_player1.state == states.phase1hurt
	{
		is_visible = false;
		visible = false;
		usable = false;
		grabbuffer = 5;
	}
	else if !is_visible
	{
		is_visible = true;
		create_particle(x, y, particle.genericpoofeffect);
	}
}
if room == characterselect
	usable = false;
if obj_player1.state == states.duel || instance_exists(obj_vigilante_duelintro)
	usable = false;
if obj_player1.sprite_index == obj_player1.spr_fightball
{
	x = obj_player1.x;
	y = obj_player1.y;
	image_index = obj_player1.image_index;
	sprite_index = spr_fightball;
	usable = false;
}
if instance_exists(obj_swapmodegrab) || instance_exists(obj_swapplayergrabbable)
{
	grabbuffer = 40;
	visible = false;
	usable = false;
}
with obj_sausageman_dead
{
	if sprite_index == other.spr_dead
	{
		other.visible = false;
		other.usable = false;
	}
}
if obj_player1.key_slap_p2 && sprite_index != spr_fightball && usable && grabbuffer <= 0 && visible
&& !instance_exists(obj_swapmodegrab) && !instance_exists(obj_swapdeatheffect) && !instance_exists(obj_noiseanimatroniceffect) && !instance_exists(obj_swapplayergrabbable)
&& animatronic <= 0
{
	with instance_create(x, y, obj_swapmodegrab)
	{
		spr_palette = other.spr_palette;
		patterntexture = other.patterntexture;
		paletteselect = other.paletteselect;
		sprite_index = other.spr_suplexdash;
		spr_fall = other.spr_fall;
		ispeppino = other.ispeppino;
		isgustavo = other.isgustavo;
		if x != obj_player1.x
			image_xscale = sign(obj_player1.x - x);
		else
			image_xscale = other.image_xscale;
		particle_set_scale(particle.jumpdust, image_xscale, 1);
		create_particle(x, y, particle.jumpdust, 0);
	}
	usable = false;
}
if breakdance_pressed >= 10 && usable
{
	breakdance_speed = Approach(breakdance_speed, 0.6, 0.005);
	sprite_index = spr_breakdance;
	breakdance_index += breakdance_speed;
	image_index = breakdance_index;
	while breakdance_index >= sprite_get_number(spr_breakdance)
		breakdance_index -= sprite_get_number(spr_breakdance);
	if breakdance_speed > 0.5
	{
		notecreate--;
		if !instance_exists(obj_beatboxswap)
		{
			with instance_create(x, y, obj_beatboxswap)
				vsp = -11;
		}
	}
	if notecreate <= 0
	{
		instance_create(x + random_range(-70, 70), y + random_range(-70, 70), obj_notes);
		notecreate = 10;
	}
}
else
{
	breakdance_speed = 0.25;
	breakdance_index = 0;
}
if visible && usable && grabbuffer > 0
	grabbuffer--;
image_alpha = obj_player1.image_alpha;
