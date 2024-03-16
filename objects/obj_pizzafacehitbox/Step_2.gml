if (!instance_exists(baddieID))
{
	instance_destroy();
	exit;
}
x = baddieID.x;
y = baddieID.y;
if baddieID.state == states.walk
	sprite_index = spr_pizzaface_attackend;
else
	sprite_index = baddieID.mask_index;
if !obj_player1.ispeppino
	sprite_index = spr_pizzaface_attackend;
mask_index = sprite_index;
