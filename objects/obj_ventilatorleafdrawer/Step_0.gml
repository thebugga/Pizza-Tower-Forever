for (var i = 0; i < array_length(leaves); i++)
{
	var b = leaves[i];
	if (scr_update_leaf(b))
	{
		array_delete(leaves, i--, 1);
		b = undefined;
	}
}