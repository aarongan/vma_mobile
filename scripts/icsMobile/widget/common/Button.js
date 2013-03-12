define(["dojo/_base/declare",
		"dojox/mobile/Button", 
		"dojox/mobile/_ItemBase",
		"dojox/mobile/ListItem"], function(declare, Button, ItemBase, ListItem){
	return declare("icsMobile.widget.common.Button", [Button, ItemBase], {
		onClick: ListItem.prototype.onClick,
		select: function(){
			this.onSelect();
		},
		onSelect: function(){}
	})
});
