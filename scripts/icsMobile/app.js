define("icsMobile/app", [], function(){
	return {
        objToQuery: (function(){
            var q = [];
            var serialize = function(obj, prefix){
                var base = prefix || '';
                if (dojo.isArray(obj)) {
                    // do array stuff
                    dojo.forEach(obj, function(i, n){
                        serialize(i, base + '[' + n + ']');
                    }, this);
                }
                else 
                    if (dojo.isObject(obj)) {
                        // do object stuff
                        var p;
                        for (p in obj) {
                            serialize(obj[p], base ? base + '.' + p : p);
                        }
                    }
                    else {
                        // do primitive stuff
                        q.push(prefix + '=' + encodeURIComponent(obj));
                    }
                base = null;
            };
            return function(obj){
                q = [];
                serialize(obj);
                return q.join('&');
            };
        })()		
	}	
});
