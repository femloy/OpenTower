enum debug_text_type
{
	normal,
	command,
	traced,
	error
}

// Enables the console if test build
#macro debug (GM_build_type == "run")
