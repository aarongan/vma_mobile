define(["dojo/_base/declare",
	"dojo/_base/lang",
	"dojo/_base/connect",
	"dojo/dom-construct",
	"dojo/dom-attr",
	"dojo/dom-class",
	"dijit/registry",
	"../../config",
	"../../services"], function(declare, lang, connect, domConstruct, domAttr, domClass, registry, config, services){
	return declare("icsMobile.widget.messages.MessageList", null, {
		templateString: '<img src="${image}"/>'
					 	+ '<div class="textArea">'
							+ '<div class="textCutOff date">${date}</div>'
							+ '<div class="textCutOff threadLength ${thdClass}">${threadLength}</div>'
							+ '<div class="textCutOff name">${name}</div>'
							+ '<div class="textCutOff subject">${subject}</div>'
						+ '</div>', 
		constructor: function(args){
			var _t = this;
			lang.mixin(_t, args);			
			_t.startup();
			connect.connect(_t.domNode, "onclick", _t, "_handleEvent");			
			_t = null;
		},	
		_handleEvent: function(event){
            event = event || window.event;			
            event.preventDefault();
            var _t = this, 
				node = event.target || event.srcElement, 
				i;
            while (node && (node !== _t.domNode)) {
                switch (node.id) {
                    default:                    
                    if (i = domAttr.get(node, "i")) {
						_t._setMessageLists(node);
                        _t[domAttr.get(node, "fn")]({
                            messageId: i
                        });
                    }
                }
                node = node.parentNode;
            }
            _t = node = i = null;
		},
		
		startup: function(){
			var _t = this,
				wrapperNode = document.createDocumentFragment(),
				parentNode = _t.parentNode,
				_s, i, item, len;
            if (_s = _t.store) {
                _t.firing = true;
                services.fetchHeaderList({
                    start: _t.start,
                    count: _t.count
                }).then(lang.hitch(_t, function(response){
                    //setTimeout(lang.hitch(_t, function(){
                        if (!_t.numRows) {
                            _t.numRows = response.numRows;
                        }
                        
                        if (!_t.loadingNode) {
                            _t.loadingNode = new dojox.mobile.ListItem({
                                "class": "messageListsItem loading",
                                "innerHTML": "Load More Items..."
                            });
                        }
                        else {
                            parentNode.removeChild(_t.loadingNode);
                        }
						
                        for (i = 0, item, len = response.items.length; i < len; i++) {
                            item = response.items[i];
                            if (item.messageId !== 0) {
                                var node = new dojox.mobile.ListItem({
                                    "class": "messageListsItem " + (!!item.read ? "read" : ""),
									"noArrow": true,
									"moveTo": "msgDetails",
									"transition": "slide",						
                                });
                                domAttr.set(node.domNode, "i", item.messageId);
                                domAttr.set(node.domNode, "fn", "_initMessageDetails");
                                
								node.set("label", _t._createLists(item));
                                node.placeAt(wrapperNode, "last");								
								node.startup();
                                
								_s.put(item.messageId.toString(), item);
								_t.fetchRows = (_t.fetchRows || 0) + 1; 
                            }
                        }
						
						parentNode.domNode.appendChild(wrapperNode);                        
                        if (_t.numRows > _t.fetchRows) {
                            _t.loadingNode.placeAt(parentNode, "last");							
							_t.loadingNode.startup();
                            _t.start = _t.start + _t.count;
                        }
						_t.onReady();
                        _t.firing = false;
                        _t = _s = i = item = len = node = wrapperNode = parentNode = null;		
                    //}), 800);		
                }));
            }
		}, 
		_createLists: function(item){                 
           return dojo.string.substitute(this.templateString, {
			    image: config.defaultProfileImage,
			    date: item.receivedDateShortTxt,
			    threadLength: !!item.threadLength ? "&nbsp;" + item.threadLength + "&nbsp;" : "",
				thdClass: !!item.threadLength ? "" : "dijitHidden",
			    name: item.from[0].name || item.from[0].emailAddress,
			    subject: item.subject
			});
		},
		_setMessageLists: function(node){
			var _t = this;
			if(!!_t.selectedNode){
                domClass.remove(_t.selectedNode, "selected");				
			}
			_t.selectedNode = node;
            domClass.add(node, "selected");
			_t = null;
		},
		_initMessageDetails: function(){
			var _arg = arguments[0];
			this.onInitMsgDetails(_arg);
			_arg = null;
		},
		
		/* Stub function */
		onInitMsgDetails: function(){},
		onReady: function(){}
	})		
});