var ident = ds_map_find_value(async_load, "id");
var status = ds_map_find_value(async_load, "status");
var error = ds_map_find_value(async_load, "error");

switch state
{
	case 1:
	case 3:
		if ident == saveid
		{
			buffer_delete(savebuff);
			trace("Save status: ", status, ", error: ", error);
			state = 0;
		}
		break;
	
	case 2:
		if ident == loadid
		{
			var buffstring = buffer_read(loadbuff, 11);
			ini_open_from_string(buffstring);
			global.entrancecutscene = ini_read_real("cutscene", "entrance", false);
			global.medievalcutscene = ini_read_real("cutscene", "medieval", false);
			global.ruincutscene = ini_read_real("cutscene", "ruin", false);
			global.dungeoncutscene = ini_read_real("cutscene", "dungeon", false);
			global.desertcutscene = ini_read_real("cutscene", "desert", false);
			global.graveyardcutscene = ini_read_real("cutscene", "graveyard", false);
			global.farmcutscene = ini_read_real("cutscene", "farm", false);
			global.spacecutscene = ini_read_real("cutscene", "space", false);
			global.beachcutscene = ini_read_real("cutscene", "beach", false);
			global.forestcutscene = ini_read_real("cutscene", "forest", false);
			global.pinballcutscene = ini_read_real("cutscene", "pinball", false);
			global.golfcutscene = ini_read_real("cutscene", "golf", false);
			global.streetcutscene = ini_read_real("cutscene", "street", false);
			global.sewercutscene = ini_read_real("cutscene", "sewer", false);
			global.factorycutscene = ini_read_real("cutscene", "factory", false);
			global.freezercutscene = ini_read_real("cutscene", "freezer", false);
			global.chateaucutscene = ini_read_real("cutscene", "chateau", false);
			global.mansioncutscene = ini_read_real("cutscene", "mansion", false);
			global.kidspartycutscene = ini_read_real("cutscene", "kidsparty", false);
			global.warcutscene = ini_read_real("cutscene", "war", false);
			global.entrancetreasure = ini_read_real("Treasure", "entrance", false);
			global.medievaltreasure = ini_read_real("Treasure", "medieval", false);
			global.ruintreasure = ini_read_real("Treasure", "ruin", false);
			global.dungeontreasure = ini_read_real("Treasure", "dungeon", false);
			global.deserttreasure = ini_read_real("Treasure", "desert", false);
			global.graveyardtreasure = ini_read_real("Treasure", "graveyard", false);
			global.farmtreasure = ini_read_real("Treasure", "farm", false);
			global.spacetreasure = ini_read_real("Treasure", "space", false);
			global.beachtreasure = ini_read_real("Treasure", "beach", false);
			global.foresttreasure = ini_read_real("Treasure", "forest", false);
			global.pinballtreasure = ini_read_real("Treasure", "pinball", false);
			global.golftreasure = ini_read_real("Treasure", "minigolf", false);
			global.streettreasure = ini_read_real("Treasure", "street", false);
			global.sewertreasure = ini_read_real("Treasure", "sewer", false);
			global.factorytreasure = ini_read_real("Treasure", "factory", false);
			global.freezertreasure = ini_read_real("Treasure", "freezer", false);
			global.chateautreasure = ini_read_real("Treasure", "chateau", false);
			global.mansiontreasure = ini_read_real("Treasure", "mansion", false);
			global.kidspartytreasure = ini_read_real("Treasure", "kidsparty", false);
			global.wartreasure = ini_read_real("Treasure", "war", false);
			with obj_achievementtracker
			{
				achievements_load(achievements_update);
				achievements_load(achievements_notify);
			}
			ini_str = ini_close();
			buffer_delete(loadbuff);
			trace("inistr: ", ini_str);
			trace("buffstring: ", buffstring);
			state = 0;
		}
		break;
}
