enum particle
{
	enum_start, // not to be used
	
	cloudeffect,
	crazyrunothereffect,
	highjumpcloud1,
	highjumpcloud2,
	jumpdust,
	balloonpop,
	shotgunimpact,
	impact,
	genericpoofeffect,
	keyparticles,
	teleporteffect,
	landcloud,
	ratmountballooncloud,
	groundpoundeffect,
	noisegrounddash,
	bubblepop,
	
	enum_length // not to be used
}
enum part_type
{
	normal,
	fadeout
}

if instance_number(obj_particlesystem) > 1
{
	instance_destroy();
	exit;
}
depth = -99;
global.particle_system = part_system_create();
global.part_map = ds_map_create();
global.part_depth = ds_map_create();
global.part_emitter = part_emitter_create(global.particle_system);
global.debris_list = ds_list_create();
global.collect_list = ds_list_create();

var p = declare_particle(particle.cloudeffect, spr_cloudeffect, 0.5, -4)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.crazyrunothereffect, spr_crazyrunothereffect, 0.5, -99)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.highjumpcloud1, spr_highjumpcloud1, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.highjumpcloud2, spr_highjumpcloud2, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.jumpdust, spr_jumpdust, 0.35, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.balloonpop, spr_balloonpop, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.shotgunimpact, spr_shotgunimpact, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.impact, spr_impact, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.genericpoofeffect, spr_genericpoofeffect, 0.35, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.bubblepop, spr_antigrav_bubblepop, 0.35, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.keyparticles, spr_keyparticles, 0.35, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.teleporteffect, spr_teleporteffect, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.landcloud, spr_landcloud, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.noisegrounddash, spr_noisegrounddasheffect, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.ratmountballooncloud, spr_ratmountballooncloud, 0.7, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.groundpoundeffect, spr_groundpoundeffect, 0.35, 0)
part_type_speed(p, 0, 0, 0, 0)
