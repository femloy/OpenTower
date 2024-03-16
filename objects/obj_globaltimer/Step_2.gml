if use_livesplit && ls_buffer >= 0
{
	buffer_poke(ls_buffer, MAGICsize + 96, buffer_f64, global.file_minutes);
	buffer_poke(ls_buffer, MAGICsize + 104, buffer_f64, global.file_seconds);
	buffer_poke(ls_buffer, MAGICsize + 112, buffer_f64, global.level_minutes);
	buffer_poke(ls_buffer, MAGICsize + 120, buffer_f64, global.level_seconds);
	buffer_poke(ls_buffer, MAGICsize + 128, buffer_string, room_get_name(room));
	buffer_poke(ls_buffer, MAGICsize + 192, buffer_u8, instance_exists(obj_endlevelfade));
	if (instance_exists(obj_bosscontroller))
		buffer_poke(ls_buffer, MAGICsize + 193, buffer_u8, obj_bosscontroller.boss_hp);
	else
		buffer_poke(ls_buffer, MAGICsize + 193, buffer_u8, 0);
}
