addseconds--;
seconds++;
if seconds >= 60
{
	minutes++;
	seconds = 0;
}
if addseconds > 0
	alarm[2] = 2;
else
	alarm[0] = 60;
