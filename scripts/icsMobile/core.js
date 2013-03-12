define(["dojo/dom",
		"dojo/ready",
		"dojo/_base/lang",
		"dojo/_base/Deferred", 
		"./config",
		"./app/api",
		"./widget/Messages",
		"./widget/Landing"], function(dom, ready, lang, Deferred, config, api, Messages, Landing){
		var _t = this;				      
		return {
			init: lang.hitch(_t, function(){
//				_t.msg = new Messages({
//					onMessageListsReady: lang.hitch(_t, function(){
//						api.refresh();
//						
//					})
//				});
//				_t.msg.placeAt(config.ids.CONTAINER_ID);
				ready(function(){
					var landing = new Landing({
						onReady: function(){
							console.warn('i am landing ready!!1');
						}
					})
					api.refresh();
					landing.placeAt(config.ids.CONTAINER_ID);
					//landing.startup();
				})		
				
				//api.refresh();
			})
		}
});
