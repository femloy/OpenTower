draw_self();
if (instance_exists(obj_monstertrackingrooms))
{
	draw_set_color(c_white);
	draw_text(x, y - 32, string(obj_monstertrackingrooms.pineapple_effect));
}
