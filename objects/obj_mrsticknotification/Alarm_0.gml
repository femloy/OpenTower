start = true;
if sprite_index != spr_mrmooney_notification && sprite_index != spr_noisettenotification && sprite_index != spr_noisetterabbitTV
	create_transformation_tip(lang_get_value_newline("mrsticknotification"));
else if sprite_index == spr_noisettenotification
	create_transformation_tip(lang_get_value_newline("noisettenotification"));
else if sprite_index == spr_noisetterabbitTV
	create_transformation_tip(lang_get_value_newline("noisetterabbitnotification"));
else
	create_transformation_tip(lang_get_value_newline("mrmooneynotification"));
