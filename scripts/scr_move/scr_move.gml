/// scr_move();
function scr_move(spd, dir)
{
	x += lengthdir_x(spd,dir);
	y += lengthdir_y(spd,dir);
}