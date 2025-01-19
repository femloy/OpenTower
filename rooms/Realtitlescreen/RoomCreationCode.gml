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
	titlescreen,
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
	gameover,
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
	UNKNOWN_1, // 151
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
	UNKNOWN_2, // 199
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
	UNKNOWN_3, // 234
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
	UNKNOWN_4, // 253
	jetpackjump,
	UNKNOWN_5, // 255
	UNKNOWN_6, // 256
	bee,
	bee_chase,
	ratmountpunch,
	ratmountcrouch,
	ratmountladder,
	supergrab,
	UNKNOWN_7, // 263
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
	UNKNOWN_8, // 300
	UNKNOWN_9, // 301
	UNKNOWN_10, // 302
	UNKNOWN_11, // 303, used by obj_stickhat
	UNKNOWN_12, // 304
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
global.levelcompletename = noone;
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
global.entrancecutscene = noone;
global.medievalcutscene = noone;
global.ruincutscene = noone;
global.ruincutscene2 = noone;
global.ruincutscene3 = noone;
global.dungeoncutscene = noone;
global.peppermancutscene1 = noone;
global.peppermancutscene2 = noone;
global.chieftaincutscene = noone;
global.chieftaincutscene2 = noone;
global.desertcutscene = noone;
global.graveyardcutscene = noone;
global.spacecutscene = noone;
global.vigilantecutscene1 = noone;
global.vigilantecutscene2 = noone;
global.vigilantecutscene3 = noone;
global.farmcutscene = noone;
global.superpinballcutscene = noone;
global.pubcutscene = noone;
global.pinballcutscene = noone;
global.beercutscene = noone;
global.exitfeecutscene = noone;
global.forestcutscene = noone;
global.bottlecutscene = noone;
global.papercutscene = noone;
global.beachboatcutscene = noone;
global.beachcutscene = noone;
global.sewercutscene = noone;
global.burgercutscene = noone;
global.golfcutscene = noone;
global.anarchistcutscene1 = noone;
global.anarchistcutscene2 = noone;
global.factoryblock = noone;
global.streetcutscene = noone;
global.graffiticutscene = noone;
global.factorygraffiti = noone;
global.factorycutscene = noone;
global.hatcutscene1 = noone;
global.hatcutscene2 = noone;
global.hatcutscene3 = noone;
global.jetpackcutscene = noone;
global.noisecutscene1 = noone;
global.noisecutscene2 = noone;
global.freezercutscene = noone;
global.kidspartycutscene = noone;
global.gasolinecutscene = noone;
global.mansioncutscene = noone;
global.chateaucutscene = noone;
global.ghostsoldiercutscene = noone;
global.mrstickcutscene1 = noone;
global.mrstickcutscene2 = noone;
global.mrstickcutscene3 = noone;
global.chateauswap = noone;
global.warcutscene = noone;
pal_swap_init_system(shd_pal_swapper);
with obj_player1
	state = states.normal;
global.loadeditor = false;
if global.longintro
{
	global.longintro = false;
	room_goto(Longintro);
}
else
	room_goto(Mainmenu);
instance_destroy(obj_cutscene_handler);
