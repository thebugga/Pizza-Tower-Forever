var p = noone;
if (player == 1)
{
	p = obj_player.id;
}
else if (player == 2)
{
	p = obj_player2.id;
}
p.state = states.normal;
p.landAnim = false;
