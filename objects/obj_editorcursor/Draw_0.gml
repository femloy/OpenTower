if (obj_editor.editor_state == editor_states.instance_edit && obj_editor.instance_state == inst_states.idle && ((!instance_exists(hovered_object)) || (hovered_object.object_index != obj_editorobject && object_get_parent(hovered_object.object_index) != obj_component)))
{
	var o = obj_editor.selected_object
	if o != noone
	{
		var pos = editor_get_world_pos()
		draw_sprite(asset_get_index(o.sprite_index), 0, snap_tile((pos[0] + o.xoffset), o.snap_tile_val), snap_tile((pos[1] + o.yoffset), o.snap_tile_val))
	}
}
