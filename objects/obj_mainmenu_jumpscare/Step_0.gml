image_xscale += 0.2;
image_yscale += 0.2;
if image_xscale > 5 && true // "true" os check?
	game_end();
if image_xscale > 8
{
	with obj_mainmenu
		jumpscarecount = 0;
	instance_destroy();
}
