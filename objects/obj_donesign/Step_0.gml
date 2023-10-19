ini_open("saveData.ini");
global.treasure1 = ini_read_real("Treasure", "t1", 0);
global.treasure2 = ini_read_real("Treasure", "t2", 0);
ini_close();
if (door == "b1")
{
	if (global.treasure1 == 1)
		visible = true;
	else
		visible = false;
}
if (door == "b2")
{
	if (global.treasure2 == 1)
		visible = true;
	else
		visible = false;
}
