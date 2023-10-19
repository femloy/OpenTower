if (instance_exists(baddieID) && baddieID.object_index != obj_banditochicken && baddieID.object_index != obj_pizzagoblin && baddieID.object_index != obj_pizzafaceboss && baddieID.object_index != obj_pizzafaceboss_p2 && baddieID.object_index != obj_pizzafaceboss_p3 && baddieID.object_index != obj_pepperman && baddieID.object_index != obj_vigilanteboss && baddieID.object_index != obj_noiseboss && baddieID.object_index != obj_fakepepboss && baddieID.object_index != obj_treasureguy && baddieID.object_index != obj_gustavograbbable && baddieID.object_index != obj_canongoblin && baddieID.object_index != obj_tank && baddieID.destroyable)
{
	instance_destroy(baddieID);
	instance_destroy();
}
