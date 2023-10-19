var _found = false;
with (obj_player)
{
	if (state == states.mort || state == states.mortjump || state == states.mortattack || state == states.morthook)
		_found = true;
}
if (_found)
	image_alpha = 1;
else
	image_alpha = 0.5;
