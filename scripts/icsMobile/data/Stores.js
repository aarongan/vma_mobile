define("icsMobile/data/Stores", 
	["dojo/_base/declare",
	"dojo/_base/lang",
	"../stores",  
	"../services"], function(declare, lang, stores, services){
		var _put = function(name, item){
            require(["icsMobile/stores"], lang.hitch(this, function(stores){
                if ((!!name && typeof name === "string") && !!item) {
                    var _t = this, _ref;                                      
                    if (!!(_ref = _t.referenceStore)) {
                        if (!!(ref = stores[_ref]) && !!(_ref = ref.items) && !!(_ref[name])) {                        
                            stores[_t.referenceStore].items[name]["_refConstraints"] = [_t.name, "items"].join(".");
                        }
                        else {
                            console.warn("Reference Stores object Error!!!");
                        }
                    }
                    !_t.items && (_t.items = {});
                    _t.items[name] = item;                    
                    //_t.fetchRows = (_t.fetchRows || 0) + 1;
					
					_t = _ref = null
                }
                else {
                    !name && console.warn("No name provided!!!");
                    !item && console.warn("No item provided!!!");
                }
            }))
		},
		_get = function(params){
			var _t = this;
			if (!!params && !!_t.items[params]) {
				return _t.items[params];
			}else{
				console.warn('Item not Exists!!!');
			}
		},
		_delete = function(params){
            require(["icsMobile/stores"], lang.hitch(this, function(stores){
                var _t = this, rf;
                if (!!params && !!_t.items[params]) {
                    if (rf = _t.items[params]["_refConstraints"]) {
                        delete lang.getObject(rf, false, stores)[params];
                    }
                    delete _t.items[params];
                }
                else {
                    console.warn('Item not Exists!!!');
                }
            }));
		}
		return declare ("icsMobile.data.Stores", null, {
			name: null, /*Mandantory for creating icsMobile/stores[name] object*/
			referenceStore: null,
			start: 1,
			count: 20,
			firing: false, 
			constructor: function(args){
				var _t = this;
				lang.mixin(_t, args);
				if(!!_t.name){
					stores[_t.name] = _t;
				}
				_t = null;
			},
			"put": _put,
			"get": _get, 
			"delete": _delete
		});
		
//	    return {
//	        MessageLists: {
//				name: "MessageLists",
//				parent: null,
//				start: 1,
//				count: 20,
//				firing: false, 
//				"put": _put,
//				"get": _get, 
//				"delete": _delete
//			},
//	        MessageDetails: {
//				name: "MessageDetails",
//				parent: "MessageLists",
//				start: 1,
//				count: 50,
//				firing: false,
//				"put": _put,
//				"get": _get, 
//				"delete": _delete
//			}
//		}
});
