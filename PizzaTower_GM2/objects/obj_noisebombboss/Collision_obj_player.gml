if (!other.hurted && other.state != "parry" && (other.state != "backbreaker" || !instance_exists(obj_parryhitbox)))
{
	instance_destroy();
}
