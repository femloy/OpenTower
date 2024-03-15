scr_initenemy();
scr_pizzaface_init_sounds();
on_y = false;
skipintro = false;
superslambuffer = 0;
attackbuffer = 120;
floatdir = 1;
facepart_count = 4;
baddie_arr = [
	[obj_cheeseslime, spr_slimestun],
	[obj_forknight, spr_forknight_stun],
	[obj_badrat, spr_badrat_stun],
	[obj_banditochicken, spr_banditochicken_stun],
	[obj_spitcheese, spr_spitcheese_stun],
	[obj_ninja, spr_ninja_stun],
	[obj_minijohn, spr_minijohn_stun],
	[obj_minijohn, spr_minijohn_stun],
	[obj_minijohn, spr_minijohn_stun],
	[obj_minijohn, spr_minijohn_stun]
];
lasthit = false;
nosespit = true;
nosecount = 1;
bighitbox = instance_create(x, y, obj_pizzafacehitbox);
bighitbox.baddieID = id;
baddie_range = 1;
pizzahead = false;
override_throw = false;
spotlightID = -4;
parryable = false;
flameID = -4;
playerhit = 0;
introbuffer = 80;
introstate = 0;
important = true;
stompable = false;
shakestun = false;
killbyenemy = false;
elite = true;
elitehit = 8;
prevhp = elitehit;
turned = false;
wastedhits = 0;
sprite_index = spr_pizzaface;
state = states.arenaintro;
introbuffer = 80;
hitboxID = -4;
attackspeed = 0;
hitboxID = -4;
destroyable = false;
idle_max = 240;
idle_timer = idle_max;
grav = 0.5;
hsp = 0;
vsp = 0;
stunned = 0;
alarm[0] = 150;
roaming = true;
collectdrop = 5;
flying = false;
straightthrow = false;
cigar = false;
cigarcreate = false;
stomped = false;
shot = false;
reset = false;
flash = false;
landspr = spr_pizzaface;
idlespr = spr_pizzaface;
fallspr = spr_pizzaface;
stunfallspr = spr_pizzaface_stun;
walkspr = spr_pizzaface;
turnspr = spr_pizzaface;
recoveryspr = spr_pizzaface_stun;
grabbedspr = spr_pizzaface_stun;
scaredspr = spr_pizzaface;
ragespr = spr_pizzaface;
hp = 1;
slapped = false;
grounded = true;
birdcreated = false;
boundbox = false;
spr_dead = spr_pizzaface_stun;
important = false;
heavy = true;
paletteselect = 0;
spr_palette = palette_cheeseslime;
grabbedby = 0;
stuntouchbuffer = 0;
scaredbuffer = 0;
cooldown = 40;
phase = 1;
dir = 1;
woosh = false;
flickertime = 0;
touchedground = false;
cowcrate = 0;
mask_index = spr_player_mask;
