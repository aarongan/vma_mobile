<!DOCTYPE html>
<%@ include file="/nda/common/headerlibraries.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
	<head>
		<title>Sync & Connect Application</title>
		
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
		
		<link rel='stylesheet' href='../styles/css/dojoAll.css'>
		<link rel='stylesheet' href='../styles/css/ics.css'>
		
		<style type='text/css'>
			body {margin:0;padding:0;background:#ffffff;text-align:center;font:normal 0.75em arial,sans-serif;}
            #ics_container {height:100%;width:100%;margin:0 auto;text-align:left;}
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

        <script type='text/javascript'>		
         document.getElementById("ics_container").parentNode.style.width = "985px";	 
		 document.getElementById("ics_container").parentNode.style.height = "1200px"
		 	//= window.innerHeight 
		 	//- (document.getElementById("globalNavId").clientHeight + document.getElementById("gf_outsideId").clientHeight) 
		 	//+ "px";
       	 
        	 
			// setup the module path for ICS
			djConfig = {
				modulePaths: {
					'ics': '../../ics',
					'styles': '../../../styles'
				}
			};
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
	        F1_ACC_NOT_FOUND = (F1_ACC_NOT_FOUND === 'false') ? false : true;
	        
		</script>
        <script type="text/javascript" src='../scripts/dojotoolkit/dojo/dojo.js'></script>
  	    <script type='text/javascript'>
  	    	dojo.addOnLoad(function() {
  	    		dojo.require('ics.kernel');
  	    	});
  	    </script>
  	    <!--  For HBX Tags -->				
   		<jsp:include page="common/metrics_page.jsp" flush="true"></jsp:include>
		<script type="text/javascript">			
			pageName = '<s:property value="@com.vzw.is.ics.utils.props.ICSHBXProps@getPageNameRole('MY_CONTACTS_MS','MS')"/>';
			pageMLC = '<s:property value="@com.vzw.is.ics.utils.props.ICSHBXProps@getPageMLCRole('MY_CONTACTS_MS','MS')"/>';
		</script>
	</body>
</html>
