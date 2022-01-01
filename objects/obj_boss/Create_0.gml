/// Variables
alarm[0] = room_speed;

// Catching enemies
enemy_count = instance_number(obj_enemy);
enemy_current = 0;

for (i = 0; i < enemy_count; i++;)
{
    enemies[i] = instance_find(obj_enemy,i);
}

if (instance_exists(obj_enemy))
e = enemies[enemy_current];

// Movement
hspd = 0;
vspd = 0;
dir = 0;
spd = 0;
walk_spd = 1.25;