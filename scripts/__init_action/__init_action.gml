function __init_action()
{
	if (live_call()) return live_result;
	gml_pragma( "global", "__init_action();");
	//global.__part_syst=-1;
	global.__part_emit=[];
	//global.__argument_relative=false;
	global.__part_type=[];
	
	for( var i=0; i<=15; ++i) 
	{
		global.__part_type[i] = -1;
		global.__part_emit[i] = -1;
	}
}
