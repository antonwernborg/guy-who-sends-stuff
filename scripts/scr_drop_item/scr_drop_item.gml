/// scr_drop_item();
function scr_drop_item(obj, item){
	if (instance_exists(item))
	item.pickup = false;
	
	obj.item = noone;
	obj.has_item = false;
}