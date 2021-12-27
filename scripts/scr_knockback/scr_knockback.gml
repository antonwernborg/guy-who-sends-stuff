/// scr_knockback();
function scr_knockback(obj, force){

/// Knockback
var knockback_dir = point_direction(x,y,obj.x,obj.y);

lenx = lengthdir_x(force,knockback_dir);
leny = lengthdir_y(force,knockback_dir);

obj.hspd += lenx;
obj.vspd += leny;

}
