var j = 0;
var m = menus[menu];

if instance_exists(obj_keyconfig)
	j = 4;
if m.menu_id >= menus.controls && m.menu_id <= menus.unused_3
	j = 4;
else if m.menu_id >= menus.video && m.menu_id <= menus.unused_1
	j = 2;
else if m.menu_id == menus.audio
	j = 1;
else if m.menu_id == menus.game
	j = 3;

for (var i = 0; i < array_length(bg_alpha); i++)
{
	if i == j
		bg_alpha[i] = Approach(bg_alpha[i], 1, 0.1);
	else
		bg_alpha[i] = Approach(bg_alpha[i], 0, 0.05);
}

bg_x -= 1;
bg_y -= 1;

if (instance_exists(obj_keyconfig) || instance_exists(obj_screenconfirm))
	exit;

scr_menu_getinput();
if backbuffer > 0
{
	backbuffer--;
	key_jump = false;
	key_back = false;
}

var move = key_down2 - key_up2;
if move != 0
{
	slidebuffer = 0;
	slidecount = 0;
}

var os = optionselected;
optionselected += move;
optionselected = clamp(optionselected, 0, array_length(m.options) - 1);
if os != optionselected
	fmod_event_one_shot("event:/sfx/ui/step");

var option = m.options[optionselected];
var move2 = key_left2 + key_right2;

switch option.type
{
	case menutype.press:
		if key_jump && option.func != -4
		{
			fmod_event_one_shot("event:/sfx/ui/select");
			option.func();
		}
		break;
	
	case menutype.toggle:
		if (key_jump || -key_left2 || key_right2)
		{
			fmod_event_one_shot("event:/sfx/ui/select");
			option.value = !option.value;
			if option.on_changed != -4
				option.on_changed(option.value);
		}
		break;
	
	case menutype.multiple:
		option.value += move2;
		if option.value > array_length(option.values) - 1
			option.value = 0;
		if option.value < 0
			option.value = array_length(option.values) - 1;
		if move2 != 0
		{
			fmod_event_one_shot("event:/sfx/ui/step");
			if option.on_changed != -4
				option.on_changed(option.values[option.value].value);
		}
		break;
	
	case menutype.slide:
		move2 = key_left + key_right;
		if move2 != 0 && slidebuffer <= 0
		{
			option.moved = true;
			option.value += move2;
			option.value = clamp(option.value, 0, 100);
			slidebuffer = 1;
		}
		if move2 != 0
			option.moving = true;
		if move2 == 0
		{
			slidecount = 0;
			option.moving = false;
		}
		break;
}
for (i = 0; i < array_length(m.options); i++)
{
	var b = m.options[i];
	if b.type == menutype.slide
	{
		if (b.moved && (move2 == 0 || optionselected != i))
		{
			b.moved = false;
			b.moving = false;
			if b.on_changed != -4
				b.on_changed(b.value);
		}
		if b.on_move != -4 && b.moving
			b.on_move(b.value);
		if b.sound != -4
		{
			if b.moving
			{
				if (!fmod_event_instance_is_playing(b.sound))
					fmod_event_instance_play(b.sound);
			}
			else
				fmod_event_instance_stop(b.sound, true);
		}
	}
}

if menu == menus.options
	scr_pauseicons_update(optionselected);
else
	scr_pauseicons_update(-1);

if slidebuffer > 0
	slidebuffer--;

if ((key_back || key_slap2 || keyboard_check_pressed(vk_escape)) && !instance_exists(obj_keyconfig) && !instance_exists(obj_audioconfig))
{
	fmod_event_one_shot("event:/sfx/ui/back");
	if menu == menus.options
	{
		if (instance_exists(obj_mainmenuselect))
			obj_mainmenuselect.selected = false;
		if (instance_exists(obj_mainmenu))
			obj_mainmenu.optionbuffer = 2;
		instance_destroy();
	}
	else
	{
		for (i = 0; i < array_length(m.options); i++)
		{
			b = m.options[i];
			if b.type == menutype.slide
			{
				if b.sound != -4
					fmod_event_instance_stop(b.sound, true);
			}
		}
		menu_goto(m.backmenu);
	}
}
