/// Following the player
if (pickup)
{
	x = (obj_player.x)+sign(obj_player.hinput);
	y = (obj_player.y-buffer)+sign(obj_player.vinput);
}
/*
else
{
	var inst = instance_place(x,y,obj_postbox);
	if (inst != noone)
	{
		obj_player.score_points += 50;
		show_debug_message(obj_player.score_points);
	}
}*/