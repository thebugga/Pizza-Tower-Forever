if (showtext == 1)
{
    y = Approach(y, 30, 2);
}
if (showtext == 0)
{
    y = Approach(y, -50, 1);
}
if global.panic
{
	showtext = 0;
}
