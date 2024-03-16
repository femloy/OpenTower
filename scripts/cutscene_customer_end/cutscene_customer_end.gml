function cutscene_customer_check(gnome_id, player, gnome)
{
	with obj_gnome_checklist
		gnome_check[gnome_id] = true;
	global.pizzasdelivered++;
	if (instance_exists(obj_gnomecustomerblock))
		instance_destroy(obj_gnomecustomerblock);
	with (instance_create(player.x, player.y, obj_pizzaboxunopen))
	{
		content = gnome.content;
		depth = player.depth;
		visible = false;
	}
	ds_list_add(global.saveroom, gnome.id);
	cutscene_end_action();
}
function cutscene_customer_end(gnome_id)
{
	with obj_customeractor
		happy = true;
	cutscene_end_action();
}
