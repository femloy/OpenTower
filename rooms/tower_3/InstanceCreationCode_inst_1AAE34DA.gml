gate_sprite = spr_gate_noise
bgsprite = spr_gate_noiseBG
if ((!obj_player1.ispeppino) || global.swapmode)
{
	gate_sprite = spr_gate_doise
	bgsprite = spr_gate_doiseBG
}
targetRoom = boss_noise
save = "w3stick"
group_arr = ["bossgroup"]
maxscore = global.stickreq[2]
