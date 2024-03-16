if (instance_number(object_index) > 1)
{
	instance_destroy()
	exit;
}
levels = [
	entrance_secret3, 
	entrance_secret4, 
	entrance_secret5, 
	medieval_secret4, 
	medieval_secret5, 
	medieval_secret6, 
	ruin_secret1, 
	ruin_secret4, 
	ruin_secret6, 
	dungeon_secret1, 
	dungeon_secret2, 
	dungeon_secret3, 
	badland_secret1, 
	badland_secret2, 
	badland_secret3, 
	graveyard_secret1, 
	graveyard_secret2, 
	graveyard_secret3, 
	farm_secret1, 
	farm_secret2, 
	farm_secret3, 
	saloon_secret1, 
	saloon_secret2, 
	saloon_secret3, 
	beach_secret1, 
	beach_secret2, 
	beach_secret3, 
	forest_secret1, 
	forest_secret2, 
	forest_secret3, 
	minigolf_secret1, 
	minigolf_secret2, 
	minigolf_secret3, 
	space_secret1, 
	space_secret2, 
	space_secret3, 
	street_secret1, 
	street_secret2, 
	street_secret3, 
	freezer_secret1, 
	freezer_secret2, 
	freezer_secret3, 
	sewer_secret1, 
	sewer_secret2, 
	sewer_secret3, 
	industrial_secret1, 
	industrial_secret2, 
	industrial_secret3, 
	chateau_secret1, 
	chateau_secret2, 
	chateau_secret3, 
	kidsparty_secret1, 
	kidsparty_secret2, 
	kidsparty_secret3, 
	war_secret1, 
	war_secret2, 
	war_secret3
];

selected = false
minutes = 0
seconds = 0
start = false
startstate = states.normal // PLAYER's state
depth = -999
