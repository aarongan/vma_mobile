define(["dojo/query",
	"dojo/_base/declare",
	"dojo/_base/lang",
	"dojo/_base/connect",
	"dojo/dom-construct",
	"dojo/dom-style",
	"dijit/registry",
	"dojox/mobile/RoundRect",
	"dojox/mobile/IconItem",
	"dojox/mobile/ListItem",
	"../../config",
	"../../services",
	"../../app/api",
	"../../app/playMedia"], function(query, declare, lang, connect, domConstruct, domStyle, registry, RoundRect, IconItem, ListItem, config, services, api, playMedia){
	return declare("icsMobile-widget-messages-MessageDetails", null, {		
		SentTemplateString: '<div class="Sent textArea"><div class="date">${date}</div><div class="message"></div></div>' + 
						    '<img class="Sent" src="${image}"/>',
						
		ReceivedTemplateString: '<img class="Received" src="${image}"/>' +
								'<div class="Received textArea"><div class="date">${date}</div><div class="message"></div></div>',
								
//	    slideTemplateString: '<div class="action">' 
//									+ '<div class="img"><img src="${src}" style="width: auto; height: 100%"/></div>'
//									+ '<div class="linkSpan save">'
//										+ '<div class="play"></div>'
//									+ '</div>'
//									+ '<div class="text">${captionTxt}</div>'
//								+ '</div>',	
								
		slideTemplateString: '<div class="action">' 
									+ '<div class="img"></div>'
									+ '<div class="text">${captionTxt}</div>'
								+ '</div>',
						
		constructor: function(args){
			var _t = this;
			lang.mixin(_t, args);
			_t.objItem = {};
			_t.startup(_t.messageId);			
			_t = null;
		},	
		
		startup: function(params){	
			var _s, _msgId = params.messageId, _t = this;
			if (_s = _t.store) {
				if(_msgId === _t.selectedItems){
					if(!params.loadPrevMessage){
						console.warn("Same message list item clicked", _msgId);
						return;
					}else{
						_t.selectedItems = _msgId;
						_t._fetchFromServerStore(params.loadPrevMessage);
					}					
				}else{
					_t.selectedItems = _msgId;
					if(!_t.objItem[_msgId]){
						_t._fetchFromServerStore();
					}else{
						_t._fetchFromLocalStore();
					}
				}				                	
			}
		},
		_fetchFromLocalStore: function(){
			var _t = this, 
				_s = _t.store;
            console.warn("get from cached!!!");
            _t._getEachItem(_t.selectedItems, _s.get(_t.selectedItems));
            
            _s = _t = null;
		},
		_fetchFromServerStore: function(loadPrevMessage){
			var _t = this, 
				_s = _t.store;
            api.refresh();
            setTimeout(lang.hitch(_t, function(){
                !_t.objItem[_t.selectedItems] && (_t.objItem[_t.selectedItems] = {});
                _t.objItem[_t.selectedItems].firing = true;
                services.fetchThreadedMessageDetails({
                    start: _t.objItem[_t.selectedItems].start = (_t.objItem[_t.selectedItems].start || 1),
                    count: _t.objItem[_t.selectedItems].count = (_t.objItem[_t.selectedItems].count || 20),
                    messageId: _t.selectedItems
                }).then(lang.hitch(_t, function(response){
                    _t.objItem[_t.selectedItems].hasMore = response.hasMore;
                    _t.objItem[_t.selectedItems].firing = false;
                    _t.objItem[_t.selectedItems].start = _t.objItem[_t.selectedItems].start + _t.objItem[_t.selectedItems].count;
                    _t._getEachItem(_t.selectedItems.toString(), response, loadPrevMessage);
                    _s.put(_t.selectedItems.toString(), response);
                    api.refresh();
                    
                    _st = _t = null;
                }));
            }), 800);
		},
		_getEachItem: function(msgId, params, loadPrevMessage){
			var _t = this;
			_t._createPlayList(params);		
			if (!!loadPrevMessage) {
				_t.loadingNode.destroyRecursive();
				_t.loadingNode = new ListItem({
					"class": "messageDetailsItem loading",
					"innerHTML": "Loading Previous Messages..."
				});
				params.memberHeaders = params.memberHeaders.reverse();
			}
			else {
				_t._scrollToTop();
				_t.parentNode.destroyDescendants();
				
				_t.loadingNode = new dojox.mobile.ListItem({
					"class": "messageDetailsItem loading",
					"innerHTML": "Loading Previous Messages..."
				});
			}
            for (var i = 0, item, len = params.memberHeaders.length; i < len; i++) {
                if ((item = params.memberHeaders[i]) && item.folderName !== "Drafts") {
                    var node = new dojox.mobile.ListItem({
                        "class": "messageDetailsItem"
                    });
                    
					node.containerNode.appendChild(_t._createDetails(item, params.playList));
                    node.placeAt(_t.parentNode, !!loadPrevMessage? "first" : "last");					
                }				
            } 
			if(!!_t.objItem[msgId].hasMore){
				_t.loadingNode.placeAt(_t.parentNode, "first");
			}
			_t._scrollToBottom();         
			_t = i = item = len = node = null;
		},
		_createDetails: function(item, playList){							
			  var _t= this, _type = item.folderName === 'Sent' ? item.folderName : "Received",
				_ttClass = _type === 'Sent' ? 'dijitTooltipLeft' : 'dijitTooltipRight',
				_ttDialog,
				_content,
				_mediaType,
				showImageUrl,
				msgItem ={},
				i = 0, 
				_is, 
				_url,
				_iconItem;

            if ((_is = item.slideList) && _is.length !== 0) {
                while (i < _is.length) {
                    _url = null;
                    
                    /* If messageId exist, use attachPart for downloadAttachment from Mail Store. 
                     * If messageId does not exist, use composerId with attachPath to download from Local Server instead.
                     */
                    if (!item.messageId) {
                        _is[i].composerId = item.composerId;
                        msgItem.attachPath = _is[i].imagePath || _is[i].audioPath || _is[i].videoPath;
                    }
                    else {						
                        //msgItem.attachPath = _is[i].imagePart || _is[i].audioPart || _is[i].videoPart;
						/* Use above line, remove below due to testing purposes */
						msgItem.attachPath = _is[i].imagePath || _is[i].audioPath || _is[i].videoPath;
						/* End testing*/
                    }
                    msgItem.sourceMessageId = item.sourceMessageId || "";
                    msgItem.messageId = item.messageId || "";
                    msgItem.type = item.type || 3; // "3" for mms                    
                    msgItem.folderName = item.folderName || "";
                    msgItem.composerId = _is[i].composerId || "";
					msgItem.receivedDate = item.receivedDate || "";
					msgItem.from = item.from || "";
					msgItem.name = _is[i].imageName || _is[i].audioName || _is[i].videoName
					msgItem.size = _is[i].imageSize || _is[i].audioSize || _is[i].videoSize
                    //thisItem.attachPath = msgItem.attachPath;
                    
                    if (!msgItem.attachPath) {
                        _content = _is[i].captionTxt;
                        showImageUrl = "";
                    }
                    else {
//                        _url = dojo.string.substitute(config.downloadUrlTemplate, {
//                            sourceMessgaeUID: msgItem.sourceMessageId,
//                            messageId: msgItem.messageId,
//                            msgType: 'mms',
//                            folder: msgItem.folderName,
//                            attachPath: msgItem.attachPath,
//                            composerId: msgItem.composerId
//                        });
						/* Use above line, remove below due to testing purposes */
						_url = msgItem.attachPath;
						/* End testing*/

                        if (!!_is[i].imagePath) {
                            _mediaType = "image";
                            showImageUrl = _url;
                        }
                        else 
                            if (!!_is[i].audioPath) {
                                _mediaType = "music";
                                showImageUrl = config.defaultMusicImage;
                            }
                            else 
                                if (!!_is[i].videoPath) {
                                    _mediaType = "video";
                                    showImageUrl = config.defaultVideoImage;
                                }
                                else {
                                    console.error('slideList[i] -> imagePath/audioPath/videoPath are ALL Empty!!!');
                                }
                    }
                    if (i === 0) {
                        _ttDialog = new RoundRect({
                            'class': _ttClass,
                            'innerHTML': _content || ""
                        });
                    }         
                    
                    if (!!showImageUrl) {
						_t._addToPlayList(playList, {
							name: msgItem.name,
                            size: msgItem.size,
                            type: _mediaType,
							date: msgItem.receivedDate,
							from: msgItem.from,
                            playUrl: _url
						});
						
						_iconItem = new IconItem({
							"style": "width: auto; height: 100%; display: inline-block",
							"icon": _url,
							"clickable": true, 
							"moveTo": "mediaSlideView",
							"transition": "slide"
                        });
						
						connect.connect(_iconItem.iconNode, "onclick", lang.hitch(_t, function(msgId, idx){
							playMedia.play(msgId, idx);
						}, _t.selectedItems, playList.length - 1));
						
						var _slideNode = query(".img", domConstruct.create('div', {
                            'class': "slide " + i,
                            'innerHTML': dojo.string.substitute(_t.slideTemplateString, {                           
                                captionTxt: _is[i].captionTxt
                            })
                        }, _ttDialog.containerNode))[0];

						_iconItem.placeAt(_slideNode);
						_iconItem.startup();						
                    }
				i++;
                }                
            }
            else {
                _content = item.body;
                _ttDialog = new RoundRect({
                    'class': _ttClass,
                    'innerHTML': _content || ""
                });
            }
            var _tempDiv = domConstruct.create('div', {
                'innerHTML': dojo.string.substitute(_t[_type + "TemplateString"], {
                    image: item.senderIcon || config.defaultProfileImage,
                    type: _type,
                    date: item.receivedDate
                })
            });			
			query(".message", _tempDiv)[0].appendChild(_ttDialog.domNode);
			return _tempDiv;
		},
		_scrollToTop: function(){
            registry.byId("msgDetails").scrollTo({
                x: 0,
                y: 0
            });
		},
		_scrollToBottom: function(){
			var _node = registry.byId("msgDetails"),		
				_oHeight = _node.getDim().o.h;
			          
            registry.byId("msgDetails").scrollTo({
                x: 0,
                y: _oHeight * -1
            });
			_oHeight = _node = null;
		}, 
		_createPlayList: function(params){
			/* Create a list of playList in the store*/
            params.playList = [];
            /* End */
		}, 
		_addToPlayList: function(playList, obj){
			playList.push(obj);
		}

	})		
});