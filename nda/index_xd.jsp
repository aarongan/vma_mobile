<!DOCTYPE html>
<%@ include file="/nda/common/headerlibraries.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
	<head>
		<title>Sync & Connect Application</title>
		
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<%
		//staticContentURL = "http://localhost:9080/ics/";
		//staticContentURL = "http://obswiicszdt04.odc.vzwcorp.com:8080/ics/";
		staticContentURL = "http://icsqa2imgs.odc.vzwcorp.com/ics/";
	 %>
	<link rel='stylesheet' href='<%= staticContentURL %>scripts/release/styles/css/dojoAll.css'>
        <link rel='stylesheet' href='<%= staticContentURL %>scripts/release/styles/css/ics.css'>
		
		<style type='text/css'>
			body {margin:0;padding:0;background:#ffffff;text-align:center;font:normal 0.75em arial,sans-serif;}
            #ics_container {width:985px;height:1200px;margin:0 auto;text-align:left;}
        </style>
	
		<jsp:include page="globalnav.jsp" flush="true"></jsp:include>
		

      
        <div class="gb">
		<div id='ics_container'></div>
        </div>
        <div id="gf_outsideId" class="gf_outside">
            <div class="gf">
                <jsp:include page="footer.jsp" flush="true"></jsp:include>
            </div>
        </div>
        <script>
			//Common Globals
			var ICS_LOCKED = false, 
			ICS_TIMEOUT = "<%= icsFETimeout %>";
	        
			//Inbox Globals
	        var VZW_OPTIONAL = "<s:property value="icsSessionVO.userVO.vZWOptional"/>";
	        VZW_OPTIONAL = (VZW_OPTIONAL === 'true') ? true : false;
	        
	        var REGULAR_NOTIFY_INTERVAL = "<s:property value="icsSessionVO.regularNotifyInterval"/>";
	        var SYNC_NOTIFY_INTERVAL = "<s:property value="icsSessionVO.syncNotifyInterval"/>";
	        if(!REGULAR_NOTIFY_INTERVAL) {
				REGULAR_NOTIFY_INTERVAL = 60 * 1000;
	        }
	        if(!SYNC_NOTIFY_INTERVAL) {
	        	SYNC_NOTIFY_INTERVAL = 10 * 1000;
	        }
	        //NAB Globals
	        var F1_ACC_NOT_FOUND = "<s:property value="icsSessionVO.userVO.hasContacts"/>",	            
  	    	SEQ_POLL_INTERVAL = parseInt("<%= SEQ_POLL_INTERVAL %>"), 
			NAB_ADD_THRESHOLD =   parseInt("<%= NAB_ADD_THRESHOLD %>"),
			NAB_DEL_THRESHOLD = parseInt("<%= NAB_DEL_THRESHOLD %>"),
			NAB_UNDEL_THRESHOLD =  parseInt("<%= NAB_UNDEL_THRESHOLD %>"),
			NAB_PERMDEL_THRESHOLD = parseInt("<%= NAB_PERMDEL_THRESHOLD %>"), 
			NAB_IS_SEQ_EXEC = "<%= NAB_IS_SEQ_EXEC %>";
	        
			NAB_IS_SEQ_EXEC = (NAB_IS_SEQ_EXEC=='Y')?true:false;	        
	        F1_ACC_NOT_FOUND = (F1_ACC_NOT_FOUND === 'true') ? false : true;
    	</script>    
        <script type="text/javascript" src='<%= staticContentURL %>scripts/release/dojo/dojo.xd.js'></script>
     	<script type='text/javascript'>
	     	var scu = "<%= staticContentURL %>";
	     	dojo.registerModulePath("dojo", scu + "scripts/release/dojo");
			dojo.registerModulePath("dijit", scu + "scripts/release/dijit");
			dojo.registerModulePath("dojox", scu + "scripts/release/dojox");
			dojo.addOnLoad(function(){
				dojo.require("ics.kernel");
			});		
     	</script>

	</body>
</html>
