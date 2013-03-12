<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld"%>

<s:head theme="ajax" />

<script language="javascript">
  dojo.require("dojo.io.*");
  dojo.require("dojo.event.*");

  //function onchange_vendornbr() {
  	var params = new Array();
 	params['tagRequest.tagId'] = "1";
 	
 	var bindArgs = {
  		url: "https://localhost:9443/icsweb/inbox/tag/getTag.action",
  		error: function(type, data, evt){
          //alert("error");
         },
  		mimetype: "text/json",
  		content: params
 	};
 	var req = dojo.io.bind(bindArgs);
 	dojo.event.connect(req, "load", this, "populateResult");
  //}

  function populateResult(type, data, evt) {
	  	alert(data.responseText);
  		alert(evt);
  		alert(type);
  }

</script>
