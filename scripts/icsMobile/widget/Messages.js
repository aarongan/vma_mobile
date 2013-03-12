define(["dojo/_base/declare",
	"dojo/_base/connect",
	"dojox/mobile/Button",
	"dijit/_WidgetBase", 
	"dijit/_TemplatedMixin",
	"dijit/_WidgetsInTemplateMixin",
	"dojox/mobile/TextBox",
	"dojo/dom-attr",
	"dojo/dom-style",
	"../services",
	"../data/Stores",
	"../config",
	"./messages/MessageLists",
	"./messages/MessageDetails",
	"dojo/text!icsMobile/widget/templates/Messages.html"], function(declare, connect, Button, _WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixin, TextBox, domAttr, domStyle, services, Stores, config, MessageLists, MessageDetails, template){        
        return declare("icsMobile.widget.Messages", [_WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixin], {
            templateString: template,

			constructor: function(){},
			postCreate: function(){
				var _t = this;
				_t.inherited(arguments);
				_t.startup();
				
				_t._initMessageLists();
				
				connect.connect(_t.messageListsView, "onFlickAnimationEnd", _t, "_onListsFlickAnimationEnd");
				connect.connect(_t.messageDetailsView, "onFlickAnimationEnd", _t, "_onDetailsFlickAnimationEnd");
				_t = null;
			},
			_onListsFlickAnimationEnd: function(event){           
                if (!!event) {
					var _t = this, _s,
					_b = Math.abs(_t.messageListsView.getPos().y);
					_oheight = _t.messageListsView.getDim().o.h;
					if (_b === _oheight) {
						if ((_s = _t.MessageLists) && !_s.firing && _s.numRows > _s.fetchRows) {
							_t._initMessageLists();
						}
					}  
					_t = _s = _b = _oheight = null;               
                }
			},
			_onDetailsFlickAnimationEnd: function(event){           
                if (!!event) {
					var _t = this, _s,
					_b = _t.messageDetailsView.getPos().y;				
					if (_b === 0) {
						if ((_s = _t.MessageDetails) && _s.objItem && _s.objItem[_s.selectedItems] && !!_s.objItem[_s.selectedItems].hasMore && !_s.objItem[_s.selectedItems].firing) {
                            _t._initMessageDetails({
                                messageId: _s.selectedItems,
								loadPrevMessage: true
                            });
						}
					}  
					_t = _s = _b = null;               
                }
			} ,
			_initMessageLists: function(){   
				var _t = this;             
                if (!!_t.MessageLists) {					
                    _t.MessageLists.startup();
                }
                else {
                    this.MessageLists = new MessageLists({
                        store: new Stores({
                            name: "MessageLists"
                        }),
                        start: 1,
                        count: 20,
                        parentNode: _t.messageListsNode,
                        onInitMsgDetails: dojo.hitch(_t, _t._initMessageDetails),
						onReady: dojo.hitch(_t, function(){
							//console.warn('i am messges ready!!!!;')
							_t.onMessageListsReady();
						})
                    });
					_t = null;
                }

			},
			_initMessageDetails: function(params){
				var _t = this;
				if (!!_t.MessageDetails) {
					_t.MessageDetails.startup(params);
				}
				else {
                    _t.MessageDetails = new MessageDetails({
                        store: new Stores({
                            name: "MessageDetails",
                            referenceStore: "MessageLists"
                        }),
                        parentNode: _t.messageDetailsNode,
                        messageId: params
                    });
					_t = null;
				}
			},
			/* Stub funciton*/
			onMessageListsReady: function(){}
        })
});

