/// @description Insert description here
// You can write your code in this editor
draw_self();

if (instance_exists(e))
draw_text(e.x,e.y,"current enemy");

draw_circle(x+hspd,y+vspd,16,false);