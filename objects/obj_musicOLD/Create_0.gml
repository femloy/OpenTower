pausedmusic = 0;
fadeoff = 0;
global.music = 0;
roomname = obj_null;
arena = false;
global.mu = -4;
music = -4;
secretmusic = -4;
musicID = -4;
secretmusicID = -4;
pillarmusicID = -4;
secret = false;
secretend = false;
pillar_on_camera = false;
prevpillar_on_camera = false;
room_arr = [
	[rm_levelselect, mu_title, mu_medievalsecret, false],
	[entrance_1, mu_entrance, mu_medievalsecret, false],
	[dungeon_1, mu_dungeon, mu_dungeonsecret, false],
	[dungeon_8, mu_dungeon, mu_dungeonsecret, true],
	[dungeon_9, mu_dungeondepth, mu_dungeonsecret, true],
	[strongcold_1, mu_chateau, mu_medievalsecret, false],
	[strongcold_2, mu_strongcold, mu_medievalsecret, false],
	[strongcold_9, mu_dungeondepth, mu_medievalsecret, false],
	[medieval_1, mu_medievalentrance, mu_medievalsecret, false],
	[medieval_2, mu_medievalentrance, mu_medievalsecret, true],
	[medieval_3, mu_medievalremix, mu_medievalsecret, true],
	[medieval_5, mu_medievalremix, mu_medievalsecret, true],
	[medieval_6, mu_medieval, mu_medievalsecret, true],
	[ruin_1, mu_ruin, mu_ruinsecret, false],
	[ruin_6, mu_ruin, mu_ruinsecret, true],
	[ruin_7, mu_ruinremix, mu_ruinsecret, true],
	[badland_1, mu_desert, mu_desertsecret, false],
	[badland_8, mu_desert, mu_desertsecret, true],
	[badland_9, mu_ufo, mu_desertsecret, true],
	[badland_mart4, mu_ufo, mu_desertsecret, true],
	[badland_10, mu_desert, mu_desertsecret, true],
	[forest_1, mu_forest, mu_medievalsecret, false],
	[forest_G1, mu_forest, mu_medievalsecret, true],
	[forest_G1b, mu_gustavo, mu_medievalsecret, false],
	[forest_5, mu_forest, mu_medievalsecret, true],
	[chateau_1, mu_chateau, mu_medievalsecret, false],
	[sewer_1, mu_sewer, mu_medievalsecret, false],
	[freezer_1, mu_freezer, mu_medievalsecret, false],
	[kidsparty_1, mu_kidsparty, mu_medievalsecret, false],
	[minigolf_1, mu_minigolf, mu_medievalsecret, false],
	[industrial_1, mu_industrial, mu_medievalsecret, false],
	[street_intro, mu_street, mu_medievalsecret, false],
	[farm_2, mu_farm, mu_farmsecret, false],
	[space_1, mu_pinball, mu_pinballsecret, false],
	[graveyard_1, mu_graveyard, mu_medievalsecret, false],
	[saloon_1, mu_saloon, mu_saloonsecret, false],
	[ufo_1, mu_ufo, mu_pinballsecret, false],
	[plage_entrance, mu_beach, mu_medievalsecret, false],
	[war_1, mu_war, mu_medievalsecret, false],
	[tower_finalhallway, mu_finalescape, mu_dungeonsecret, false],
	[Mainmenu, mu_title, mu_dungeonsecret, false],
	[tower_entrancehall, mu_hub, mu_dungeonsecret, false],
	[tower_1, mu_hub, mu_dungeonsecret, true],
	[tower_2, mu_hub, mu_dungeonsecret, true],
	[tower_3, mu_hub3, mu_dungeonsecret, true],
	[tower_4, mu_hub4, mu_dungeonsecret, true],
	[tower_5, mu_hub, mu_dungeonsecret, true]
];
