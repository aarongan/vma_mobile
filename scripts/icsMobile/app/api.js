define(["dojo/dom-attr",
		"dojo/dom-style",
		"dojo/_base/fx",
		"dojo/_base/lang", 
		"dojo/dom",
		"dojo/dom-geometry",
		"dojo/fx",
		"../config"], function(domAttr, domStyle, fx, lang, dom, domGeometry, xfx, config){
	return {
		finished: false,
        refresh: function(){            
            var _refNode = dom.byId(config.ids.LOADING_ID), _showing = domAttr.get(_refNode, "show");
            if (_showing === "true") {
                domAttr.set(_refNode, "show", "false");
                fx.fadeOut({
                    duration: 500,
                    node: _refNode,
                    onEnd: lang.hitch(this, function(){
                        domStyle.set(_refNode, {"position": "", "top": "0px", "left": "0px"});
						this.finished = true;
                    })
                }).play();
            }
            else {
                domAttr.set(_refNode, "show", "true");
                fx.fadeIn({
                    duration: 500,
                    end: 0.75,
                    node: _refNode,
                    beforeBegin: lang.hitch(this, function(){
                        domStyle.set(_refNode, {"position": "absolute", "top": "0px", "left": "0px"});
						this.finished = false;
                    })
                }).play();
            }
        }, 
		slideToLeft: function(node){
            var marginBox = domGeometry.getMarginBox(node);
            xfx.slideTo({
                node: node,
                unit: "px",
                left: 0,
				onEnd: lang.hitch(this, function(){
					domStyle.set(node, "display", "");
					this.finished = true;
				})
            }).play();  
		},
		slideToRight: function(node){
            var marginBox = domGeometry.getMarginBox(node);
            xfx.slideTo({
                node: node,
                unit: "px",
                left: marginBox.w,
				onEnd: lang.hitch(this, function(){
					domStyle.set(node, "display", "none");
					this.finished = true;
				})
            }).play();     
		}, 
		show: function(node, /*? Function */ func){
			if (!!func && typeof func === "function") {
				func(node);
			}
			else {
				domStyle.set(node, "display", "");
				this.finished = true;
			}
		},
		hide: function(node, /*? Function */ func){
			if (!!func && typeof func === "function") {
				func(node);
			}
			else {			
				domStyle.set(node, "display", "none");
				this.finished = true;
			}
		}
	}
});
