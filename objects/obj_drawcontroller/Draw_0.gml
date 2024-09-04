draw_set_color(c_black);
if room != editor_room
{
	draw_rectangle(0, -50, -50, room_height + 50, false);
	draw_rectangle(room_width, -50, room_width + 50, room_height + 50, false);
	draw_rectangle(0, 0, room_width, -50, false);
	draw_rectangle(0, room_height, room_width, room_height + 50, false);
}
draw_set_color(c_white);
draw_set_color(c_white);
if use_dark
{
	for (var i = 0; i < array_length(objdark_arr); i++)
	{
		with objdark_arr[i]
		{
			if visible
			{
				var b = get_dark(image_blend, other.use_dark);
				if object_index != obj_swapmodegrab && other.objdark_arr[i] != obj_swapplayergrabbable && object_index != obj_swapmodefollow && object_index != obj_swapdeatheffect
				{
					var ix = image_xscale;
					if object_index == obj_vigilantecow
						ix = xscale;
					draw_sprite_ext(sprite_index, image_index, x, y, ix, image_yscale, image_angle, b, image_alpha);
				}
				else
				{
					var blend = image_blend;
					image_blend = b;
					event_perform(ev_draw, ev_draw_normal);
					image_blend = blend;
				}
			}
		}
	}
}
if (obj_player1.finisher || obj_player2.finisher || (obj_player.state == states.playersuperattack && obj_player.superattackstate == states.transition))
	finisher_alpha = Approach(finisher_alpha, 0.3, 0.1);
else if finisher_alpha > 0
	finisher_alpha = Approach(finisher_alpha, 0, 0.02);
if finisher_alpha > 0
{
	draw_set_alpha(finisher_alpha);
	draw_rectangle_color(-32, -32, room_width + 32, room_height + 32, 0, 0, 0, 0, false);
	draw_set_alpha(1);
}
var _kungfu = global.kungfu;
with obj_baddie
{
	if object_index != obj_pizzafaceboss
		draw_enemy(_kungfu, true);
}
shader_set(global.Pal_Shader);
with obj_heatafterimage
{
	if visible
	{
		pattern_set(global.Base_Pattern_Color, obj_player1.sprite_index, obj_player1.image_index, obj_player1.xscale, obj_player1.yscale, global.palettetexture);
		pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
		draw_sprite_ext(obj_player1.sprite_index, obj_player1.image_index, x, y, obj_player1.xscale, obj_player1.yscale, obj_player1.angle, c_white, alpha);
		pattern_reset();
	}
}
if room == boss_fakepep
{
	with obj_fakepepclone
	{
		if visible && !flash
		{
			var palinfo = get_pep_palette_info();
			pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, palinfo.patterntexture);
			var ps = palinfo.paletteselect;
			pal_swap_set(spr_peppalette, ps, false);
			draw_self();
			pal_swap_set(spr_peppalette, 13, false);
			draw_self();
			pattern_reset();
			draw_self();
		}
	}
}
shader_set(shd_hit);
with obj_baddie
{
	var _stun = 0;
	if state == states.stun && object_index != obj_pizzaball
		_stun = 25;
	if (visible && flash && bbox_in_camera(view_camera[0], 32))
		draw_sprite_ext(sprite_index, image_index, x, y + _stun, xscale * image_xscale, yscale, angle, image_blend, image_alpha);
}
if room == boss_fakepep
{
	with obj_fakepepclone
	{
		if visible && flash
			draw_self();
	}
}
with obj_deadjohnparent
{
	if (visible && flash && bbox_in_camera(view_camera[0], 32))
		draw_sprite_ext(sprite_index, image_index, x + hurtx, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
with obj_smallnumber
{
	if visible && flash
	{
		draw_set_font(global.smallnumber_fnt);
		draw_set_halign(fa_center);
		draw_text(x, y, number);
	}
}
for (i = 0; i < array_length(flash_arr); i++)
{
	with flash_arr[i]
	{
		if visible && flash
			event_perform(ev_draw, ev_draw_normal);
	}
}
shader_set(global.Pal_Shader);
pal_swap_set(spr_peppalette, 0, false);
with obj_pizzagoblinbomb
{
	if grabbable && grounded && vsp > 0
		draw_sprite(spr_grabicon, -1, x - 10, y - 30);
	draw_self();
}
with obj_player1
{
	if (!other.hungrypillarflash && visible && state != states.titlescreen && bbox_in_camera(view_camera[0], 32))
		draw_player();
}
pattern_set_solid(true);
with obj_noiseeffect
{
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
	pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	pattern_reset();
}
with obj_noisedebris
{
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
	pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	pattern_reset();
}
pattern_set_solid(false);
for (i = 0; i < array_length(particles); i++)
{
	with particles[i]
		draw_sprite(sprite_index, image_index, x, y);
}
with obj_sausageman_dead
{
	if !gui && visible
	{
		b = get_dark(image_blend, other.use_dark);
		if oldpalettetexture != -4
			pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, oldpalettetexture);
		pal_swap_set(spr_palette, paletteselect, false);
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, b, image_alpha);
		if oldpalettetexture != -4
			pattern_reset();
	}
}
shader_set(shd_hit);
with obj_player
{
	if (visible && flash && bbox_in_camera(view_camera[0], 32))
		draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
}
shader_reset();
if room == boss_pizzaface
{
	// pretty much a transparent white flash applied on top
	shader_set(shd_supernoise);
	with obj_player1
	{
		if (sprite_index == spr_playerN_phase3intro2 || sprite_index == spr_playerN_phase3intro2 || instance_exists(obj_pizzaface_thunderdark))
		{
			if image_alpha > 0 && !ispeppino
				draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, supernoisefade);
		}
	}
	shader_reset();
}
