/// Movement


// Player Input
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);
pickup_key = keyboard_check_pressed(vk_space);

// Calculate Input
hinput = (right - left);
vinput = (down - up);

if (vinput != 0) or (hinput != 0)
{
    dir = point_direction(0,0,hinput,vinput);
    lenx = lengthdir_x(spd,dir);
    leny = lengthdir_y(spd,dir);
        
} else {
    hinput = 0;
    vinput = 0;
}

if (hinput != 0)
{
    hspd += hinput*acc;
    hspd = clamp(hspd,-lenx,lenx);
} else {
    hspd = lerp(hspd,0,fric);
}
    
if (vinput != 0)
{
    vspd += vinput*acc;
    vspd = clamp(vspd,-leny,leny);
} else {
    vspd = lerp(vspd,0,fric);
}


// Horizontal Collisions
if (place_meeting(x+hspd,y,obj_solid))
{
	while(!place_meeting(x+sign(hspd),y,obj_solid))
	{
		x += sign(hspd);	
	}
	hspd = 0;
}
x += hspd;

// Vertical Collision
if (place_meeting(x,y+vspd,obj_solid))
{
	while(!place_meeting(x,y+sign(vspd),obj_solid))
	{
		y += sign(vspd);	
	}
	vspd = 0;
}
y += vspd;


// Handling items
if (pickup_key)
{
	/// picking up items
	if (!has_item)
	{
		if  (distance_to_object(obj_pickup) < pickup_dist)
		{
			inst = instance_nearest(x,y,obj_pickup);
			scr_pickup_item(id,inst);
		}
	} else {
		// dropping or delivering items
	
		// move the item
		var idir = dir;
		if (idir == 0) idir = 180;
		var ix = x+lengthdir_x(pickup_buffer,idir);
		var iy = y+lengthdir_y(pickup_buffer,idir);
		
		if (place_free(ix,iy))
		{
			//change buffer has same dir player is facing
			item.x = ix;
			item.y = iy;
		}
		
		// deliver if the player is close to the postbox
		if (distance_to_object(obj_postbox) < send_dist)
		{
			scr_send_item(id, item);
		}
		
		// remove the item
		scr_drop_item(id, item);
	
	}
}

// Check if dead
if (hp <= 0)
{
	instance_destroy()	
}

// Powerups
inst = instance_place(x,y,obj_powerup);
if (inst != noone)
{
	spd = max_spd;
	alarm[0] = powerup_cooldown;
	with inst instance_destroy();	
}

//camera_get_view_x()

// Make the view follow the player
/*view_xview[0] += ((x-(view_wview[0]/2)) - view_xview[0]) * 0.06; 
view_yview[0] += ((y-(view_hview[0]/2)) - view_yview[0]) * 0.06;  
