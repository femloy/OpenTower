if (room == rank_room)
    instance_destroy()
selected = 0
minutes = 0
seconds = 25
if (room != secret_entrance)
    start = true;
alarm[0] = 60
startstate = -4
isgustavo = 0
shotgunAnim = 0
global.noisejetpack = 0
if (room != chateau_secret2)
    instance_destroy(obj_trapghost)
switch room
{
    case medieval_secret4:
        startstate = states.knightpep
        break
    case medieval_secret5:
        startstate = states.knightpep
        break
    case badland_secret2:
        startstate = states.firemouth
        break
    case forest_secret1:
        isgustavo = true;
        break
    case forest_secret3:
        isgustavo = true;
        break
    case street_secret2:
        isgustavo = true;
        break
    case street_secret3:
        isgustavo = true;
        break
    case freezer_secret1:
        global.noisejetpack = true;
        break
    case war_secret1:
        shotgunAnim = true;
        break
    case war_secret2:
        shotgunAnim = true;
        break
    case war_secret3:
        shotgunAnim = true;
        break
}

obj_player1.shotgunAnim = shotgunAnim
obj_player1.holycross = 0
instance_destroy(obj_crosspriest_cross)
if (isgustavo != obj_player.isgustavo)
{
    if isgustavo
        scr_switchgustavo()
    else
        scr_switchpeppino()
    with (obj_player)
    {
        tauntstoredstate = (isgustavo ? states.ratmount : states.normal)
        tauntstoredsprite = sprite_index
    }
}
switch startstate
{
    case noone:
        with (obj_player)
        {
            if (!isgustavo)
            {
                tauntstoredstate = states.normal
                tauntstoredsprite = spr_idle
            }
            else
            {
                tauntstoredstate = states.ratmount
                tauntstoredsprite = spr_player_ratmountidle
            }
            tauntstoredmovespeed = 0
            tauntstoredhsp = 0
        }
        break
	
    case states.knightpep:
        with (obj_player)
        {
            tauntstoredstate = states.knightpepslopes
            tauntstoredsprite = spr_knightpepdownslope
            tauntstoredmovespeed = 0
            tauntstoredhsp = 0
        }
        break
	
    case states.firemouth:
        with (obj_player)
        {
            tauntstoredstate = states.firemouth
            tauntstoredsprite = spr_firemouth
            tauntstoredmovespeed = 0
            tauntstoredhsp = 0
        }
        break
}

