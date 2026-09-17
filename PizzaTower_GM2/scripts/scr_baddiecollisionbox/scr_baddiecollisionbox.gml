function baddiecollisionbox_update(_baddie)
{
	if (_baddie.cutscene == false && _baddie.state != "firemouth")
	{
		with (_baddie)
		{
			var _destroy = false;
			var _stagger = false;
			if (instance_exists(other.baddieID) && instakillmove == true && other.baddieID.state != "grabbed" && other.baddieID.thrown == false && !other.baddieID.invincible && other.baddieID.instantkillable)
			{
				if (state == "mach3" && sprite_index != spr_mach3hit)
				{
					if (fightball == false)
					{
						sprite_index = spr_mach3hit;
					}
					image_index = 0;
					_destroy = true;
				}
				else if (state == "Sjump" || (state == "freefall" && freefallsmash > 10))
				{
					_destroy = true;
				}
				if ((state == "mach2" || state == "machroll") && grounded)
				{
					machpunchAnim = true;
					image_index = 0;
				}
				if (!grounded && state != "freefall" && key_jump2)
				{
					if (state == "mach2" || (state == "mach3" && fightball == false))
					{
						sprite_index = spr_mach2jump;
					}
					suplexmove = false;
					vsp = -11;
				}
				if (!_destroy && !_stagger)
				{
					if (other.baddieID.hp > 0)
					{
						_stagger = true;
						if (state == "freefall" && freefallsmash < 10)
						{
							vsp = -11;
							state = "jump";
							sprite_index = spr_jump;
						}
					}
					else
					{
						_destroy = true;
					}
				}
				
				if (_destroy)
				{
					if (other.baddieID.elite && other.baddieID.elitehit > 0)
					{
						with (other.baddieID)
						{
							elitehit = 0;
							state = "stun";
							vsp = -7;
							image_xscale = -other.xscale;
							hsp = other.xscale * 5;
						}
					}
					else
					{
						instance_destroy(other.baddieID);
						if (!other.baddieID.important)
						{
							global.hit += 1;
							global.combotime = 60;
							global.heattime = 60;
						}
					}
				}
				if (_stagger && other.baddieID.state != "staggered")
				{
					with (other.baddieID)
					{
						hp -= ((state == "mach2" || state == "machroll") ? 1 : 2);
						state = (hp > 0) ? "staggered" : "stun";
						stagger_buffer = stagger_max;
						stagger_dir = other.xscale;
					}
				}
			}
			var pepp_grab = false;
			
			if (instance_exists(other.baddieID) && y < other.baddieID.y && attacking == false && sprite_index != spr_player_mach2jump && (state == "jump" || state == "mach1" || state == "grab") && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep && !other.baddieID.invincible && other.baddieID.stompable)
			{
				if (x != other.baddieID.x)
				{
					other.baddieID.image_xscale = -sign(other.baddieID.x - x);
				}
				image_index = 0;
				other.baddieID.stagger_buffer = other.baddieID.stagger_max;
				other.baddieID.stagger_dir = xscale;
				if (key_jump2)
				{
					instance_create(x, y + 50, obj_stompeffect);
					stompAnim = true;
					other.baddieID.image_index = 0;
					vsp = -14;
					if (state != "grab")
					{
						sprite_index = spr_stompprep;
					}
				}
				else
				{
					instance_create(x, y + 50, obj_stompeffect);
					stompAnim = true;
					other.baddieID.image_index = 0;
					vsp = -9;
					if (state != "grab")
					{
						sprite_index = spr_stompprep;
					}
				}
			}
			if (instance_exists(other.baddieID) && !pepp_grab && !_stagger && !_destroy && other.baddieID.thrown == false && other.baddieID.stuntouchbuffer == 0 && other.baddieID.vsp > 0 && state != "faceplant" && state != "punch" && state != "tackle" && state != "superslam" && state != "pogo" && state != "machslide" && state != "pummel" && other.baddieID.state != "grabbed" && other.baddieID.state != "pummel" && state != "freefall" && state != "grab" && state != "mach2" && state != "handstandjump" && state != "hurt" && other.baddieID.state != states.chase && state != "mach3" && state != "machroll" && state != "climbwall" && other.baddieID.bumpable && !other.baddieID.invincible)
			{
				if (state != "bombpep" && state != "mach1" && state != "crouchslide" && character != "M")
				{
					movespeed = 0;
				}
				other.baddieID.stuntouchbuffer = 50;
				if (other.baddieID.object_index == obj_pizzaball)
				{
					global.golfhit += 1;
				}
				if (x != other.baddieID.x)
				{
					other.baddieID.image_xscale = -sign(other.baddieID.x - x);
				}
				other.baddieID.stagger_buffer = other.baddieID.stagger_max;
				other.baddieID.stagger_dir = xscale;
				other.baddieID.state = (other.baddieID.hp > 0) ? "staggered" : "stun";
				other.baddieID.image_index = 0;
			}
			if (instance_exists(other.baddieID) && state == "handstandjump" && !other.baddieID.invincible)
			{
				if (other.baddieID.state != "stun")
				{
					state = "pummel";
					sprite_index = spr_grab;
					image_speed = 0.35;
					image_index = 0;
					other.baddieID.state = "pummel";
					other.baddieID.grabbedby = (object_index == obj_player1) ? 1 : 2;
				}
				else if (other.baddieID.thrown == false)
				{
					movespeed = 0;
					image_index = 0;
					sprite_index = spr_haulingstart;
					state = "grab";
					baddiegrabbedID = other.baddieID;
					other.baddieID.state = "grabbed";
					other.baddieID.grabbedby = 1;
				}
				else
				{
					if (other.baddieID.thrown == true && !key_up)
					{
						other.baddieID.hsp = xscale * 25;
						other.baddieID.vsp = 0;
					}
					else if (!key_up)
					{
						other.baddieID.hsp = xscale * 6;
						image_index = 0;
						state = "tackle";
						baddiegrabbedID = other.baddieID;
						movespeed = 0;
						other.baddieID.vsp = -6;
						scr_throwenemy();
					}
					else
					{
						other.baddieID.vsp = -14;
						other.baddieID.hsp = 0;
					}
					sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch);
					image_index = 0;
					state = "tackle";
					movespeed = 0;
					scr_throwenemy();
				}
			}
		}
	}
}
