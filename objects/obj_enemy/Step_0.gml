// Switching between states

if (instance_exists(obj_player))
{
	// Attack state
	dir_to_player = point_direction(self.x, self.y, obj_player.x, obj_player.y);
	dis_to_player = point_distance(self.x, self.y, obj_player.x, obj_player.y);

	if (state != "follow")
	{
		if (dis_to_player < atk_dis) 
		{
			state = "attack";
		}

		// Wander state
		if (dis_to_player > atk_dis) 
		{
			state = "wander";
		}
	}

	// What to do in the different states heheh
	switch state
	{
		case "idle":
			/// Idle state
			break;
		
		case "wander":
			/// wander state
				scr_move(walk_spd, rnd_dir);
			
				if (alarm[0] <= 0)
				{
					alarm[0] = wander_cooldown;
					rnd_dir = random_range(0, 360);
				}
		
				// change direction if colliding w wall
				if (place_meeting(x,y,obj_solid))
				{
					rnd_dir = -rnd_dir;
				}
			break;
		
		case "attack":
			/// attack state
				scr_move(run_spd, dir_to_player);
			
				/// collision w player
				var inst = instance_place(x,y,obj_player);
				if (inst != noone)
				{
					inst.hp -= 10;
					inst.score_points -= 10;
					if(inst.has_item)
					{
						scr_drop_item(inst, inst.item);
					}
					scr_knockback(inst, force);
				}
			break;
		
		case "follow":
			/// Follow the boss
			dir = point_direction(x,y,obj_boss.x,obj_boss.y);
			scr_move(obj_boss.spd-0.1, dir);
			break;
	}
}



/// Move and collide
scr_movement_collision();
