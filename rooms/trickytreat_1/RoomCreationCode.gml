pal_swap_init_system(9)
global.roommessage = "PIZZA TOWER AT HALLOWEEN"
global.gameframe_caption_text = lang_get_value("caption_halloween")
notification_push((60 << 0), [room])
ds_list_clear(global.saveroom)
ds_list_clear(global.baddieroom)
with (obj_pumpkincounter)
{
    if (counter <= 0)
        create_transformation_tip(lang_get_value("halloween"))
}
instance_destroy(obj_pumpkincounter)
if (obj_player1.state == (16 << 0))
    instance_create(0, 0, obj_softlockcrash)
