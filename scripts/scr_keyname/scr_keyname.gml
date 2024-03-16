function scr_keyname(_key)
{
	switch _key
	{
		case vk_up:
			return lang_get_value("key_up");
			break;
		case vk_right:
			return lang_get_value("key_right");
			break;
		case vk_left:
			return lang_get_value("key_left");
			break;
		case vk_down:
			return lang_get_value("key_down");
			break;
		case vk_enter:
			return "ENTER";
			break;
		case vk_escape:
			return "ESCAPE";
			break;
		case vk_space:
			return "SPACE";
			break;
		case vk_rshift:
			return "SHIFT";
			break;
		case vk_lshift:
			return "SHIFT";
			break;
		case vk_shift:
			return "SHIFT";
			break;
		case vk_control:
			return "CONTROL";
			break;
		case vk_lcontrol:
			return "CONTROL";
			break;
		case vk_rcontrol:
			return "CONTROL";
			break;
		case vk_alt:
			return "ALT";
			break;
		case vk_lalt:
			return "ALT";
			break;
		case vk_backspace:
			return "BACKSPACE";
			break;
		case vk_tab:
			return "TAB";
			break;
		case vk_home:
			return "HOME";
			break;
		case vk_end:
			return "END";
			break;
		case vk_delete:
			return "DELETE";
			break;
		case vk_insert:
			return "INSERT";
			break;
		case vk_pageup:
			return "PAGE UP";
			break;
		case vk_pagedown:
			return "PAGE DOWN";
			break;
		case vk_pause:
			return "PAUSE";
			break;
		case vk_printscreen:
			return "PRINTSCREEN";
			break;
		case vk_f1:
			return "F1";
			break;
		case vk_f2:
			return "F2";
			break;
		case vk_f3:
			return "F3";
			break;
		case vk_f4:
			return "F4";
			break;
		case vk_f5:
			return "F5";
			break;
		case vk_f6:
			return "F6";
			break;
		case vk_f7:
			return "F7";
			break;
		case vk_f8:
			return "F8";
			break;
		case vk_f9:
			return "F9";
			break;
		case vk_f10:
			return "F10";
			break;
		case vk_f11:
			return "F11";
			break;
		case vk_f12:
			return "F12";
			break;
		case vk_numpad0:
			return "0";
			break;
		case vk_numpad1:
			return "1";
			break;
		case vk_numpad2:
			return "2";
			break;
		case vk_numpad3:
			return "3";
			break;
		case vk_numpad4:
			return "4";
			break;
		case vk_numpad5:
			return "5";
			break;
		case vk_numpad6:
			return "6";
			break;
		case vk_numpad7:
			return "7";
			break;
		case vk_numpad8:
			return "8";
			break;
		case vk_numpad9:
			return "9";
			break;
		case vk_multiply:
			return "MULTIPLY";
			break;
		case vk_divide:
			return "DIVIDE";
			break;
		case vk_add:
			return "ADD";
			break;
		case vk_subtract:
			return "SUBTRACT";
			break;
		case vk_decimal:
			return "DECIMAL";
			break;
		case -1:
			return lang_get_value("option_press_key");
			break;
	}
	
	switch _key
	{
		case vk_backspace:
			return "BACKSPACE";
			break;
		case vk_tab:
			return "TAB";
			break;
		case vk_enter:
			return "ENTER";
			break;
		case vk_pause:
			return "PAUSE";
			break;
		case 20:
			return "CAPS LOCK";
			break;
		case vk_escape:
			return "ESC";
			break;
		case vk_space:
			return "SPACE";
			break;
		case vk_pageup:
			return "PAGEUP";
			break;
		case vk_pagedown:
			return "PAGEDOWN";
			break;
		case vk_end:
			return "END";
			break;
		case vk_home:
			return "HOME";
			break;
		case vk_left:
			return "LEFT";
			break;
		case vk_up:
			return "UP";
			break;
		case vk_right:
			return "RIGHT";
			break;
		case vk_down:
			return "DOWN";
			break;
		case vk_insert:
			return "INSERT";
			break;
		case vk_delete:
			return "DELETE";
			break;
		case ord("0"):
			return "0";
			break;
		case ord("1"):
			return "1";
			break;
		case ord("2"):
			return "2";
			break;
		case ord("3"):
			return "3";
			break;
		case ord("4"):
			return "4";
			break;
		case ord("5"):
			return "5";
			break;
		case ord("6"):
			return "6";
			break;
		case ord("7"):
			return "7";
			break;
		case ord("8"):
			return "8";
			break;
		case ord("9"):
			return "9";
			break;
		case ord("A"):
			return "A";
			break;
		case ord("B"):
			return "B";
			break;
		case ord("C"):
			return "C";
			break;
		case ord("D"):
			return "D";
			break;
		case ord("E"):
			return "E";
			break;
		case ord("F"):
			return "F";
			break;
		case ord("G"):
			return "G";
			break;
		case ord("H"):
			return "H";
			break;
		case ord("I"):
			return "I";
			break;
		case ord("J"):
			return "J";
			break;
		case ord("K"):
			return "K";
			break;
		case ord("L"):
			return "L";
			break;
		case ord("M"):
			return "M";
			break;
		case ord("N"):
			return "N";
			break;
		case ord("O"):
			return "O";
			break;
		case ord("P"):
			return "P";
			break;
		case ord("Q"):
			return "Q";
			break;
		case ord("R"):
			return "R";
			break;
		case ord("S"):
			return "S";
			break;
		case ord("T"):
			return "T";
			break;
		case ord("U"):
			return "U";
			break;
		case ord("V"):
			return "V";
			break;
		case ord("W"):
			return "W";
			break;
		case ord("X"):
			return "X";
			break;
		case ord("Y"):
			return "Y";
			break;
		case ord("Z"):
			return "Z";
			break;
		case ord("["):
			return "LEXPLR";
			break;
		case ord("\\"):
			return "REXPLR";
			break;
		case vk_numpad0:
			return "NUMPAD 0";
			break;
		case vk_numpad1:
			return "NUMPAD 1";
			break;
		case vk_numpad2:
			return "NUMPAD 2";
			break;
		case vk_numpad3:
			return "NUMPAD 3";
			break;
		case vk_numpad4:
			return "NUMPAD 4";
			break;
		case vk_numpad5:
			return "NUMPAD 5";
			break;
		case vk_numpad6:
			return "NUMPAD 6";
			break;
		case vk_numpad7:
			return "NUMPAD 7";
			break;
		case vk_numpad8:
			return "NUMPAD 8";
			break;
		case vk_numpad9:
			return "NUMPAD 9";
			break;
		case vk_multiply:
			return "ASTERISK";
			break;
		case vk_add:
			return "ADD";
			break;
		case vk_subtract:
			return "DIVIDE";
			break;
		case vk_decimal:
			return "DOT";
			break;
		case vk_divide:
			return "SLASH";
			break;
		case vk_f1:
			return "F1";
			break;
		case vk_f2:
			return "F2";
			break;
		case vk_f3:
			return "F3";
			break;
		case vk_f4:
			return "F4";
			break;
		case vk_f5:
			return "F5";
			break;
		case vk_f6:
			return "F6";
			break;
		case vk_f7:
			return "F7";
			break;
		case vk_f8:
			return "F8";
			break;
		case vk_f9:
			return "F9";
			break;
		case vk_f10:
			return "F10";
			break;
		case vk_f11:
			return "F11";
			break;
		case vk_f12:
			return "F12";
			break;
		case 144:
			return "NUMLCK";
			break;
		case 145:
			return "SCROLLLCK";
			break;
		case vk_lshift:
			return "LSHIFT";
			break;
		case vk_rshift:
			return "RSHIFT";
			break;
		case vk_lcontrol:
			return "LCTRL";
			break;
		case vk_rcontrol:
			return "RCTRL";
			break;
		case vk_lalt:
			return "LALT";
			break;
		case vk_ralt:
			return "RALT";
			break;
		case 186:
			return "SEMICOLON";
			break;
		case 187:
			return "EQUAL";
			break;
		case 188:
			return "COMMA";
			break;
		case 189:
			return "UNDERSCR";
			break;
		case 190:
			return "DOT";
			break;
		case 191:
			return "SLASH";
			break;
		case 192:
			return "TILDE";
			break;
		case 219:
			return "LBRACKET";
			break;
		case 220:
			return "VERTBAR";
			break;
		case 221:
			return "RBRACKET";
			break;
		case 222:
			return "APOSTRPH";
			break;
	}
	return chr(_key);
}
