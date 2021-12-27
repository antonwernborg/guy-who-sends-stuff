// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_send_item(obj, item){
	add = 0;
	if (item == obj_pickup) add = 30 else add = -10;
	obj.score_points += add;
	show_debug_message("Sended!");
	instance_destroy(item);
}