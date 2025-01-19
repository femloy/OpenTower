function get_list_pos(cursor_y)
{
	return floor(((cursor_y - y) - scroll) / item_height);
}
