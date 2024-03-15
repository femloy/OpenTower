image_speed = 0.35;
uparrowID = scr_create_uparrowhitbox();
showmoney = false;
money_y = Wave(-5, 5, 2, 2);
depth = 50;
maxscore = 90;

idlespr = spr_mrmooney_idle;
smilespr = spr_mrmooney_smile;
if (!obj_player1.ispeppino || global.swapmode)
{
	idlespr = spr_noisetterabbit_idle;
	smilespr = spr_noisetterabbit_takemoney;
}
sprite_index = idlespr;
