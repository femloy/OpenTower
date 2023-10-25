function EditorObject(argument0, argument1, argument2, argument3, argument4) constructor //EditorObject
{
    if (argument4 == undefined)
        argument4 = 32
    sprite_index = argument2
    object_index = argument3
    mask_index = argument2
    name = argument1
    ID = argument0
    xoffset = 0
    yoffset = 0
    snap_tile_val = argument4
}

