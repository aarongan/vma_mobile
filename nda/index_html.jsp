<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/nda/common/headerlibraries.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
	<head>
		<title>ICS Application</title>
		
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
		
        <jsp:include page="header.jsp" flush="true"></jsp:include>
		
		<link rel="stylesheet" href="../styles/css/dojoAll.css">
		<link rel="stylesheet" href="../styles/css/icsLite.css">
		
		<style type="text/css">
			body {margin:0;padding:0;background:#ffffff;text-align:center;font:normal 0.75em arial,sans-serif;}
            #ics_container {width:985px;height:1200px;margin:0 auto;text-align:left;}
        </style>
        
		
	    
	</head>
    <body class="tundra pl">
        <div class="gh_outside">
            <div class="fixer" style="height:10px;">&nbsp;</div>
        </div>
        <div class="gb">
			<div id="icsLite-main">
				<div id="icsLite-top" class="top">
					<span class="dijitReset dijitInline" id="inbox-module"></span>
					<label class="inboxTabLbl dijitReset dijitInline" for="inbox-tab">Inbox</label>
				</div>
				<div id="icsLite-body">
					
				</div>
				<div id="icsLite-footer">
					this is footer
				</div>
			</div>
        </div>
        <div id="gf_outsideId" class="gf_outside">
            <div class="gf">
                <jsp:include page="footer.jsp" flush="true"></jsp:include>
            </div>
        </div>
        <script type="text/javascript">
			// setup the module path for ICS
			djConfig = {
				modulePaths: {
					"icsLite": "../../icsLite",
					"styles": "../../../styles"
				}
			};
		</script>
        <script type="text/javascript" src="../scripts/dojotoolkit/dojo/dojo.js"></script>
  	    <script type="text/javascript">
  	    	dojo.addOnLoad(function() {
  	    		dojo.require("icsLite.kernel");
  	    	});
  	    </script>
	</body>
</html>
