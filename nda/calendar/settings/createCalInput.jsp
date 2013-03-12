
<html>

<head>
	
	<title>Trial Dojo</title>
	
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<%--<script type="text/javascript" src='http://o.aolcdn.com/dojo/1.3/dojo/dojo.xd.js'
	djConfig="parseOnload:true,isDebug:true">
</script>
<script type="text/javascript" src='../dojo130/dojo/dojo.js'></script>--%>



<!--  s:head theme="ajax"/>  -->

<script src="../../../scripts/dojo.js"></script>

<script language="javascript">

  	var params = {};
  	
 	params['cURDCalendarRequest.user.userId'] = "14044041234";
 	params['cURDCalendarRequest.calId'] = "VZW_ICSCalendar_new_calendar";
 	params['cURDCalendarRequest.setId'] = "H4QFu1Xoglk";
  	params['cURDCalendarRequest.setOutputFormat'] = "text/xml";

	var args = {
		sync:true,
		preventCache:true,
		handleAs:"json",
		timeout:250000,
	    url:"http://localhost:9080/icsweb/calendar/createCalendar.action",
	   	postData: dojo.objectToQuery(params)
		};
		
		var def=dojo.xhrPost(args);
		
		
		def.addCallback(function() {
			alert("call back");
		});

</script>


</head>

<body>
	
	
	<div id="resultDiv">Displays the result here!!</div>	

</body>

</html>
