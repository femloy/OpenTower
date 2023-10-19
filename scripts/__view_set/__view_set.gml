function __view_set(prop, index, val)
{
	var __prop = prop;
	var __index = index;
	var __val = val;

	__view_set_internal(__prop, __index, __val);

	var __res = __view_get(__prop, __index);

	return __res;
}
