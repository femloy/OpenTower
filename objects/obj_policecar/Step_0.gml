if state != states.policetaxi
{
	var xx = obj_player1.x;
	var yy = obj_player1.y;
	var ixs = obj_player1.xscale;
	ds_queue_enqueue(followqueue, [xx, yy, ixs]);
	if (ds_queue_size(followqueue) > LAG_STEPS)
	{
		var b = ds_queue_dequeue(followqueue);
		x = b[0];
		y = b[1];
		image_xscale = b[2];
	}
}
else
{
	x += hsp;
	y += vsp;
}
