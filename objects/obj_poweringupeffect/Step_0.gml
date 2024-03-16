if (!instance_exists(bossID))
	exit;
x = bossID.x;
switch bossID.object_index
{
	case obj_noiseboss:
		if ((bossID.sprite_index == spr_noise_vulnerablesmile || bossID.sprite_index == spr_noise_vulnerable1 || bossID.sprite_index == spr_noise_vulnerable1loop || bossID.sprite_index == spr_noise_vulnerable2) && bossID.state == states.walk && bossID.phase > 1)
			visible = true;
		else
			visible = false;
		break;
	default:
		if bossID.sprite_index == visible_spr && bossID.phase > 1
			visible = true;
		else 
			visible = false;
}
