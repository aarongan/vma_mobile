<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
 <%@ include file="../common/taglibraries.jsp" %>	
  
  
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Sync & Connect Application</title>

		<style type='text/css'>
			body {margin:0;padding:0;background:#ffffff;text-align:center;font:normal 0.75em arial,sans-serif;}
            #ics_container {width:985px;height:600px;margin:0 auto;text-align:left;}
        </style>
        
</head>
<!--  <body bgcolor="#ffffff" class="pl" onload="icsIframeLaunch();return false;">  -->
<body class="tundra pl">
        <div class="gh_outside">
            <div class="gh">
                <jsp:include page="../header.jsp" flush="true"></jsp:include>
            </div>
            <div class="fixer" style="height:10px;">&nbsp;</div>
        </div>
        <%--  <div class="gn_outside">
            <div class="gn">
                <jsp:include page="../globalnav.jsp" flush="true"></jsp:include>
            </div>
        </div>  --%>

 		<div class="gb" id="ics_overlay_container">
 		<div style="padding-left: 300px; padding-top: 100px; font-weight: bold;"><font color="#4D4D4D" >To access this feature, you need to complete Sync & Connect Setup.</font></div> 
				<div id='ics_container_msg' style="padding-left: 400px; padding-top: 50px;">
				
				<a href='<s:url value="/ics/icsOverview.action"/>' class="button"><span class="red"><span><span>Complete Setup Now</span></span></span></a>
				</div>
			<div id='ics_container'></div>

		</div>
			
        </div>
        

<script type="text/javascript">
        LibOptions = {Layer:{hideOnOverlayClick:false}};
</script>
<script type="text/javascript" src="<%=staticContentURL%>scripts/mootools.js"></script>
<script type="text/javascript" src="<%=staticContentURL%>scripts/lib.js"></script>




<script type="text/javascript">
  window.addEvent('domready',function() {
      Lib.LayerManager.show('iframe',{
	      content:'router.action',
	      title:'Sync & Connect'
	    });

  });
</script>
<div class="gf_outside">
    <div class="gf">
         <jsp:include page="../footer.jsp" flush="true"></jsp:include>
	</div>
</div>
</body>
</html>
