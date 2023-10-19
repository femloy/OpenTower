if (global.panic)
{
	instance_destroy();
	exit;
}
switch (room)
{
	case tower_1:
		scr_add_grannypizzalevel("entrance", 0);
		scr_add_grannypizzalevel("medieval", 1);
		scr_add_grannypizzalevel("ruin", 2);
		scr_add_grannypizzalevel("dungeon", 3);
		scr_add_grannypizzaboss("w1stick", "b_pepperman", 4);
		break;
	case tower_2:
		scr_add_grannypizzalevel("badland", 5);
		scr_add_grannypizzalevel("graveyard", 6);
		scr_add_grannypizzalevel("farm", 7);
		scr_add_grannypizzalevel("saloon", 8);
		scr_add_grannypizzaboss("w2stick", "b_vigilante", 9);
		break;
	case tower_3:
		scr_add_grannypizzalevel("plage", 10);
		scr_add_grannypizzalevel("forest", 11);
		scr_add_grannypizzalevel("space", 12);
		scr_add_grannypizzalevel("minigolf", 13);
		scr_add_grannypizzaboss("w3stick", "b_noise", 14);
		break;
	case tower_4:
		scr_add_grannypizzalevel("street", 17);
		scr_add_grannypizzalevel("industrial", 16);
		scr_add_grannypizzalevel("sewer", 15);
		scr_add_grannypizzalevel("freezer", 18);
		scr_add_grannypizzaboss("w4stick", "b_fakepep", 19);
		break;
	case tower_5:
		scr_add_grannypizzalevel("chateau", 20);
		scr_add_grannypizzalevel("kidsparty", 21);
		scr_add_grannypizzalevel("war", 22);
		if (quick_ini_read_string("", "Game", "finalrank", "none") != "none")
			scr_add_grannypizzalevel("exit", 23, false, false, false, true);
		break;
}
level_xpad = (sprite_get_width(spr_tutorialbubble) * text_xscale) / (array_length(levelarray) + 1);
