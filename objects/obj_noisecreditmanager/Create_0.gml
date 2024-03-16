credits = [
	// an early testing version.
	{name: "Laser", heads: [0, 6, 17]},  
	{name: "Fishibi", heads: [1, 9, 16, 58, 61, 83, 111]},  
	{name: "R_K", heads: [2, 10]},  
	{name: "Scotty", heads: [3, 8, 24]},  
	{name: "Skidsii", heads: [4, 23, 25, 26, 59, 60, 66, 74]},  
	{name: "spookyrick", heads: [5]},  
	{name: "Lother", heads: [7, 84]},  
	{name: "Randy", heads: [11, 12, 13, 14]},  
	{name: "Scott", heads: [15]},  
	{name: "MyDude", heads: [18, 70]}
];

credits = global.noisecredits_arr;
finish = false;

var yy = SCREEN_HEIGHT + 300;
for (var i = 0; i < array_length(credits); i++)
{
	var credit = credits[i];
	with instance_create(SCREEN_WIDTH / 2, yy, obj_noisecredit)
	{
		name = credit.name;
		for (var j = 0; j < array_length(credit.heads); j++)
		{
			var head = credit.heads[j];
			array_push(heads, 
			{
				image_index: head,
				visible: false,
				scale: 1
			});
		}
	}
	yy += 400;
}
