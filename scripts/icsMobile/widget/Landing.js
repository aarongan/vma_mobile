define(["dojo/_base/declare",
		"dojo/dom",
		"dojo/_base/lang",
		"dojo/_base/Deferred", 
		"../config",
		"../app/api",
		"./Messages",
		"dijit/_WidgetBase", 
		"dijit/_TemplatedMixin",
		"dijit/_WidgetsInTemplateMixin",
		"dojo/text!icsMobile/widget/templates/Landing.html"], function(declare, dom, lang, Deferred, config, api, Messages, _WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixin, template){			      
		return declare("icsMobile.widget.Landing", [_WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixin], {
			templateString: template,
			postCreate: function(){
				var _t = this;
				_t.inherited(arguments);	
				
				_t.startup();
				_t._initialize();
				_t = null;
			},
			startup: function(){
				this.inherited(arguments);
			},
			_initialize: function(){
				var _t = this;
                new Messages({
                    onMessageListsReady: lang.hitch(_t, function(){
                        api.refresh();
						_t._ready();
                    })
                }, _t.messagesNode);
			},
			_ready: function(){
				this.onReady();
			}
		})
});
