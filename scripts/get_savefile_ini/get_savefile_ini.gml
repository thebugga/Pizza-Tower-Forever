function get_savefile_ini(peppino = true)
{
    if peppino == undefined
    peppino = 1
	if global.swapmode
		peppino = false;
    return concat("saveData", global.currentsavefile, ".ini");
}