scr_initenemy();
scr_fakepep_init_sounds();

var default_deformed_timer = 500;
fakepep_set_attack(0, 0, fakepep_attacks.grabclone, 80, default_deformed_timer);
fakepep_set_attack(0, 1, fakepep_attacks.bodyslamclone, 80, default_deformed_timer);
fakepep_set_attack(0, 2, fakepep_attacks.machclone, 120, default_deformed_timer);
fakepep_set_attack(0, 3, fakepep_attacks.superjumpclone, 120, 500);
fakepep_set_attack(0, 4, fakepep_attacks.flailingclone, 120, default_deformed_timer);
fakepep_set_attack(0, 5, fakepep_attacks.tauntclone, 120, 700);

fakepep_set_attack(1, 0, fakepep_attacks.grabclone, 80, 0);
fakepep_set_attack(1, 1, fakepep_attacks.bodyslamclone, 80, 0);
fakepep_set_attack(1, 2, fakepep_attacks.machclone, 120, 0);
fakepep_set_attack(1, 3, fakepep_attacks.superjumpclone, 120, 0);
fakepep_set_attack(1, 4, fakepep_attacks.flailingclone, 120, 0);
fakepep_set_attack(1, 5, fakepep_attacks.tauntclone, 120, 0);

// failsafe or scrapped phase?
fakepep_set_attack(2, 0, fakepep_attacks.stunned, 0, default_deformed_timer);
fakepep_set_attack(2, 1, fakepep_attacks.stunned, 0, default_deformed_timer);
fakepep_set_attack(2, 2, fakepep_attacks.stunned, 0, default_deformed_timer);
fakepep_set_attack(2, 3, fakepep_attacks.stunned, 0, default_deformed_timer);
fakepep_set_attack(2, 4, fakepep_attacks.stunned, 0, default_deformed_timer);
fakepep_set_attack(2, 5, fakepep_attacks.stunned, 0, default_deformed_timer);

projectile_list = -4;
fakepep_start_projectiles(0, 0);
fakepep_add_grabclone(0, 0, 1, 80);
fakepep_add_grabclone(0, 0, -1, 80);

fakepep_start_projectiles(0, 1);
fakepep_add_bodyslamclone(0, 1, 1, 70);
fakepep_add_bodyslamclone(0, 1, -1, 70);

fakepep_start_projectiles(0, 2);
fakepep_add_machclone(0, 2, 1, 30, true);
fakepep_add_machclone(0, 2, -1, 30, true);
fakepep_add_machclone(0, 2, 1, 30, true);
fakepep_add_machclone(0, 2, -1, 30, true);
fakepep_add_machclone(0, 2, 1, 30, true);
fakepep_add_machclone(0, 2, -1, 30, true);

fakepep_start_projectiles(0, 3);
var size = 10;
var timer = 3;
fakepep_add_superjumpclones(0, 3, 1, timer, size, irandom(size), 15);
fakepep_add_superjumpclones(0, 3, -1, timer, size, irandom(size), 15);
fakepep_add_superjumpclones(0, 3, 1, timer, size, irandom(size), 15);
fakepep_add_superjumpclones(0, 3, -1, timer, size, irandom(size), 15);
fakepep_add_superjumpclones(0, 3, 1, timer, size, irandom(size), 15);
fakepep_add_superjumpclones(0, 3, -1, timer, size, irandom(size), 15);

fakepep_start_projectiles(0, 4);
fakepep_add_flailingclone(0, 4, 1, 45);
fakepep_add_flailingclone(0, 4, -1, 45);

fakepep_start_projectiles(0, 5);
fakepep_add_tauntclones(0, 5, -12, -14, 80);
fakepep_add_tauntclones(0, 5, -14, -12, 80);

fakepep_add_flailingclone(0, 5, 1, 30);
fakepep_add_tauntclones(0, 5, -11, -11, 80);
fakepep_add_tauntclones(0, 5, -13, -8, 80);
fakepep_add_tauntclones(0, 5, -8, -13, 80);
fakepep_add_flailingclone(0, 5, -1, 30);

fakepep_start_projectiles(1, 0);
fakepep_add_machclone(1, 0, 1, 180, true);
fakepep_add_machclone(1, 0, -1, 180, true);

fakepep_start_projectiles(1, 1);
fakepep_add_bodyslamclone(1, 1, 1, 180);
fakepep_add_bodyslamclone(1, 1, -1, 180);

fakepep_start_projectiles(1, 2);
fakepep_add_machclone(1, 2, 1, 150, true);
fakepep_add_machclone(1, 2, -1, 150, true);

fakepep_start_projectiles(1, 3);
fakepep_add_flailingclone(1, 3, 1, 120);
fakepep_add_flailingclone(1, 3, -1, 120);

fakepep_start_projectiles(1, 4);
fakepep_add_flailingclone(1, 4, 1, 180);
fakepep_add_flailingclone(1, 4, -1, 180);

fakepep_start_projectiles(1, 5);
fakepep_add_machclone(1, 5, 1, 150, true);
fakepep_add_machclone(1, 5, -1, 150, true);

skipintro = false;
miniflash = false;
staggerbuffer = 0;
alarm[8] = 1;
pizzahead = false;
flashbuffer = 0;
deformed_cooldown = 0;
deformed_timer = 0;
deformed_dir = 1;
currentprojectile = 0;
parryable = false;
playerhit = 0;
introbuffer = 80;
important = true;
stompable = false;
shakestun = false;
elite = true;
elitehit = 6;
maxsubhp = 1;
subhp = maxsubhp;
prevhp = elitehit;
turned = false;
bodyslam = false;
wastedhits = 0;
state = states.arenaintro;
sprite_index = spr_fakepeppino_intro1;
introbuffer = 80;
spotlightID = instance_create(x, y, obj_bossspotlight);
spotlightID.objectID = id;
hitboxID = -4;
headID = -4;
attackspeed = 0;
destroyable = false;
phase = 1;
formed = true;
cooldown = 80;
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
landspr = spr_fakepeppino_idle;
idlespr = spr_fakepeppino_idle;
fallspr = spr_fakepeppino_fall;
stunfallspr = spr_fakepeppino_stun;
walkspr = spr_fakepeppino_idle;
turnspr = spr_fakepeppino_idle;
recoveryspr = spr_fakepeppino_idle;
grabbedspr = spr_fakepeppino_stun;
scaredspr = spr_fakepeppino_idle;
ragespr = spr_fakepeppino_idle;
spr_dead = spr_fakepeppino_stun;
hp = 1;
slapped = false;
grounded = true;
birdcreated = false;
boundbox = false;
important = false;
heavy = true;
paletteselect = 0;
spr_palette = spr_fakepeppinopalette;
usepalette = true;
grabbedby = 0;
stuntouchbuffer = 0;
scaredbuffer = 0;
dir = 1;
woosh = false;
flickertime = 0;
touchedground = false;
