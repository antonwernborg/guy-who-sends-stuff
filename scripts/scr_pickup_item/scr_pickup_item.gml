/// scr_pickup_item();
function scr_pickup_item(obj, item){
	obj.item = item;
	obj.has_item = true;
	item.pickup = true;
}