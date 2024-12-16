instance_destroy(obj_tutorialbook);
trace(arr[pos]);

with instance_create(obj_player1.x, obj_player1.y, obj_tutorialbook)
{
    text = lang_get_value(other.arr[other.pos]);
    event_perform(ev_other, ev_room_start);
}

pos++;
if pos >= array_length(arr)
{
    instance_destroy();
    exit;
}
