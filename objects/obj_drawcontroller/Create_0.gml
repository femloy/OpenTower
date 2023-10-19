if (instance_number(object_index) > 1)
{
	instance_destroy();
	exit;
}
depth = -7;
finisher_alpha = 0;
kidsparty_lightning = false;
dark_lightning = false;
flash = 0;
surf = -4;
surf2 = -4;
bg_alpha = 0.5;
circle_alpha_out = 0.4;
circle_alpha_in = 1;
circle_size_out = 178;
circle_size_in = 128;
patrolcone_tex = -4;
flash_arr = [obj_vigilantecow, obj_targetguy];
use_dark = false;
dark_alpha = 1;
dark_arr = ["Tiles_1", "Tiles_2", "Tiles_3", "Tiles_4"];
objdark_arr = [obj_parryeffect, obj_uziprojectile, obj_pistolbullet, obj_rancherbullet_debris, obj_targetguy, obj_exitgustavo, obj_vigilantecrate, obj_vigilantebazooka, obj_escapespawn, obj_followcharacter, obj_metalblock, obj_destructibles, obj_collect, obj_bigcollect, obj_giantcollect, obj_secretportal, obj_vigilantecow, obj_cowstampede, obj_cowfall, obj_vigilantedynamite, obj_hppickup, obj_vigilantecow, obj_stampedecloud, obj_ladderhorizontal, obj_vigilanteshot];
