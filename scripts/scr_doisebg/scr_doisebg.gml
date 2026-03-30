function doisebg_start()
{
	if (live_call()) return live_result;
	if (event_type == ev_draw && event_number == 0 && instance_exists(obj_player1))
	{
		shader_set(global.Pal_Shader);
		if ((obj_player1.character == "N" || obj_player1.character == "PUP") || global.swapmode)
		{
			pal_swap_set(spr_noiseboss_palette, 1, false);
		}
		else
		{
			pal_swap_set(spr_noiseboss_palette, 2, false);
		}
	}
}

function doisebg_end()
{
	if (live_call()) return live_result;
	if (event_type == ev_draw && event_number == 0 && instance_exists(obj_player1))
	{
		shader_reset();
	}
}

function doisebg_set_layer(_layer)
{
	var lay = layer_get_id(_layer);
	layer_script_begin(lay, doisebg_start);
	layer_script_end(lay, doisebg_end);
}
