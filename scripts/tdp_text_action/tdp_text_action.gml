enum tdp_text
{
	halign,
	valign,
	text,
	font
}

function tdp_text_action_halign(alignment)
{
	var b = 
	{
		type: tdp_text.halign,
		value: alignment
	};
	ds_queue_enqueue(global.tdp_text_queue, b);
}
function tdp_text_action_valign(alignment)
{
	var b = 
	{
		type: tdp_text.valign,
		value: alignment
	};
	ds_queue_enqueue(global.tdp_text_queue, b);
}
function tdp_text_action_font(font)
{
	var b = 
	{
		type: tdp_text.font,
		value: font
	};
	ds_queue_enqueue(global.tdp_text_queue, b);
}
function tdp_text_action_text(x, y, text, c1 = c_white, c2 = c_white, c3 = c_white, c4 = c_white, alpha = 1)
{
	var b = 
	{
		type: tdp_text.text,
		x: x,
		y: y,
		text: text,
		c1: c1,
		c2: c2,
		c3: c3,
		c4: c4,
		image_alpha: alpha
	};
	ds_queue_enqueue(global.tdp_text_queue, b);
}
