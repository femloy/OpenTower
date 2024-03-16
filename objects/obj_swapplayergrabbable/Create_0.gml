scr_initenemy();
usepalette = true;
is_controllable = true;
possess_movespeed = 0;
gusrat = false;
grav = 0.5;
hsp = 0;
vsp = 0;
state = states.walk;
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

var _hurt = obj_player1.spr_hurt;
var _dead = obj_player1.spr_dead;
if obj_player1.isgustavo
{
	_hurt = spr_player_ratmounthurt;
	_dead = spr_player_ratmountgameover;
}
landspr = _hurt;
idlespr = _hurt;
fallspr = _hurt;
stunfallspr = _hurt;
walkspr = _hurt;
turnspr = _hurt;
recoveryspr = _hurt;
grabbedspr = _hurt;
scaredspr = _hurt;
ragespr = _hurt;

image_xscale = -1;
hp = 1;
slapped = false;
grounded = true;
birdcreated = false;
boundbox = false;
spr_dead = _dead;
important = true;
heavy = false;
depth = 0;
paletteselect = 0;
spr_palette = palette_cheeseslime;
sprite_index = spr_slimemove;
grabbedby = 0;
stuntouchbuffer = 0;
scaredbuffer = 0;
snotty = false;
