define("icsMobile/services", ["dojo/_base/xhr", "./stores", "./config", "./app"], function(xhr, stores, config, app){
	var urls, defaultParams, fetch;	
    urls = {
        _fetchHeaderList: '../inbox/service/fetchHeaderList.action',
		_fetchThreadedMessageDetails: '../inbox/service/_fetchThreadedMessageDetails.action'
    }    
    //>>excludeStart('isStatic', !kwArgs.isStatic)
    if (config.isStatic) {
        urls = {
            //_getPreferences: '../simulation/inbox/getPrefs.action',
            _fetchHeaderList: '../simulation/inbox/fetchHeaderList(texts).json',
			_fetchThreadedMessageDetails: '../simulation/inbox/fetchThreadedMessageDetails(text).action'
        }
    }
    //>>excludeEnd('isStatic')
	
    defaultParams = {
        sync: true,
        preventCache: true,
        handleAs: "json",
        timeout: 30 * 1000,
		headers: {
			accept: 'application/json,application/javascript'
		}
    },
	
	_fetch = function(url, reqObj, xhrType, handle, requestName){
            var dfd = new dojo.Deferred(), req = {}, params;
            reqObj = reqObj || null;
            requestName = requestName || 'request';
            req[requestName] = reqObj;
            params = dojo.delegate(defaultParams, {
                url: url,
                postData: app.objToQuery(req),
            });            
			return dfd = xhr[xhrType](params);
	}
	return {
        fetchHeaderList: function(options){
			var reqObj = {
				start: 1,
				count: 50,
				sortBy: "DATE",
				type: "text", 
				folder: "Inbox"
			}
            reqObj = dojo.delegate(reqObj, {
				start: options.start,
				count: options.count
			});
			
			return _fetch(urls._fetchHeaderList, reqObj, "post");
        },
		
		fetchThreadedMessageDetails: function(options){
            var reqObj = {
                start: 1,
				count: 50,
                sortBy: "DATE",
                type: "text",				
                folder: "UnifiedInbox"
            };
			 reqObj = dojo.delegate(reqObj, {
				start: options.start,
				count: options.count,
				messageId: options.messageId
			});
			
            return _fetch(urls._fetchThreadedMessageDetails, reqObj, "post");
        }
	}
});

