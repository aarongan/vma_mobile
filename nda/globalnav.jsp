
<%@page import="com.vzw.is.ics.utils.props.ICSExtProps"%>
<%@page import="com.vzw.is.ics.common.ICSConstants"%>


<%
	String gnStaticContentURL = "https://preprodecache.vzw.com/imageFiles/Myacct/gn/pre";
	//String gnStaticContentURL = "http://myacctqa2web1.odc.vzwcorp.com:8080/imageFiles/Myacct/gn/" ; 
%>
	 
  <link rel="stylesheet" href="https://preprodecache.vzw.com/imageFiles/Myacct/gn/pre/../css/vzw_jquery.css">
  <link rel="stylesheet" href="https://preprodecache.vzw.com/imageFiles/Myacct/gn/pre/../css/globalnav.css">
  
  <script type="text/javascript" src="https://preprodecache.vzw.com/imageFiles/Myacct/gn/pre/../scripts/vzw_jquery.js"></script>
  <script type="text/javascript" src="https://preprodecache.vzw.com/imageFiles/Myacct/gn/pre/../scripts/globalnav.js"></script>
 
	</head>
	<body class="tundra pl" style="background: #F1F1F1">
		<script>	
			
			
				var gnlin_scu = '<%=gnStaticContentURL%>'; 
				var gnlin_asu = "https://preprodbillpaysvc.verizonwireless.com/vzwsvc/asc"; 
				var gnlin_usu = "https://preprodbillpaysvc.verizonwireless.com/vzwsvc/usc"; 
				var gnlin_myac_server = "https://tmyacct.verizonwireless.com/clp/login?redirect=";
			
		</script>

		<div id="globalNavId">
		</div>
		<script>//try{render('globalNavId');}catch(e){}</script>
		<script>try{renderLoggedInMenu('globalNavId');}catch(e){}</script>
		<script>		
			function gnCustomizeMenu(){
				var logoutUrl = '/ics/ics/logout.action';
				updateMenuURL("vzwsignout", logoutUrl);
				highlightMenu(3,2);
			}
			//var loggedInURL = "http://xyz.vzw.com/login";
			//var gnCategory=2;
		</script>
