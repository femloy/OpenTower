scroll_y = SCREEN_HEIGHT + 100;
init_pos = 0;
depth = -100;
finish = false;
credits_arr = array_create(0);
var arr1 = array_create(0);
var arr2 = array_create(0);
for (var i = 0; i < array_length(global.credits_arr); i++)
{
	var b = string_replace_all(global.credits_arr[i], "\n", "");
	if b != "CHIVALROUS CUSTOMERS" && b != "COOL CUSTOMERS" && b != "WEENIE CUSTOMERS" && b != "CHEESY CUSTOMERS"
	{
		if ((i % 2) == 0)
			array_push(arr2, b);
		else
			array_push(arr1, b);
	}
	else
	{
		if ((i % 2) == 0)
			array_push(arr2, " ");
		array_push(arr1, b);
		array_push(arr2, b);
	}
}
array_push(credits_arr, arr1, arr2);
var a1l = array_length(arr1);
var a2l = array_length(arr2);
if a1l >= a2l
	len = a1l;
else
	len = a2l;
