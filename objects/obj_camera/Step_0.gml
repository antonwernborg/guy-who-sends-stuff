/// Camera view

// Follow the player
x = obj_player.x;
y = obj_player.y;

// Set up the camera
v = view_camera[0];
vx = camera_get_view_x(v);
vy = camera_get_view_y(v);
vw = camera_get_view_width(v);
vh = camera_get_view_height(v);

// Update variables
vx += ((x-(vw/2)) - vx) * 0.06; 
vy += ((y-(vh/2)) - vy) * 0.06;

// Move the camera
camera_set_view_pos(v,vx,vy);