if got && player != 0
{
	global.collect += 3000;
	global.combotime = 60;
	with (instance_create(x + 16, y, obj_smallnumber))
		number = string(3000);
}
instance_destroy(effectid);
