switch (obj_player1.character)
{
	case "N":
		shader_set(global.Pal_Shader);
		pal_swap_set(spr_noiseboss_palette, 1, false);
		draw_self();
		shader_reset();
		break;
		
	default:
		draw_self();
		break;
}