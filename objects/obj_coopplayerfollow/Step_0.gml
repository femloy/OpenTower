if (room == rank_room)
	visible = false;
else
	visible = true;
playerid = obj_player1.id;
image_speed = 0;
var _p1spr = obj_player1.sprite_index;
var _spr = obj_player2.spr_idle;
switch (_p1spr)
{
	case obj_player1.spr_idle:
		_spr = obj_player2.spr_idle;
		break;
	case obj_player1.spr_move:
		_spr = obj_player2.spr_move;
		break;
	case obj_player1.spr_crawl:
		_spr = obj_player2.spr_crawl;
		break;
	case obj_player1.spr_hurt:
		_spr = obj_player2.spr_hurt;
		break;
	case obj_player1.spr_jump:
		_spr = obj_player2.spr_jump;
		break;
	case obj_player1.spr_jump2:
		_spr = obj_player2.spr_jump2;
		break;
	case obj_player1.spr_fall:
		_spr = obj_player2.spr_fall;
		break;
	case obj_player1.spr_fall2:
		_spr = obj_player2.spr_fall2;
		break;
	case obj_player1.spr_crouch:
		_spr = obj_player2.spr_crouch;
		break;
	case obj_player1.spr_crouchjump:
		_spr = obj_player2.spr_crouchjump;
		break;
	case obj_player1.spr_crouchfall:
		_spr = obj_player2.spr_crouchfall;
		break;
	case obj_player1.spr_bump:
		_spr = obj_player2.spr_bump;
		break;
	case obj_player1.spr_land:
		_spr = obj_player2.spr_land;
		break;
	case obj_player1.spr_lookdoor:
		_spr = obj_player2.spr_lookdoor;
		break;
	case obj_player1.spr_walkfront:
		_spr = obj_player2.spr_walkfront;
		break;
	case obj_player1.spr_Ladder:
		_spr = obj_player2.spr_Ladder;
		break;
	case obj_player1.spr_laddermove:
		_spr = obj_player2.spr_laddermove;
		break;
	case obj_player1.spr_mach:
		_spr = obj_player2.spr_mach;
		break;
	case obj_player1.spr_mach1:
		_spr = obj_player2.spr_mach1;
		break;
	case obj_player1.spr_secondjump1:
		_spr = obj_player2.spr_secondjump1;
		break;
	case obj_player1.spr_secondjump2:
		_spr = obj_player2.spr_secondjump2;
		break;
	case obj_player1.spr_machslide:
		_spr = obj_player2.spr_machslide;
		break;
	case obj_player1.spr_machslidestart:
		_spr = obj_player2.spr_machslidestart;
		break;
	case obj_player1.spr_machslideend:
		_spr = obj_player2.spr_machslideend;
		break;
	case obj_player1.spr_machslideboost:
		_spr = obj_player2.spr_machslideboost;
		break;
	case obj_player1.spr_idle1:
		_spr = obj_player2.spr_idle1;
		break;
	case obj_player1.spr_idle2:
		_spr = obj_player2.spr_idle2;
		break;
	case obj_player1.spr_idle3:
		_spr = obj_player2.spr_idle3;
		break;
	case obj_player1.spr_idle4:
		_spr = obj_player2.spr_idle4;
		break;
	case obj_player1.spr_idle5:
		_spr = obj_player2.spr_idle5;
		break;
	case obj_player1.spr_idle6:
		_spr = obj_player2.spr_idle6;
		break;
	case obj_player1.spr_land2:
		_spr = obj_player2.spr_land2;
		break;
	case obj_player1.spr_punch:
		_spr = obj_player2.spr_punch;
		break;
	case obj_player1.spr_backkick:
		_spr = obj_player2.spr_backkick;
		break;
	case obj_player1.spr_shoulder:
		_spr = obj_player2.spr_shoulder;
		break;
	case obj_player1.spr_uppunch:
		_spr = obj_player2.spr_uppunch;
		break;
	case obj_player1.spr_stomp:
		_spr = obj_player2.spr_stomp;
		break;
	case obj_player1.spr_stompprep:
		_spr = obj_player2.spr_stompprep;
		break;
	case obj_player1.spr_crouchslide:
		_spr = obj_player2.spr_crouchslide;
		break;
	case obj_player1.spr_victory:
		_spr = obj_player2.spr_victory;
		break;
	case obj_player1.spr_climbwall:
		_spr = obj_player2.spr_climbwall;
		break;
	case obj_player1.spr_grab:
		_spr = obj_player2.spr_grab;
		break;
	case obj_player1.spr_mach2jump:
		_spr = obj_player2.spr_mach2jump;
		break;
	case obj_player1.spr_Timesup:
		_spr = obj_player2.spr_Timesup;
		break;
	case obj_player1.spr_deathstart:
		_spr = obj_player2.spr_deathstart;
		break;
	case obj_player1.spr_deathend:
		_spr = obj_player2.spr_deathend;
		break;
	case obj_player1.spr_machpunch1:
		_spr = obj_player2.spr_machpunch1;
		break;
	case obj_player1.spr_machpunch2:
		_spr = obj_player2.spr_machpunch2;
		break;
	case obj_player1.spr_hurtjump:
		_spr = obj_player2.spr_hurtjump;
		break;
	case obj_player1.spr_entergate:
		_spr = obj_player2.spr_entergate;
		break;
	case obj_player1.spr_gottreasure:
		_spr = obj_player2.spr_gottreasure;
		break;
	case obj_player1.spr_bossintro:
		_spr = obj_player2.spr_bossintro;
		break;
	case obj_player1.spr_hurtidle:
		_spr = obj_player2.spr_hurtidle;
		break;
	case obj_player1.spr_hurtwalk:
		_spr = obj_player2.spr_hurtwalk;
		break;
	case obj_player1.spr_suplexmash1:
		_spr = obj_player2.spr_suplexmash1;
		break;
	case obj_player1.spr_suplexmash2:
		_spr = obj_player2.spr_suplexmash2;
		break;
	case obj_player1.spr_suplexmash3:
		_spr = obj_player2.spr_suplexmash3;
		break;
	case obj_player1.spr_suplexmash4:
		_spr = obj_player2.spr_suplexmash4;
		break;
	case obj_player1.spr_tackle:
		_spr = obj_player2.spr_tackle;
		break;
	case obj_player1.spr_airdash1:
		_spr = obj_player2.spr_airdash1;
		break;
	case obj_player1.spr_airdash2:
		_spr = obj_player2.spr_airdash2;
		break;
	case obj_player1.spr_piledriver:
		_spr = obj_player2.spr_piledriver;
		break;
	case obj_player1.spr_piledriverland:
		_spr = obj_player2.spr_piledriverland;
		break;
	case obj_player1.spr_charge:
		_spr = obj_player2.spr_charge;
		break;
	case obj_player1.spr_mach3jump:
		_spr = obj_player2.spr_mach3jump;
		break;
	case obj_player1.spr_mach4:
		_spr = obj_player2.spr_mach4;
		break;
	case obj_player1.spr_machclimbwall:
		_spr = obj_player2.spr_machclimbwall;
		break;
	case obj_player1.spr_dive:
		_spr = obj_player2.spr_dive;
		break;
	case obj_player1.spr_machroll:
		_spr = obj_player2.spr_machroll;
		break;
	case obj_player1.spr_hitwall:
		_spr = obj_player2.spr_hitwall;
		break;
	case obj_player1.spr_superjumpland:
		_spr = obj_player2.spr_superjumpland;
		break;
	case obj_player1.spr_walljumpstart:
		_spr = obj_player2.spr_walljumpstart;
		break;
	case obj_player1.spr_superjumpprep:
		_spr = obj_player2.spr_superjumpprep;
		break;
	case obj_player1.spr_superjump:
		_spr = obj_player2.spr_superjump;
		break;
	case obj_player1.spr_superjumppreplight:
		_spr = obj_player2.spr_superjumppreplight;
		break;
	case obj_player1.spr_superjumpright:
		_spr = obj_player2.spr_superjumpright;
		break;
	case obj_player1.spr_superjumpleft:
		_spr = obj_player2.spr_superjumpleft;
		break;
	case obj_player1.spr_machfreefall:
		_spr = obj_player2.spr_machfreefall;
		break;
	case obj_player1.spr_mach3hit:
		_spr = obj_player2.spr_mach3hit;
		break;
	case obj_player1.spr_knightpepwalk:
		_spr = obj_player2.spr_knightpepwalk;
		break;
	case obj_player1.spr_knightpepjump:
		_spr = obj_player2.spr_knightpepjump;
		break;
	case obj_player1.spr_knightpepfall:
		_spr = obj_player2.spr_knightpepfall;
		break;
	case obj_player1.spr_knightpepidle:
		_spr = obj_player2.spr_knightpepidle;
		break;
	case obj_player1.spr_knightpepjumpstart:
		_spr = obj_player2.spr_knightpepjumpstart;
		break;
	case obj_player1.spr_knightpepthunder:
		_spr = obj_player2.spr_knightpepthunder;
		break;
	case obj_player1.spr_knightpepland:
		_spr = obj_player2.spr_knightpepland;
		break;
	case obj_player1.spr_knightpepdownslope:
		_spr = obj_player2.spr_knightpepdownslope;
		break;
	case obj_player1.spr_knightpepstart:
		_spr = obj_player2.spr_knightpepstart;
		break;
	case obj_player1.spr_knightpepcharge:
		_spr = obj_player2.spr_knightpepcharge;
		break;
	case obj_player1.spr_bodyslamstart:
		_spr = obj_player2.spr_bodyslamstart;
		break;
	case obj_player1.spr_bodyslamfall:
		_spr = obj_player2.spr_bodyslamfall;
		break;
	case obj_player1.spr_bodyslamland:
		_spr = obj_player2.spr_bodyslamland;
		break;
	case obj_player1.spr_crazyrun:
		_spr = obj_player2.spr_crazyrun;
		break;
	case obj_player1.spr_bombpeprun:
		_spr = obj_player2.spr_bombpeprun;
		break;
	case obj_player1.spr_bombpepintro:
		_spr = obj_player2.spr_bombpepintro;
		break;
	case obj_player1.spr_bombpeprunabouttoexplode:
		_spr = obj_player2.spr_bombpeprunabouttoexplode;
		break;
	case obj_player1.spr_bombpepend:
		_spr = obj_player2.spr_bombpepend;
		break;
	case obj_player1.spr_fireass:
		_spr = obj_player2.spr_fireass;
		break;
	case obj_player1.spr_fireassground:
		_spr = obj_player2.spr_fireassground;
		break;
	case obj_player1.spr_fireassend:
		_spr = obj_player2.spr_fireassend;
		break;
	case obj_player1.spr_tumblestart:
		_spr = obj_player2.spr_tumblestart;
		break;
	case obj_player1.spr_tumbleend:
		_spr = obj_player2.spr_tumbleend;
		break;
	case obj_player1.spr_tumble:
		_spr = obj_player2.spr_tumble;
		break;
	case obj_player1.spr_stunned:
		_spr = obj_player2.spr_stunned;
		break;
	case obj_player1.spr_downpizzabox:
		_spr = obj_player2.spr_downpizzabox;
		break;
	case obj_player1.spr_uppizzabox:
		_spr = obj_player2.spr_uppizzabox;
		break;
	case obj_player1.spr_slipnslide:
		_spr = obj_player2.spr_slipnslide;
		break;
	case obj_player1.spr_mach3boost:
		_spr = obj_player2.spr_mach3boost;
		break;
	case obj_player1.spr_facehurtup:
		_spr = obj_player2.spr_facehurtup;
		break;
	case obj_player1.spr_facehurt:
		_spr = obj_player2.spr_facehurt;
		break;
	case obj_player1.spr_walljumpend:
		_spr = obj_player2.spr_walljumpend;
		break;
	case obj_player1.spr_suplexdash:
		_spr = obj_player2.spr_suplexdash;
		break;
	case obj_player1.spr_suplexdashjumpstart:
		_spr = obj_player2.spr_suplexdashjumpstart;
		break;
	case obj_player1.spr_suplexdashjump:
		_spr = obj_player2.spr_suplexdashjump;
		break;
	case obj_player1.spr_shotgunsuplexdash:
		_spr = obj_player2.spr_shotgunsuplexdash;
		break;
	case obj_player1.spr_rollgetup:
		_spr = obj_player2.spr_rollgetup;
		break;
	case obj_player1.spr_swingding:
		_spr = obj_player2.spr_swingding;
		break;
	case obj_player1.spr_swingdingend:
		_spr = obj_player2.spr_swingdingend;
		break;
	case obj_player1.spr_haulingjump:
		_spr = obj_player2.spr_jump;
		break;
	case obj_player1.spr_haulingidle:
		_spr = obj_player2.spr_idle;
		break;
	case obj_player1.spr_haulingwalk:
		_spr = obj_player2.spr_move;
		break;
	case obj_player1.spr_haulingfall:
		_spr = obj_player2.spr_fall;
		break;
	case obj_player1.spr_haulingland:
		_spr = obj_player2.spr_land;
		break;
	case obj_player1.spr_winding:
		_spr = obj_player2.spr_winding;
		break;
	case obj_player1.spr_3hpwalk:
		_spr = obj_player2.spr_3hpwalk;
		break;
	case obj_player1.spr_3hpidle:
		_spr = obj_player2.spr_3hpidle;
		break;
	case obj_player1.spr_panic:
		_spr = obj_player2.spr_panic;
		break;
	case obj_player1.spr_facestomp:
		_spr = obj_player2.spr_facestomp;
		break;
	case obj_player1.spr_freefall:
		_spr = obj_player2.spr_freefall;
		break;
	case obj_player1.spr_shotgunland:
		_spr = obj_player2.spr_shotgunland;
		break;
	case obj_player1.spr_shotgunshoot:
		_spr = obj_player2.spr_shotgunshoot;
		break;
	case obj_player1.spr_shotgunidle:
		_spr = obj_player2.spr_shotgunidle;
		break;
	case obj_player1.spr_shotgunwalk:
		_spr = obj_player2.spr_shotgunwalk;
		break;
	case obj_player1.spr_shotgunfall:
		_spr = obj_player2.spr_shotgunfall;
		break;
	case obj_player1.spr_shotgunjump:
		_spr = obj_player2.spr_shotgunjump;
		break;
	case obj_player1.spr_shotgunjump1:
		_spr = obj_player2.spr_shotgunjump1;
		break;
	case obj_player1.spr_shotgunjump2:
		_spr = obj_player2.spr_shotgunjump2;
		break;
	case obj_player1.spr_shotgunjump3:
		_spr = obj_player2.spr_shotgunjump3;
		break;
	case obj_player1.spr_shotgunpullout:
		_spr = obj_player2.spr_shotgunpullout;
		break;
	case obj_player1.spr_shotgunduck:
		_spr = obj_player2.spr_shotgunduck;
		break;
	case obj_player1.spr_shotguncrawl:
		_spr = obj_player2.spr_shotguncrawl;
		break;
	case obj_player1.spr_shotgungoduck:
		_spr = obj_player2.spr_shotgungoduck;
		break;
	case obj_player1.spr_fightball:
		_spr = obj_player2.spr_fightball;
		break;
	case obj_player1.spr_squished:
		_spr = obj_player2.spr_squished;
		break;
	case obj_player1.spr_supertaunt1:
		_spr = obj_player2.spr_supertaunt1;
		break;
	case obj_player1.spr_supertaunt2:
		_spr = obj_player2.spr_supertaunt2;
		break;
	case obj_player1.spr_supertaunt3:
		_spr = obj_player2.spr_supertaunt3;
		break;
	case obj_player1.spr_supertaunt4:
		_spr = obj_player2.spr_supertaunt4;
		break;
	case obj_player1.spr_taunt:
		_spr = obj_player2.spr_taunt;
		break;
	case obj_player1.spr_rideweenie:
		_spr = obj_player2.spr_rideweenie;
		break;
}
ds_queue_enqueue(spritequeue, [_spr, obj_player1.image_index]);
