enum states
{
	normal,
	revolver,
	dynamite,
	boots,
	grabbed,
	tumble,
	finishingblow,
	ejected,
	transition,
	fireass,
	firemouth,
	mort,
	mortjump,
	mortattack,
	morthook,
	hook,
	ghost,
	ghostpossess,
	titlescreen, // also used as the "do nothing" state
	hookshot,
	tacklecharge,
	cheeseball,
	cheeseballclimbwall,
	slap,
	cheesepep,
	cheesepepstick,
	cheesepepjump,
	cheesepepfling,
	cheesepeplaunch,
	cheesepepstickside,
	cheesepepstickup,
	rideweenie,
	motorcycle,
	boxxedpep,
	boxxedpepspin,
	boxxedpepjump,
	pistolaim,
	climbwall,
	knightpepslopes,
	portal,
	secondjump,
	chainsawbump,
	handstandjump,
	lungeattack,
	lungegrab,
	dashtumble,
	gottreasure,
	knightpep,
	knightpepattack,
	knightpepbump,
	meteorpep,
	bombpep,
	bombgrab,
	bombpepside,
	bombpepup,
	grabbing,
	chainsawpogo,
	shotgunjump,
	pogo,
	stunned,
	highjump,
	chainsaw,
	facestomp,
	mach4, // doesnt exist
	timesup,
	machroll,
	shotgun,
	shotguncrouch,
	shotguncrouchjump,
	shotgunshoot,
	shotgundash,
	shotgunfreefall,
	pistol,
	machfreefall,
	throwing,
	slam,
	superslam,
	skateboard,
	grind,
	grab,
	punch,
	backkick,
	uppunch,
	shoulder,
	backbreaker,
	graffiti,
	bossdefeat,
	pizzathrow,
	bossintro,
	dead, // originally "gameover"
	keyget,
	tackle,
	jump,
	ladder,
	slipnslide,
	comingoutdoor,
	smirk,
	Sjump,
	victory,
	Sjumpprep,
	crouch,
	crouchjump,
	crouchslide,
	mach1,
	mach2,
	machslide,
	bump,
	hurt,
	freefall,
	hang,
	turning, // doesnt exist
	freefallland,
	door,
	barrel,
	barreljump,
	barrelclimbwall,
	barrelslide,
	current,
	boulder,
	taxi,
	runonball,
	mach3,
	freefallprep,
	Sjumpland,
	faceplant,
	rage,
	idle,
	bounce,
	charge,
	pizzagoblinthrow,
	turn,
	hitceiling, // doesnt exist
	hitwall, // doesnt exist
	groundpoundland,
	walk,
	fall,
	land,
	hit,
	stun,
	recovery, // doesnt exist
	stomped, // doesnt exist
	chase,
	spawnenemy,
	arena,
	arenaintro,
	arenaround,
	actor,
	parry,
	golf,
	float,
	tube,
	unused_1, // 151
	policetaxi,
	shoulderbash,
	pummel,
	staggered,
	thrown,
	supershoulderbash,
	superattackstart,
	superattackcharge,
	superattack,
	shoulderturn,
	fistmatch,
	fistmatchend,
	groundpunchstart,
	slipbanan,
	millionpunch,
	skateboardturn,
	bombkick,
	bombpogo,
	jetpackstart,
	jetpack,
	jetpackcancel,
	jetpackspin,
	shield,
	helicopterhat,
	panicjump,
	smokebombstart,
	smokebombcrawl,
	springshoes,
	cardboard,
	cardboardend,
	mockery,
	bombdelete,
	rocket,
	rocketslide,
	gotoplayer,
	trickjump,
	totem,
	underground,
	ridecow,
	ratmount,
	ratmountjump,
	ratmountattack,
	ratmountspit,
	ratmountclimbwall,
	ratmounthurt,
	ratmountgroundpound,
	ratmountbounce,
	unused_2, // 199
	ratmountballoon,
	ratmounttumble,
	ratmountgrind,
	ratmounttrickjump,
	ratmountskid,
	ratgrabbed,
	blockstance,
	balloon,
	debugstate,
	trashjumpprep,
	trashjump,
	trashroll,
	stringfling,
	stringjump,
	stringfall,
	noisejetpack,
	spiderweb,
	robotidle,
	robotintro,
	robotroaming,
	robotchase,
	robotinvestigate,
	robotseeking,
	flushidle,
	flushtransition,
	animatronic,
	pizzaface_moustache,
	pizzaface_mouth,
	pizzaface_eyes,
	pizzaface_nose,
	pizzaface_ram,
	pizzaface_phase2transition,
	pizzahead_look,
	pizzahead_fishing,
	unused_3, // 234
	pizzahead_bombrun,
	pizzahead_npcthrow,
	pizzahead_portraitthrow,
	pizzahead_enguarde,
	pizzahead_sexypicture,
	pizzahead_pullinglevel,
	pizzahead_eat,
	pizzahead_surprisebox,
	pizzahead_spinningrun,
	pizzahead_spinningkick,
	pizzahead_spinningpunch,
	pizzahead_groundpunch,
	pizzahead_bigkick,
	pizzahead_slamhead,
	pizzahead_slamhead2,
	tv_whitenoise,
	tv_expression,
	playersuperattack,
	unused_4, // 253
	jetpackjump,
	unused_5, // 255
	unused_6, // 256
	bee,
	bee_chase,
	ratmountpunch,
	ratmountcrouch,
	ratmountladder,
	supergrab,
	unused_7, // 263
	magnet,
	antigrav,
	secret,
	contemplate,
	mini,
	reloading,
	estampede,
	dropstart,
	drop,
	phase1hurt,
	duel,
	deformed,
	grabdash,
	grabthrow,
	wait,
	flamethrower,
	machinegun,
	bazooka,
	crate,
	noisecrusher,
	droptrap,
	skateboardnoise,
	noiseballooncrash,
	swinging,
	stomp,
	ending,
	backtohub,
	johnghost,
	spaceshuttle,
	animation,
	pizzaheadjump,
	fightball,
	secretenter,
	teleport,
	KO,
	camera_followtarget,
	
