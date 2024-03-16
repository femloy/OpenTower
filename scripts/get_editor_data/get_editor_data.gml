function get_editor_data()
{
	var file = file_text_open_read("editor/data.json")
	var str = ""
	while (!file_text_eof(file))
	{
		str += file_text_readln(file)
		str += "\n"
	}
	file_text_close(file)
	var json = json_parse(str)
	global.editor_data = json
	trace(json)
}
