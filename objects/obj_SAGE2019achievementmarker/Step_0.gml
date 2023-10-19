if (picy == 640)
{
	if (snickshotgun == 0 && global.SAGEshotgunsnick == 1)
	{
		up = true;
		sprite = bg_SAGEsnickshotgun;
		snickshotgun = true;
		alarm[0] = 250;
	}
	else if (dungeonbackup == 0 && global.SAGEdungeonbackup == 1)
	{
		up = true;
		sprite = bg_SAGEdungeonbackup;
		dungeonbackup = true;
		alarm[0] = 250;
	}
	else if (srank == 0 && global.SAGEsrank == 1)
	{
		up = true;
		sprite = bg_SAGEsrank;
		srank = true;
		alarm[0] = 250;
	}
	else if (snicksrank == 0 && global.SAGEsnicksrank == 1)
	{
		up = true;
		sprite = bg_SAGEsnicksrank;
		snicksrank = true;
		alarm[0] = 250;
	}
	else if (combo10 == 0 && global.SAGEcombo10 == 1)
	{
		up = true;
		sprite = bg_SAGEcombo10;
		combo10 = true;
		alarm[0] = 250;
	}
	else if (secret == 0 && global.SAGEsecret == 1)
	{
		up = true;
		sprite = bg_SAGEsecret;
		secret = true;
		alarm[0] = 250;
	}
	else if (knight == 0 && global.SAGEknight == 1)
	{
		up = true;
		sprite = bg_SAGEknight;
		knight = true;
		alarm[0] = 250;
	}
	else if (toppin == 0 && global.SAGEtoppin == 1)
	{
		up = true;
		sprite = bg_SAGEtoppin;
		toppin = true;
		alarm[0] = 250;
	}
	else if (treasure == 0 && global.SAGEtreasure == 1)
	{
		up = true;
		sprite = bg_SAGEtreasure;
		treasure = true;
		alarm[0] = 250;
	}
}
if (picy == 300)
	up = false;
if (up == 1)
	picy -= 10;