	// states for stick's level from the leaks. state code was removed.
	UNKNOWN_1, // 300
	UNKNOWN_2, // 301
	UNKNOWN_3, // 302
	UNKNOWN_4, // 303, used by obj_stickhat
	UNKNOWN_5, // 304
	
	// noise
	machcancelstart,
	machcancel
}

global.coop = false;
global.currentsavefile = 1;
var achievement_arr = ["sranks1", "sranks2", "sranks3", "sranks4", "sranks5"];
var data_arr = [get_save_folder() + "/saveData1", get_save_folder() + "/saveData2", get_save_folder() + "/saveData3"];
global.stickreq[0] = 100;
global.stickreq[1] = 150;
global.stickreq[2] = 200;
global.stickreq[3] = 200;
global.stickreq[4] = 210;
global.levelattempts = 0;
global.palette_arr = [false, false, false, false, false];
for (var i = 0; i < array_length(data_arr); i++)
{
	global.game[i] = scr_read_game(data_arr[i] + ".ini");
	global.gameN[i] = scr_read_game(data_arr[i] + "N.ini");
}
global.newtoppin[0] = false;
global.newtoppin[1] = false;
global.newtoppin[2] = false;
global.newtoppin[3] = false;
global.newtoppin[4] = false;
global.mach_color1 = make_colour_rgb(96, 208, 72);
global.mach_color2 = make_colour_rgb(248, 0, 0);
global.afterimage_color1 = make_colour_rgb(255, 0, 0);
global.afterimage_color2 = make_colour_rgb(0, 255, 0);
global.smallnumber_color1 = make_colour_rgb(255, 255, 255);
global.smallnumber_color2 = make_colour_rgb(248, 0, 0);
global.optimize = 0;
global.autotile = true;
global.smallnumber_fnt = font_add_sprite_ext(spr_smallnumber, "1234567890-+", true, 0);
global.pigreduction = 0;
global.pigtotal = 0;
global.levelcomplete = false;
global.levelcompletename = -4;
global.entrancetreasure = false;
global.medievaltreasure = false;
global.ruintreasure = false;
global.dungeontreasure = false;
global.deserttreasure = false;
global.graveyardtreasure = false;
global.farmtreasure = false;
global.spacetreasure = false;
global.beachtreasure = false;
global.foresttreasure = false;
global.pinballtreasure = false;
global.golftreasure = false;
global.streettreasure = false;
global.sewertreasure = false;
global.factorytreasure = false;
global.freezertreasure = false;
global.chateautreasure = false;
global.mansiontreasure = false;
global.kidspartytreasure = false;
global.wartreasure = false;
global.entrancecutscene = -4;
global.medievalcutscene = -4;
global.ruincutscene = -4;
global.ruincutscene2 = -4;
global.ruincutscene3 = -4;
global.dungeoncutscene = -4;
global.peppermancutscene1 = -4;
global.peppermancutscene2 = -4;
global.chieftaincutscene = -4;
global.chieftaincutscene2 = -4;
global.desertcutscene = -4;
global.graveyardcutscene = -4;
global.spacecutscene = -4;
global.vigilantecutscene1 = -4;
global.vigilantecutscene2 = -4;
global.vigilantecutscene3 = -4;
global.farmcutscene = -4;
global.superpinballcutscene = -4;
global.pubcutscene = -4;
global.pinballcutscene = -4;
global.beercutscene = -4;
global.exitfeecutscene = -4;
global.forestcutscene = -4;
global.bottlecutscene = -4;
global.papercutscene = -4;
global.beachboatcutscene = -4;
global.beachcutscene = -4;
global.sewercutscene = -4;
global.burgercutscene = -4;
global.golfcutscene = -4;
global.anarchistcutscene1 = -4;
global.anarchistcutscene2 = -4;
global.factoryblock = -4;
global.streetcutscene = -4;
global.graffiticutscene = -4;
global.factorygraffiti = -4;
global.factorycutscene = -4;
global.hatcutscene1 = -4;
global.hatcutscene2 = -4;
global.hatcutscene3 = -4;
global.jetpackcutscene = -4;
global.noisecutscene1 = -4;
global.noisecutscene2 = -4;
global.freezercutscene = -4;
global.kidspartycutscene = -4;
global.gasolinecutscene = -4;
global.mansioncutscene = -4;
global.chateaucutscene = -4;
global.ghostsoldiercutscene = -4;
global.mrstickcutscene1 = -4;
global.mrstickcutscene2 = -4;
global.mrstickcutscene3 = -4;
global.chateauswap = -4;
global.warcutscene = -4;
pal_swap_init_system(shd_pal_swapper);
with (obj_player1)
	state = states.normal;
global.loadeditor = false;
if (global.longintro)
{
	global.longintro = false;
	room_goto(Longintro);
}
else
	room_goto(Mainmenu);
instance_destroy(obj_cutscene_handler);
