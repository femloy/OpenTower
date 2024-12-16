#define gameframe_mouse_in_window
/// gameframe_mouse_in_window()->bool
var _buf = gameframe_prepare_buffer(1);
return gameframe_mouse_in_window_raw(buffer_get_address(_buf), 1);

#define gameframe_init_raw
/// gameframe_init_raw()
var _buf = gameframe_prepare_buffer(8);
buffer_write(_buf, buffer_u64, int64(window_handle()));
gameframe_init_raw_raw(buffer_get_address(_buf), 8);

#define gameframe_syscommand
/// gameframe_syscommand(_sc:number)
var _buf = gameframe_prepare_buffer(8);
buffer_write(_buf, buffer_f64, argument0);
gameframe_syscommand_raw(buffer_get_address(_buf), 8);

#define gameframe_get_monitors_1
/// gameframe_get_monitors_1()->int
var _buf = gameframe_prepare_buffer(1);
return gameframe_get_monitors_1_raw(buffer_get_address(_buf), 1);

#define gameframe_get_double_click_time
/// gameframe_get_double_click_time()->int
var _buf = gameframe_prepare_buffer(1);
return gameframe_get_double_click_time_raw(buffer_get_address(_buf), 1);

#define gameframe_is_natively_minimized
/// gameframe_is_natively_minimized()->bool
var _buf = gameframe_prepare_buffer(1);
return gameframe_is_natively_minimized_raw(buffer_get_address(_buf), 1);

