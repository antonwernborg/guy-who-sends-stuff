/// Picking up bråkstakare
if (instance_exists(obj_enemy))
{
	e = enemies[enemy_current];

	if (e.state != "follow") // Follow the enemy if he isnt caught already
	dir = point_direction(x,y,e.x,e.y);
	else // Follow the door if the enemy is caught
	dir = point_direction(x,y,obj_door.x,obj_door.y);

	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
	
	scr_movement_collision();
	
	/// If collision with the enemy, make him follow the boss
	if (place_meeting(x,y,e))
	{
		e.state = "follow";
	}

	/// If enemy collides with door, DESTROY HIM HEUHEUHEUHEU
	if (place_meeting(e.x,e.y,obj_door))
	{
		enemy_current++;
		with e instance_destroy();
	}
} else {
	/// Go to door
	dir = point_direction(x,y,obj_door.x,obj_door.y);

	hspd = lengthdir_x(spd,dir);
	vspd = lengthdir_y(spd,dir);
	
	if (place_meeting(x,y,obj_door))
	{
		instance_destroy();
	}	
}