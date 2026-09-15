if (hurted == false && other.grounded == false && other.team == 0 && (state != "backbreaker" || parrytimer <= 0) && state != "parry")
{
	instance_destroy(other);
	instance_create(x, y, obj_canonexplosion);
}
