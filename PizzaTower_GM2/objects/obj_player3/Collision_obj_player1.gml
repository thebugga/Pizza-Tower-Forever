if (other.cutscene == false && other.state != "actor" && state != "actor" && other.state != "gotoplayer" && state != "gotoplayer")
{
	if (hurted == false && other.hurted == false && fightballadvantage == true && (state == "handstandjump" || state == "punch") && (other.state == "handstandjump" || other.state == "punch"))
	{
		if (object_index == obj_player1)
		{
			obj_player1.state = "mach3";
			obj_player2.state = "grabbed";
			obj_player2.xscale = xscale;
			obj_player1.depth = -7;
			obj_player2.depth = -6;
		}
		if (object_index == obj_player2)
		{
			obj_player2.state = "mach3";
			obj_player1.state = "grabbed";
			obj_player1.xscale = xscale;
			obj_player1.depth = -6;
			obj_player2.depth = -7;
		}
		obj_player1.image_index = 0;
		obj_player2.image_index = 0;
		obj_player1.sprite_index = obj_player1.spr_fightball;
		obj_player2.sprite_index = obj_player2.spr_fightball;
		obj_player1.fightball = true;
		obj_player2.fightball = true;
	}
	with (obj_player1)
	{
		if (state == "handstandjump" && other.hurted == false && other.state != "hurt" && other.state != "knightpepslopes" && other.state != "knightpep" && other.state != "tumble" && other.state != "fireass" && other.state != "bombpep" && other.cutscene == false && other.hurted == false && hurted == false && !(other.state == "handstandjump" || other.state == "punch"))
		{
			movespeed = 0;
			image_index = 0;
			sprite_index = spr_haulingstart;
			baddiegrabbedID = other.id;
			state = "grab";
			other.state = "grabbed";
			obj_player1.depth = -7;
			obj_player2.depth = -6;
		}
		if (state == "freefall" && other.hurted == false && other.state != "stunned" && other.state != "hurt" && hurted == false)
		{
			obj_player1.depth = -7;
			obj_player2.depth = -6;
			obj_player2.state = "stunned";
			obj_player2.sprite_index = obj_player2.spr_squished;
			obj_player2.image_index = 0;
		}
		if (other.state == "punch" && hurted == false && other.hurted == false && !(state == "handstandjump" || state == "punch"))
		{
			with (other)
			{
				scr_pummel();
			}
			xscale = -other.xscale;
			obj_player1.depth = -6;
			obj_player2.depth = -7;
			thrown = true;
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_baddiegibs);
			instance_create(x, y, obj_baddiegibs);
			instance_create(x, y, obj_baddiegibs);
			with (obj_camera)
			{
				shake_mag = 3;
				shake_mag_acc = 3 / room_speed;
			}
			state = "hurt";
			x = obj_player2.x;
			y = obj_player2.y;
			alarm[8] = 60;
			alarm[7] = 120;
			movespeed = 15;
			vsp = -6;
			xscale = -other.xscale;
			sprite_index = spr_hurt;
		}
	}
}
