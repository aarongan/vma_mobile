define(["dojo/dom-construct",
		"dojo/_base/connect",
		"dojo/_base/lang",
		"dijit/registry",
		"dojox/mobile/SwapView",
		"dojox/mobile/ListItem",
		"../stores"], function(domConstruct, connect, lang, registry, SwapView, ListItem, stores){
            return {
				prevId: null,
				currentPlayList: [],
				imagePlayList: [],
				musicPlayList: [],
				videoPlayList: [],
				headerTemplates: "<div class='header'>" + 
								"<div class='top'>" +
									"<div class='name'>${name}</div>" + 
									"<div class='page'>${page}</div>" + 
									"<div class='size'>${size}</div>" + 
								"</div>" +
								"<div class='bottom'>" +
									"<div class='from'>${from}&nbsp;at&nbsp;</div>" + 
									"<div class='date'>${date}</div>" + 
								"</div>" +
								"</div>",
				play: function(msgId, idx){
					var _t = this, _header, item, _view, _viewWidget, _viewerArry;
					if (!!msgId && msgId !== this.prevId) {
						_t.currentPlayList = [];
						_t.imagePlayList = [];
						_t.musicPlayList = [];
						_t.videoPlayList = [];					
						_viewWidget = registry.byId('mediaSlideView');
                        _viewerArry = dojo.query(".mblSwapView", _viewWidget.domNode);
						
                        for (var i = 0; i < _viewerArry.length; i++) {
							registry.byNode(_viewerArry[i]).destroyRecursive();
                        }
						_t.item = item = stores.MessageDetails.get(msgId).playList;
                        for (var i = 0, len = item.length; i < len; i++) {
							
                            _view = new SwapView({
                                selected: (idx === i) ? true : false
                            });
							
                            _header = dojo.string.substitute(_t.headerTemplates, {
                                name: item[i].name,
                                date: item[i].date,
								size: item[i].size,
								from: item[i].from[0].name || item[i].from[0].emailAddress, 
                                page: (i + 1) + " of " + (len)
                            })
                            
                            if (item[i].type === "image") {
                                _innerHTML = _header + "<img src=" + item[i].playUrl + ">";
                            }
                            else 
                                if (item[i].type === "music") {
                                    _innerHTML = _header + "<audio controls='controls'><source src=" + item[i].playUrl + " type='audio/mpeg' /><source src=" + item[i].playUrl + " type='audio/ogg' /></video>"
                                }
                                else {
                                    _innerHTML = _header + "<video controls='controls'><source src=" + item[i].playUrl + " type='video/mp4' /><source src=" + item[i].playUrl + " type='video/ogg' /></video>"
                                }							
                            domConstruct.create('div', {
                                "class": item[i].type + "Div",
                                innerHTML: _innerHTML + "<div style='margin-top: 1%'><input data-dojo-type='dojox.mobile.TextBox' placeHolder='Testing Tablet Keyboard!!!' /><div>"
                            }, _view.placeAt(_viewWidget).domNode);
							
                            _view.startup();
							_t[item[i].type + "PlayList"].push(i);
							_t.currentPlayList.push(_view);
                            if (idx === i) {
                                _view.show();
                            }
                        }											
						_t.showList();						
						_t.prevId = msgId;
					}else{
						_t.currentPlayList[idx].show();
					}
				},
				showList: function(){
					var _t = this, _type = ["image", "music", "video"], _list,
					_viewWidget = registry.byId('mediaListViewContainer');			
					
					domConstruct.empty(_viewWidget.containerNode);
					_viewWidget.destroyDescendants();
    
					for(var i = 0; i < _type.length; i++){
						if((_list = _t[_type[i] + "PlayList"]) && _list.length !== 0){
							domConstruct.create("div", {
								"class": "header",
								"innerHTML": _type[i].toUpperCase()
							}, _viewWidget.containerNode);
							for(var k = 0; k < _list.length; k++){
								var _item = new ListItem({
									"class": _type[i],
                                    "label": "<img src=" + _t.item[_list[k]].playUrl + ">",
									moveTo: "mediaSlideView",
									transition: "cover"
								});
								connect.connect(_item, "onClick", lang.hitch(_t, function(idx){
									_t.play(_t.prevId, idx);
								}, _list[k]));
								_item.placeAt(_viewWidget.containerNode);
								_item.startup();
							}
						}
					}				
				}
			}
});
