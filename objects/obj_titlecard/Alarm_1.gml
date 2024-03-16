/// @description noise heads
if obj_player1.ispeppino && !global.swapmode
	exit;

var _add_spot = function(x, y, scale)
{
	var q = 
	{
		x: x,
		y: y,
		scale: scale
	}

	trace("Adding noise head spot at: ", q);
	array_push(noisespots, q);
	return q;
}

noisespot_buffermax = 10;
if titlecard_sprite == spr_titlecardsecret
{
	// secrets of the world
	_add_spot(480, 340, 0.93);
	_add_spot(234, 262, 0.93);
	_add_spot(146, 414, 0.8);
	_add_spot(900, 154, 0.7);
	_add_spot(786, 360, 0.4);
	_add_spot(28, 432, 0.28);
	_add_spot(397, 155, 0.28);
	_add_spot(656, 167, 1.25);
}
else
{
	switch titlecard_index
	{
		case 0: // john gutter
			_add_spot(677, 408, 0.55);
			_add_spot(735, 325, 0.68);
			_add_spot(602, 293, 0.65);
			break;
		case 1: // pizzascape
			_add_spot(643, 331, 1);
			break;
		case 2: // ancient cheese
			_add_spot(435, 383, 0.48);
			_add_spot(588, 175, 0.75);
			break;
		case 3: // bloodsauce dungeon
			_add_spot(446, 341, 0.75);
			_add_spot(671, 257, 0.4);
			_add_spot(295, 327, 0.35);
			break;
		
		case 4: // oregano desert
			_add_spot(627, 246, 1.38);
			_add_spot(370, 77, 0.74);
			_add_spot(438, 434, 0.48);
			_add_spot(386, 330, 0.42);
			break;
		case 5: // wasteyard
			_add_spot(638, 31, 0.42);
			_add_spot(641, 275, 0.93);
			_add_spot(465, 158, 0.5);
			_add_spot(664, 142, 0.5);
			_add_spot(600, 134, 0.4);
			break;
		case 6: // fun farm
			_add_spot(427, 272, 1.25);
			_add_spot(460, 93, 0.96);
			_add_spot(634, 390, 0.4);
			_add_spot(662, 379, 0.4);
			_add_spot(601, 442, 0.4);
			_add_spot(641, 260, 0.4);
			_add_spot(736, 58, 0.4);
			_add_spot(305, 13, 0.4);
			break;
		case 7: // saloon
			_add_spot(392, 249, 0.55);
			_add_spot(484, 253, 0.55);
			_add_spot(589, 264, 0.55);
			_add_spot(504, 275, 0.96);
			break;
		
		case 8: // plage
			_add_spot(444, 274, 1.1);
			_add_spot(222, 201, 0.41);
			break;
		case 9: // gnome forest
			_add_spot(360, 266, 0.77);
			_add_spot(599, 299, 0.77);
			_add_spot(490, 271, 0.8);
			_add_spot(696, 402, 0.48);
			break;
		case 10: // deep dish 9
			_add_spot(546, 151, 0.77);
			_add_spot(138, 85, 0.77);
			_add_spot(728, 58, 0.77);
			break;
		case 11: // golf
			_add_spot(232, 106, 0.91);
			break;
		
		case 12: // pig city
			_add_spot(191, 375, 1.5);
			_add_spot(531, 159, 0.91);
			_add_spot(758, 313, 0.91);
			_add_spot(700, 150, 0.3);
			break;
		case 13: // oh shit
			_add_spot(522, 246, 1);
			_add_spot(179, 78, 1);
			_add_spot(245, 193, 0.65);
			_add_spot(712, 81, 0.65);
			break;
		case 16: // peppibot factory
			_add_spot(360, 314, 1.3);
			_add_spot(734, 172, 0.4);
			_add_spot(958, 76, 0.7);
			break;
		case 17: // freezerator
			_add_spot(300, 321, 0.75);
			_add_spot(421, 404, 0.75);
			_add_spot(712, 176, 1.1);
			break;
		
		case 18: // pizzascare
			_add_spot(303, 257, 1.17);
			_add_spot(685, 223, 1.3);
			_add_spot(588, 81, 0.35);
			_add_spot(469, 45, 0.35);
			_add_spot(43, 434, 0.35);
			_add_spot(681, 41, 0.5);
			break;
		case 19: // dont make a sound
			_add_spot(753, 371, 1.25);
			_add_spot(421, 236, 1.25);
			_add_spot(623, 100, 0.8);
			_add_spot(229, 85, 0.4);
			_add_spot(145, 134, 0.4);
			_add_spot(601, 381, 0.4);
			_add_spot(367, 70, 0.4);
			_add_spot(848, 98, 0.4);
			_add_spot(79, 35, 0.2);
			_add_spot(162, 23, 0.2);
			_add_spot(139, 292, 0.2);
			break;
		case 14: // war
			_add_spot(428, 289, 4);
			_add_spot(846, 304, 0.8);
			break;
		
		case 15: // ctop
			noisespot_buffermax = 2;
			for (var i = 0; i < 64; i++)
				_add_spot(irandom(960), irandom(540), random_range(0.25, 1.25));
			break
	}

}
for (i = 0; i < array_length(noisespots); i++)
{
	var spot = noisespots[i];
	var head = 
	{
		x: spot.x,
		y: spot.y,
		scale: spot.scale,
		visual_scale: 1,
		visible: false,
		image_index: irandom(sprite_get_number(spr_titlecard_noise) - 1)
	}

	trace("Adding noise head at: ", head);
	array_push(noisehead, head);
}
noisehead_pos = 0;
alarm[2] = 40;
