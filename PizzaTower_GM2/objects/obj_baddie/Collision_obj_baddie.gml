if (object_index == other.object_index && image_xscale == other.image_xscale && hsp != 0 && other.hsp != 0 && id < other.id && state != "grabbed" && state != "stun" && state != "turn" && other.state != "turn" && other.state != "grabbed" && other.state != "stun")
{
	hsp = -other.image_xscale;
}
