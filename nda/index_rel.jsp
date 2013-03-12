<html>
	<head>
		<title>ICS Application</title>
		 <div >
                <jsp:include page="header.jsp" flush="true"></jsp:include>
            </div>
		
		<link rel='stylesheet' href='../styles/css/dojoAll.css'>
		<link rel='stylesheet' href='../styles/css/ics.css'>
		
		<style type='text/css'>
			body {margin:0;padding:0;background:#ffffff;text-align:center;font:normal 0.75em arial,sans-serif;}
            #ics_container {width:985px;height:1200px;margin:0 auto;text-align:left;}
        </style>
        
        <script type="text/javascript" src='../scripts/release/dojo/dojo.js'></script>
       	<script type='text/javascript'>dojo.require('ics.kernel');</script>
	    
	</head>
    <body class="tundra pl">
        
        <div class="gb">
		<div id='ics_container'></div>
        </div>
        <div class="gf_outside">
            <div class="gf">
                <jsp:include page="footer.jsp" flush="true"></jsp:include>
            </div>
        </div>

	</body>
</html>