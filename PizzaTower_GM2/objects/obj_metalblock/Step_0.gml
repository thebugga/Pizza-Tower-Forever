with (obj_player1)
{
	if ((place_meeting(x + hsp, y, other) || place_meeting(x + xscale, y, other)) && (obj_player1.state == "mach3" || obj_player1.state == "mach3" || (obj_player1.ghostdash == true && obj_player1.ghostpepper >= 3) || obj_player1.ratmount_movespeed >= 12 || obj_player1.state == "rocket" || obj_player1.state == "knightpepslopes" || obj_player1.state == "shoulderbash"))
	{
		playerindex = 0;
		instance_destroy(other);
	}
	else if  ((place_meeting(x + hsp, y, other) || place_meeting(x + xscale, y, other)) && !(obj_player1.state == "mach3" || obj_player1.state == "mach3" || (obj_player1.ghostdash == true && obj_player1.ghostpepper >= 3) || obj_player1.ratmount_movespeed >= 12 || obj_player1.state == "rocket" || obj_player1.state == "knightpepslopes" || obj_player1.state == "shoulderbash"))
	{
		with other
		{
			alarm[0] = 20;
		}
	}
}
if (place_meeting(x, y + 1, obj_player1) || place_meeting(x, y - 1, obj_player1) || place_meeting(x - 1, y, obj_player1) || place_meeting(x + 1, y, obj_player1))
{
	if (obj_player1.ghostdash == true && obj_player1.ghostpepper >= 3)
	{
		instance_destroy();
	}
	if (place_meeting(x, y - 1, obj_player1) && ((obj_player1.state == "freefall" || obj_player1.state == "superslam") && obj_player1.freefallsmash >= 10))
	{
		playerindex = 0;
		instance_destroy();
	}
	if (place_meeting(x, y - 1, obj_player1) && (((obj_player1.state == "ratmountbounce" || obj_player1.state == "noisecrusher") && obj_player1.vsp > 0) || obj_player1.state == "knightpep" || obj_player1.state == "hookshot"))
	{
		playerindex = 0;
		instance_destroy();
	}
}
with (obj_player2)
{
	if ((place_meeting(x + hsp, y, other) || place_meeting(x + xscale, y, other)) && (obj_player2.state == "mach3" || obj_player2.state == "machcancel" || obj_player2.state == "knightpepslopes" || obj_player2.state == "shoulderbash"))
	{
		playerindex = 1;
		instance_destroy(other);
	}
}
if (place_meeting(x, y + 1, obj_player2) || place_meeting(x, y - 1, obj_player2) || place_meeting(x - 1, y, obj_player2) || place_meeting(x + 1, y, obj_player2))
{
	if (place_meeting(x, y - 1, obj_player2) && ((obj_player2.state == "freefall" || obj_player2.state == "superslam") && obj_player2.freefallsmash >= 10))
	{
		playerindex = 1;
		instance_destroy();
	}
	if (place_meeting(x, y - 1, obj_player2) && (obj_player2.state == "knightpep" || obj_player2.state == "hookshot"))
	{
		playerindex = 1;
		instance_destroy();
	}
}

if sprite_index == spr_metaltowerblock_laugh && ANIMATION_END 
		sprite_index = spr_metaltowerblock;