function Instakill()
{
	var hx = other.baddieID.x;
	var hy = other.baddieID.y;
	if (other.baddieID.state == "hit")
	{
		hx = other.baddieID.hitX;
		hy = other.baddieID.hitY;
	}
	other.baddieID.grabbedby = 1;
	if (object_index == obj_player2)
	{
		other.baddieID.grabbedby = 2;
	}
	if (state == "firemouth")
	{
		repeat (8)
		{
			with (instance_create(other.baddieID.x, other.baddieID.y, obj_firemouthflame))
			{
				hsp = random_range(5, 10);
				vsp = random_range(5, 10);
			}
		}
	}
	if (state == "mach3" && sprite_index != spr_player_Sjumpcancel && sprite_index != spr_mach3hit)
	{
		if (sprite_index != spr_fightball)
		{
			sprite_index = spr_mach3hit;
		}
		image_index = 0;
	}
	if (character == "Noise" && state == "boxxedpepspin")
	{
		sprite_index = spr_playerN_boxxedhit;
		image_index = 0;
	}
	if (state == "chainsawbump" && sprite_index != spr_player_chainsawhit)
	{
		image_index = 0;
		sprite_index = spr_player_chainsawhit;
	}
	other.baddieID.invtime = 25;
	suplexmove = true;
	if (object_index == obj_player1)
	{
		other.baddieID.grabbedby = 1;
	}
	else
	{
		other.baddieID.grabbedby = 2;
	}
	fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y);
	if (other.baddieID.elite && other.baddieID.object_index != obj_pepperman && other.baddieID.object_index != obj_pizzafaceboss && other.baddieID.object_index != obj_vigilanteboss && other.baddieID.object_index != obj_noiseboss && other.baddieID.object_index != obj_fakepepboss && other.baddieID.object_index != obj_pf_fakepep && other.baddieID.object_index != obj_pizzafaceboss_p3)
	{
		other.baddieID.elitehit = 0;
	}
	other.baddieID.player_instakillmove = true;
	if (!other.baddieID.important)
	{
		global.style += (2 * global.combo);
	}
	if (!other.baddieID.elite || other.baddieID.elitehit <= 0)
	{
		other.baddieID.mach3destroy = true;
	}
	if (!other.baddieID.killprotection && !global.kungfu && (!other.baddieID.elite || other.baddieID.elitehit <= 0))
	{
		other.baddieID.instakilled = true;
	}
	if (!other.baddieID.important)
	{
		global.combotime = 60;
		global.heattime = 60;
	}
	global.hit += 1;
	if (!grounded && state != "ratmountgroundpound" && state != "ratmountpunch" && state != "ratmountpunch" && state != "boxxedpepspin" && state != "freefall" && (key_jump2 || input_buffer_jump > 0 || state == "jetpackjump"))
	{
		input_buffer_jump = 0;
		suplexmove = false;
		vsp = -11;
	}
	if (state == "boxxedpepspin")
	{
		if (key_jump2)
		{
			vsp = -10;
		}
		boxxedpepjump = 10;
		noisejetpack = 80;
	}
	if (state != "chainsaw")
	{
		tauntstoredmovespeed = movespeed;
		tauntstoredsprite = sprite_index;
		tauntstoredstate = state;
		tauntstoredvsp = vsp;
		if (state == "ghost")
		{
			tauntstoredhsp = hsp;
		}
	}
	if (state == "handstandjump" && !key_slap && ispeppino)
	{
		image_index = random_range(0, image_number - 1);
		if (grounded)
		{
			sprite_index = spr_player_groundedattack;
		}
		else
		{
			sprite_index = spr_player_ungroundedattack;
		}
	}
	if (state == "chainsawbump" && !global.kungfu)
	{
		sprite_index = spr_player_chainsawhit;
		image_index = 0;
	}
	var lag;
	if (other.baddieID.heavy == true)
	{
		lag = 15;
	}
	else
	{
		lag = 5;
	}
	other.baddieID.hitLag = lag;
	other.baddieID.hitX = hx;
	other.baddieID.hitY = hy;
	other.baddieID.hp -= 1;
	hitLag = lag;
	hitX = x;
	hitY = y;
	instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect);
	other.baddieID.alarm[3] = 3;
	other.baddieID.state = "hit";
	other.baddieID.image_xscale = -xscale;
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
	if (state != "mach2" && state != "tumble")
	{
		with (instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect))
		{
			sprite_index = spr_kungfueffect;
		}
	}
	other.baddieID.hithsp = xscale * (movespeed + 2);
	if (abs(other.baddieID.hithsp) < 10)
	{
		other.baddieID.hithsp = xscale * 10;
	}
	other.baddieID.hitvsp = -5;
	if ((state == "machcancel" || (state == "ratmountbounce" && character == "Noise")) && move != 0)
	{
		other.baddieID.hithsp = movespeed + (sign(movespeed) * 2);
		if (abs(other.baddieID.hithsp) < 10)
		{
			if (move != 0)
			{
				other.baddieID.hithsp = move * 10;
			}
			else
			{
				other.baddieID.hithsp = xscale * 10;
			}
		}
	}
	state = "chainsaw";
}
// unused hp ver
/* 
function Instakill()
{
	var hx = boxID.baddieID.x;
	var hy = boxID.baddieID.y;
	if (boxID.baddieID.state == "hit")
	{
		hx = boxID.baddieID.hitX;
		hy = boxID.baddieID.hitY;
	}
	boxID.baddieID.grabbedby = 1;
	if (object_index == obj_player2)
	{
		boxID.baddieID.grabbedby = 2;
	}
	if (obj_player1.state == "firemouth")
	{
		repeat (8)
		{
			with (instance_create(boxID.baddieID.x, boxID.baddieID.y, obj_firemouthflame))
			{
				hsp = random_range(5, 10);
				vsp = random_range(5, 10);
			}
		}
	}
	if (obj_player1.state == "mach3" && obj_player1.sprite_index != spr_player_Sjumpcancel && obj_player1.sprite_index != obj_player1.spr_mach3hit)
	{
		if (sprite_index != obj_player1.spr_fightball)
		{
			sprite_index = obj_player1.spr_mach3hit;
		}
		image_index = 0;
	}
	if (obj_player1.character == "Noise" && obj_player1.state == "boxxedpepspin")
	{
		sprite_index = spr_playerN_boxxedhit;
		image_index = 0;
	}
	//if (obj_player1.state == "chainsawbump" && obj_player1.sprite_index != spr_player_chainsawhit)
	//{
	//	image_index = 0;
	//	sprite_index = spr_player_chainsawhit;
	//}
	boxID.baddieID.invtime = 25;
	suplexmove = true;
	if (object_index == obj_player1)
	{
		boxID.baddieID.grabbedby = 1;
	}
	else
	{
		boxID.baddieID.grabbedby = 2;
	}
	fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y);
	if (boxID.baddieID.elite && boxID.baddieID.object_index != obj_pepperman && boxID.baddieID.object_index != obj_pizzafaceboss && boxID.baddieID.object_index != obj_vigilanteboss && boxID.baddieID.object_index != obj_noiseboss && boxID.baddieID.object_index != obj_fakepepboss && boxID.baddieID.object_index != obj_pf_fakepep && boxID.baddieID.object_index != obj_pizzafaceboss_p3)
	{
		boxID.baddieID.elitehit = 0;
	}
	boxID.baddieID.player_instakillmove = true;
	if (!boxID.baddieID.important)
	{
		global.style += (2 * global.combo);
	}
	if (!boxID.baddieID.elite || boxID.baddieID.elitehit <= 0)
	{
		boxID.baddieID.mach3destroy = true;
	}
	if (!boxID.baddieID.killprotection && !global.kungfu && (!boxID.baddieID.elite || boxID.baddieID.elitehit <= 0))
	{
		boxID.baddieID.instakilled = true;
	}
	if (!boxID.baddieID.important)
	{
		global.combotime = 60;
		global.heattime = 60;
	}
	global.hit += 1;
	with obj_player1
	{
		if (!grounded && state != "ratmountgroundpound" && state != "ratmountpunch" && state != "ratmountpunch" && state != "boxxedpepspin" && state != "freefall" && (key_jump2 || input_buffer_jump > 0 || state == "jetpackjump"))
		{
			input_buffer_jump = 0;
			suplexmove = false;
			vsp = -11;
		}
		if (state == "boxxedpepspin")
		{
			if (key_jump2)
			{
				vsp = -10;
			}
			boxxedpepjump = 10;
			noisejetpack = 80;
		}
	}
	if (obj_player1.state != "chainsaw")
	{
		tauntstoredmovespeed = movespeed;
		tauntstoredsprite = sprite_index;
		tauntstoredstate = state;
		tauntstoredvsp = vsp;
		if (state == "ghost")
		{
			tauntstoredhsp = hsp;
		}
	}
	if (obj_player1.state == "handstandjump" && !key_slap && ispeppino)
	{
		image_index = random_range(0, image_number - 1);
		if (grounded)
		{
			sprite_index = spr_player_groundedattack;
		}
		else
		{
			sprite_index = spr_player_ungroundedattack;
		}
	}
	if (obj_player1.state == "chainsawbump" && !global.kungfu)
	{
		sprite_index = spr_player_chainsawhit;
		image_index = 0;
	}
	var lag;
	if (boxID.baddieID.heavy == true)
	{
		lag = 15;
	}
	else
	{
		lag = 5;
	}
	boxID.baddieID.hitLag = lag;
	boxID.baddieID.hitX = hx;
	boxID.baddieID.hitY = hy;
	boxID.baddieID.hp -= 1;
	hitLag = lag;
	hitX = x;
	hitY = y;
	instance_create(boxID.baddieID.x, boxID.baddieID.y, obj_parryeffect);
	boxID.baddieID.alarm[3] = 3;
	boxID.baddieID.state = "hit";
	boxID.baddieID.image_xscale = -xscale;
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
	if (obj_player1.state != "mach2" && obj_player1.state != "tumble")
	{
		with (instance_create(boxID.baddieID.x, boxID.baddieID.y, obj_parryeffect))
		{
			sprite_index = spr_kungfueffect;
		}
	}
	boxID.baddieID.hithsp = xscale * (movespeed + 2);
	if (abs(boxID.baddieID.hithsp) < 10)
	{
		boxID.baddieID.hithsp = xscale * 10;
	}
	boxID.baddieID.hitvsp = -5;
	with obj_player1
	{
		if ((state == "machcancel" || (state == "ratmountbounce" && character == "Noise")) && move != 0)
		{
			boxID.baddieID.hithsp = movespeed + (sign(movespeed) * 2);
			if (abs(boxID.baddieID.hithsp) < 10)
			{
				if (move != 0)
				{
					boxID.baddieID.hithsp = move * 10;
				}
				else
				{
					boxID.baddieID.hithsp = xscale * 10;
				}
			}
		}
	}
	state = "chainsaw";
}
*/