//(function(){
//    icsLite.app.inbox.services.init = function(core, config) {
//        core.getCoreInstance(config.core).createModule(config.id, config.sandbox, function(sb, id, moduleName) {
//            return {
//                init: function() {
//                    // defaultParams for xhr request
//                    var defaultParams = {
//                        sync: false,
//                        preventCache: true,
//                        handleAs: 'json',
//                        timeout: 30* 1000
//                    };
//                    this.fetchIds = {};
//                    this.reqCount = 0;
//					
//					var urls;					
//					urls = {
//						_getPreferences: '../preferences/getPrefs.action',
//						_fetchHeaderList: '../inbox/service/fetchHeaderList.action'
//					}
//					
//					//>>excludeStart('isStatic', !kwArgs.isStatic)
//					if(icsLite.config.isStatic){
//						urls = {
//							_getPreferences: '../simulation/inbox/getPrefs.action',
//							_fetchHeaderList: '../simulation/inbox/fetchHeaderList(emails).json'
//						}
//					}
//					//>>excludeEnd('isStatic')
//					
//                    var urlsConfig = this.urlsConfig = {
//                            fetchHeaderList: {
//                                canCancel: true,
//                                url: urls._fetchHeaderList
//                            },
//                            readMessage: {
//                                canCancel: false,
//                                url: '../inbox/service/fetchMessageDetail.action'
//                            },
//                            composeMessage: {
//                                canCancel: false,
//                                url: '../inbox/service/fetchMessageDetail.action'
//                            },
//                            assignTag: {
//                                canCancel: false,
//                                stopEvent: true,
//                                url: '../inbox/message/assignTag.action'
//                            },
//                            removeTag: {
//                                canCancel: false,
//                                url: '../inbox/message/removeTag.action'
//                            },
//                            addTag: {
//                                canCancel: false,
//                                url: '../inbox/tag/addTag.action'
//                            },
//                            deleteTag: {
//                                canCancel: false,
//                                url: '../inbox/tag/deleteTag.action'
//                            },
//                            updateTag: {
//                                canCancel: false,
//                                url: '../inbox/tag/updateTag.action'
//                            },
//                            markAsSpam: {
//                                canCancel: false,
//                                stopEvent: true,
//                                url: '../inbox/service/markMessageAsSpam.action'
//                            },
//                            markAsUnread: {
//                                canCancel: false,
//                                stopEvent: true,
//                                url: '../inbox/service/markAsUnread.action'
//                            },
//                            markAsRead: {
//                                canCancel: false,
//                                stopEvent: true,
//                                url: '../inbox/service/markAsRead.action'
//                            },
//                            deleteMessages: {
//                                canCancel: false,
//                                stopEvent: true,
//                                url: '../inbox/service/deleteMessages.action'
//                            },
//                            discardDraft: {
//                                canCancel: false,
//                                stopEvent: true,
//                                url: '../inbox/service/deleteMessages.action'
//                            },
//                            undeleteMessages: {
//                                canCancel: false,
//                                url: '../inbox/service/moveMessages.action'
//                            },
//                            spkNTxt: {
//                                canCancel: false,
//                                stopEvent: true,
//                                url: '../inbox/service/speakNTxt.action'
//                            },
//                            saveDraft: {
//                                canCancel: false,
//                                stopEvent: true,
//                                url: '../inbox/service/saveDraft.action'
//                            },
//                            send: {
//                                canCancel: false,
//                                stopEvent: true,
//                                url: '../inbox/service/send.action'
//                            },
//                            reSend: {
//                                canCancel: false,
//                                url: '../inbox/service/reSend.action'
//                            },
//                            sendLater: {
//                                canCancel: false,
//                                url: '../inbox/service/sendLater.action'
//                            },
//                            cancelSendLater: {
//                                canCancel: false,
//                                url: '../inbox/defmsg/deleteDeferredMessage.action'
//                            },
//                            printMessages: {
//                                canCancel: false,
//                                url: 'ics/inbox/service/printMessages.action'
//                            },
//                            fetchThreadContent: {
//                                canCancel: false,
//                                url: '../inbox/service/fetchThreadedMessageDetail.action'
//                            },
//                            fetchMessageContents: {
//                                canCancel: false,
//                                url: '../inbox/service/fetchThreadedMessageDetails.action'
//                            },
//                            spellChek: {
//                                canCancel: false,
//                                url: '../inbox/service/spellCheck.action'
//                            },
//                            removeAttachments: {
//                                canCancel: false,
//                                url: '../inbox/attachment/removeAttachment.action'
//                            },
//                            getPreferences: {
//                                canCancel: false,
//                                url: urls._getPreferences
//                            },
//                            addToSentHistory: {
//                                canCancel: false,
//                                url: '../inbox/service/storeContacts.action'
//                            }
//                    };
//                    // create function according to this.urlsConfig
//                    // the function name has the exact name with the property name
//                    // which just hitch to 
//                    var prop;
//                    for(prop in urlsConfig) {
//                        this[prop] = dojo.hitch(this, this._xhrPost, prop, defaultParams);
//                    }
//                    sb.subscribe(id, icsLite.topics.INBOX_SERVICES, 'xhr', true);
//                },
//                destroy: function() {
//                    sb.unsubscribe(id, icsLite.topics.INBOX_SERVICES);
//                },
//                xhr: function(command, args, indexes) {
//                    // summary: 
//                    //      The listener to topics icsLite.topics.INBOX_SERVICES
//                    //      According to the command, call the function which was pre-created in init function
//                    var url;
//                    if(url = this.urlsConfig[command].url) {
//                        if(this[command]) {
//                            this[command](args, indexes);
//                        }
//                    }
//                },
//                _preRequest: function(prop) {
//                    if(this.urlsConfig[prop].stopEvent) {
//                        sb.publish(icsLite.topics.TOGGLE_EVENT_ENABILITY, [true]);
//                    }
//                    if(typeof this[prop + 'PreReq'] === 'function') {
//                        if(!this[prop + 'PreReq'].apply(this, arguments)) {
//                            return;
//                        }
//                    }
//                },
//                _callBack: function(request, prop, response) {
//                    if(typeof this[prop + 'Callback'] === 'function') {
//                        this[prop + 'Callback'].apply(this, arguments);
//                    }
//                },
//                _errBack: function(request, prop, err) {
//                    if(err && (err.dojoType === 'cancel')) {
//                        if(typeof this[prop + 'Cancelback'] === 'function') {
//                            this[prop + 'Cancelback'].apply(this, arguments);
//                        }
//                        return;
//                    }
//                    if(err && err.message) {
//                        if(err.message === 'syntax error') {
//                            if(confirm('Your session has timed out, would you like to sign in again?')) {
//                                window.location.reload();
//                            }
//                        }
//                    }
//                    if(typeof this[prop + 'Errback'] === 'function') {
//                        this[prop + 'Errback'].apply(this, arguments);
//                    }
//                },
//                _bothBack: function(request, prop, response) {
//                    if(--this.reqCount === 0) {
//                        dojo.removeClass('appWrapper', 'xhrLoading');              
//                    }
//                    if(typeof this[prop + 'Both'] === 'function') {
//                        this[prop + 'Both'].apply(this, arguments);
//                    }
//                    if(this.urlsConfig[prop].stopEvent) {
//                        sb.publish(icsLite.topics.TOGGLE_EVENT_ENABILITY, [false]);
//                    }
//                },
//                _xhrPost: function(prop, defaultParams, args, indexes) {
//                    var obj = this.urlsConfig[prop];
//                    if(!obj) {
//                        return;
//                    }
//                    this._preRequest(prop, defaultParams, args, indexes);
//                    if(obj.canCancel) {
//                        var dfd;
//                        if(dfd = this[prop + 'Dfd']) {
//                            dfd.cancel();
//                        }
//                    }
//                    if(this.reqCount === 0) {
//                        dojo.addClass('appWrapper', 'xhrLoading');
//                    }
//                    this.reqCount++;
//                    var newArgs = dojo.delegate(args, {indexes: indexes});
//                    this[prop + 'Dfd'] = sb.xhrPost(dojo.delegate(defaultParams, {
//                        url: obj.url,
//                        postData: args ? icsLite.app.objToQuery(args) : ''
//                    })).addCallback(this, this._callBack, newArgs, prop).addErrback(this, this._errBack, newArgs, prop).addBoth(this, this._bothBack, newArgs, prop);
//                },
//                fetchHeaderListCallback: function(request, prop, response) {
//                    if(response.statusCode === 0) {
//                        var items = response.items;
//                        request = request.request;
//                        dojo.publish(icsLite.topics.LIST_STATUS, [{
//                            count: dojo.filter(items, function(i){
//                                return i.messageId !== 0;
//                            }).length,
//                            allCount: response.numRows,
//                            all: response.all,
//                            request: request
//                        }]);
//                        dojo.publish(icsLite.topics.UPDATE_MSG_LIST, [items, request]);
//                    }
//                },
//                fetchHeaderListErrback: function(request, prop, response) {
//                    console.warn('fetchHeaderList error');
//                },
//                fetchHeaderListCancelback: function() {
//                    console.warn('fetchHeaderList cancelled');
//                },
//                getPreferencesCallback: function(request, prop, response){
//                    var result = {};
//                    if(response.statusCode === 0) {
//                        result.emailsList = response.defaultEmailList;
//                        var prefs = response.preferences,
//                            i, value;
//                        while(i = prefs.shift()) {
//                            if(value = i['DefFrom']) {
//                                result['DefFrom'] = value;
//                            } else if(value = i['userMdn']) {
//                                result['userMdn'] = value;
//                            }
//                        }
//                        dojo.publish(icsLite.topics.PUBLISH_PREFERENCES, [result]);
//                    }
//                },
//                getPreferencesErrback: function(request, prop, response){
//                    
//                },
//                readMessagePreReq: function(prop, defaultParams, args, indexes) {
//                    if(this.fetchIds[indexes]) {
//                        return false;
//                    }
//                    this.fetchIds[indexes] = true;
//                    return true;
//                },
//                readMessageCallback: function(request, prop, response) {
//                    if(response.statusCode === 0) {
//                        dojo.publish(icsLite.topics.UPDATE_HEADER, [response, request.indexes]);
//                    }
//                },
//                readMessageErrback: function(request, prop, response) {
//                    
//                },
//                readMessageBoth: function(request, prop, response) {
//                    var idx;
//                    if(request && (idx = request.indexes)) {
//                        delete this.fetchIds[idx];
//                    }
//                },
//                composeMessagePreReq: function(prop, defaultParams, args, indexes) {
//                    if(this.fetchIds[indexes]) {
//                        return false;
//                    }
//                    this.fetchIds[indexes] = true;
//                    return true;
//                },
//                composeMessageCallback: function(request, prop, response) {
//                    if(response.statusCode === 0) {
//                        dojo.publish(icsLite.topics.NAV_TO_COMPOSER, [request.request.type]);
//                        dojo.publish(icsLite.topics.COMPOSE_MESSAGE, [{request: request, item: response}]);
//                    }
//                },
//                composeMessageErrback: function(request, prop, response) {
//                    
//                },
//                composeMessageBoth: function(request, prop, response) {
//                    var idx;
//                    if(request && (idx = request.indexes)) {
//                        delete this.fetchIds[idx];
//                    }
//                },
//                fetchMessageContentsPreReq: function(prop, defaultParams, args, indexes) {
//                    dojo.publish(icsLite.topics.CLEAR_VIEWER);
//                },
//                fetchMessageContentsCallback: function(request, prop, response) {
//                    if(response.statusCode === 0) {
//                        dojo.publish(icsLite.topics.UPDATE_VIEWER, [response]);
//                    }
//                },
//                fetchMessageContentsErrback: function(request, prop, response) {
//                    console.warn('fetchMessageContents error');
//                },  
//                fetchMessageContentsCancelback: function(request, prop, response) {
//                    console.warn('fetchMessageContents cancelled');
//                }, 
//                markAsUnreadCallback: function(request, prop, response) {
//                    if(response.statusCode === 0) {
//                        dojo.publish(icsLite.topics.UPDATE_LIST_ROWS, ['unread', request.indexes, false]);
//                    }
//                },
//                markAsUnreadErrback: function(request, prop, response) {
//                    console.warn('fetchMessageContents error');
//                },
//                markAsReadCallback: function(request, prop, response) {
//                    if(response.statusCode === 0) {
//                        dojo.publish(icsLite.topics.UPDATE_LIST_ROWS, ['read', request.indexes, true]);
//                    }
//                },
//                markAsReadErrback: function(request, prop, response) {
//                    console.warn('fetchMessageContents error');
//                },
//                assignTagCallback: function(request, prop, response) {
//                    if(response.statusCode === 0) {
//                        dojo.publish(icsLite.topics.UPDATE_LIST_ROWS, ['star', request.indexes]);
//                    }
//                },
//                assignTagErrback: function(request, prop, response) {
//                    console.warn('fetchMessageContents error');
//                },
//                removeTagCallback: function(request, prop, response) {
//                    if(response.statusCode === 0) {
//                        dojo.publish(icsLite.topics.UPDATE_LIST_ROWS, ['unstar', request.indexes]);
//                    }
//                },
//                removeTagErrback: function(request, prop, response) {
//                    console.warn('fetchMessageContents error');
//                },
//                deleteMessagesCallback: function(request, prop, response) {
//                    if(response.statusCode === 0) {
//                        dojo.publish(icsLite.topics.UPDATE_LIST_ROWS, ['deleteMessages', request.indexes]);
//                    }
//                },
//                deleteMessagesErrback: function(request, prop, response) {
//                    console.warn('fetchMessageContents error');
//                },
//                spkNTxtCallback: function(request, prop, response) {
//                    if(response.statusCode === 0) {
//                        dojo.publish(icsLite.topics.SPEAK_AND_TEXT, [response.smsText]);
//                    }
//                },
//                spkNTxtErrback: function(request, prop, response) {
//                    console.warn(response);
//                },
//                spkNTxtBoth: function(request, prop, response) {
//                    dojo.publish(icsLite.topics.TOGGLE_SPEAK_AND_TEXT, [true]);
//                },
//                sendCallback: function(request, prop, response) {
//                    if(response.statusCode === 0) {
//                        dojo.publish(icsLite.topics.AFTER_SENT_MSG, [response]);
//                        var req = request.request;
//                        if(req.type === "email") {
//                            var emails = [].concat(req.to.split(",").concat(req.cc.split(",")).concat(req.bcc.split(",")));
//                            var i, result = [];
//                            while(i = emails.shift()) {
//                                if(i) {
//                                    result.push(i);
//                                }
//                            }
//                            if(result.length) {
//                                this.xhr("addToSentHistory", {
//                                    request: {
//                                        contacts: result
//                                    }
//                                });
//                                sb.publish(icsLite.topics.ADD_TO_SENT_HISTORY, [result]);
//                            }
//                        }
//                    } else {
//                        this.sendErrback.apply(this, arguments);
//                    }
//                },
//                sendErrback: function(request, prop, response) {
//                    dojo.publish(icsLite.topics.COMPOSE_ERROR, [response]);
//                },
//                sendBoth: function(request, prop, response) {
//                    dojo.publish(icsLite.topics.TOGGLE_BUTTONS, [true]);
//                },
//                saveDraftCallback: function(request, prop, response) {
//                    if(response.statusCode === 0) {
//                        dojo.publish(icsLite.topics.AFTER_DRAFT_MSG, [response]);
//                    } else {
//                        this.saveDraftErrback.apply(this, arguments);
//                    }
//                },
//                saveDraftErrback: function(request, prop, response) {
//                    dojo.publish(icsLite.topics.COMPOSE_ERROR, [response]);
//                },
//                saveDraftBoth: function(request, prop, response) {
//                    dojo.publish(icsLite.topics.TOGGLE_BUTTONS, [true]);
//                }, 
//                discardDraftCallback: function(request, prop, response) {
//                    if(response.statusCode === 0) {
//                        dojo.publish(icsLite.topics.AFTER_DISCARD_MSG, [response]);
//                    } else {
//                        this.discardDraftErrback.apply(this, arguments);
//                    }
//                },
//                discardDraftErrback: function(request, prop, response) {
//                    dojo.publish(icsLite.topics.COMPOSE_ERROR, [response]);
//                },
//                discardDraftBoth: function(request, prop, response) {
//                    dojo.publish(icsLite.topics.TOGGLE_BUTTONS, [true]);
//                }
//            };
//        }).start(config.id);
//    };
//})();
