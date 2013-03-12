<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ include file="../common/taglibraries.jsp" %>	

<html>
<head>
<title>Connection Wizard</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body class="pl">
<div id="layer_holder" style="width:800px;height:400px">
<s:div id="loginDiv" theme="ajax">
<s:form action="createIcsEmailAccount.action" method="post">
<div id="main">
	<div id="contentDiv" style="float:left;width:535px;padding-top:10px;padding-right:10px;">
		<div id="pageHeaderDiv">
			<span style="float:left; margin-left: 20px;">
				<strong>Connection Wizard</strong>				
			</span><br/><br/>
		</div>
		<div id="headingDiv" style="float:left;padding-top:15px;padding-left:10px;">
			<span style="float:left; margin-left: 20px">
				<img alt="AOL" src="<%=staticContentURL%>styles/images/ics/provision/providers/icons/medium/aol.gif" /> 				
			</span>
			<span style="float:left; margin-left: 5px;padding-top:10px;">
				<strong>Connect with AOL </strong>	
			</span><br/>			
		</div>
		<div id="descDiv" style="float:left;padding-top:15px;margin-left: 5px;padding-left:10px;">
			<span style="float:left; margin-left: 20px">
				We'll first connect with your AOL account, then give you options for syncing
			</span><br/>
			<span style="float:left; margin-left: 20px">	
				the account. If you have multiple AOL accounts, please choose just one
			</span><br/>				 
			<span style="float:left; margin-left: 20px">
				to connect.
			</span><br/>
			<span style="float:left;margin-left: 20px;padding-top:20px">
				<strong>Enter your AOL login information.</strong>
			</span><br/>							 							
		</div>		
		<div style="float:left;padding-top:15px;margin-left: 5px;padding-left:10px;"> 
			<span id="emailText" style="float:left;margin-left: 20px;">
				<strong>Email Address</strong>
			</span>
			<span id="passwordText" style="float:left;margin-left: 25px;padding-left:64px;">
				<strong>Password</strong>
			</span>			
		</div>
		<div style="float:left;margin-left: 5px;padding-left:10px;"> 
			<span style="float:left;margin-left: 20px;">
				<input type="text" name="endPointRequest.endPointVO.userName" id="userName" width="254"/>
			</span>
			<span style="float:left;margin-left: 25px;">
				<input type="password" name="endPointRequest.endPointVO.password" id="password" width="254"/>
			</span>	
		</div>
		<div id="errorBlock" style="display:none;float:left;margin-top:20px;margin-left: 35px;padding:5px;border: 1px solid red;"> 
			<span style="float:left;color: red">
				<img alt="Error" src="<%=staticContentURL%>styles/images/ics/provision/error_alert.gif" /> 		
			</span>
			<span id="userNamePwordRequired" style="display:none;float:left;padding-left: 5px;color: red">
				Email Address and Password are required.  
			</span>				
			<span id="wrongCredentials" style="display:none;float:left;padding-left: 5px;color: red">
				The username or password you provided is incorrect. Please try again.  
			</span>	
			<span style="float:left;padding-right:5px;">
				<a href="" class="a">Need Help?</a>
			</span>
		</div>
	   <div id="buttonsErrorBlock" style="display:none;float:left;margin-top:60px;margin-left:370px;">
			<span style="float:left;padding-left:10px;padding-top:5px;">
				<a href="javascript:onError();" class="a" style="margin-right:10px"><span><span><span>Cancel</span></span></span></a>
			</span>
			<span style="float:left;">
				<a href="javascript:back();" class="button" id="backButton"><span class="interface"><span><span>Back</span></span></span></a>
			</span>			
			<span style="float:left;padding-left:10px;">
				<a href="javascript:submitNext();" class="button" id="nextButton"><span class="red"><span><span>Next</span></span></span></a>
			</span>
	   </div>	
					
	   <div id="buttonsBlock" style="display:block;float:left;margin-top:105px;margin-left:370px;">
			<span style="float:left;padding-left:10px;padding-top:5px;">
				<a href="javascript:onError();" class="a" style="margin-right:10px"><span><span><span>Cancel</span></span></span></a>
			</span>
			<span style="float:left;">
				<a href="javascript:back();" class="button" id="backButton"><span class="interface"><span><span>Back</span></span></span></a>
			</span>			
			<span style="float:left;padding-left:10px;">			
				<s:a id="nextButton" href="javascript:submitNext();" targets="loginDiv" cssClass="button">
					<span class="red"><span><span>Next</span></span></span>
				</s:a> 
			</span>
	   </div>	
										
	</div>
	<div id="helpDiv" style="float:left;width:225px;height:350px;margin-left:10px;margin-top:20px;border:1px solid #CCCCCC">
		<span style="float:left; margin-left: 10px">
			<strong>Do you know?</strong>				
		</span><br/><br/>
		<span style="float:left; margin-left: 10px"><strong>Sync</strong></span><br/>
		<span style="float:left; margin-left: 10px">Syncing your data, like emails,</span><br/>
		<span style="float:left; margin-left: 10px">contacts, and calendar events,</span><br/>
		<span style="float:left; margin-left: 10px">means that the information will be</span><br/>
		<span style="float:left; margin-left: 10px">shared between both services.</span><br/>
		<span style="float:left; margin-left: 10px">Updates or changes on one side </span><br/>
		<span style="float:left; margin-left: 10px">will happen on the other side too.</span><br/>
		<span style="float:left; margin-left: 10px">Basic ICS will sync once a day, but</span><br/>
		<span style="float:left; margin-left: 10px">Premium ICS will keep you </span><br/>
		<span style="float:left; margin-left: 10px">constantly synced.</span><br/><br/><br/>
		<span style="float:left; margin-left: 10px"><strong>Import</strong></span><br/>
		<span style="float:left; margin-left: 10px">Importing your data will bring it into</span><br/>
		<span style="float:left; margin-left: 10px">ICS, but any changes you make </span><br/>
		<span style="float:left; margin-left: 10px">either in that service or in ICS will</span><br/>
		<span style="float:left; margin-left: 10px">not be shared.</span><br/>
	</div>
</div>
</s:form>
</s:div>
</div>
<script type="text/javascript">
	function submitNext() {
		var userName = document.getElementById("userName").value;
		var password = document.getElementById("password").value;
		userName = trim(userName);
		password = trim(password);
		var icsProviderId = '<s:property value="endPointRequest.endPointVO.icsProviderId"/>';
		
		if(userName == '' || password == '')
		{
			document.getElementById("buttonsErrorBlock").style.display="block";
			document.getElementById("buttonsBlock").style.display="none";
			document.getElementById("errorBlock").style.display="block";
			document.getElementById("userNamePwordRequired").style.display="block";
			document.getElementById("userName").style.border="1px solid red";
			document.getElementById("password").style.border="1px solid red";
			document.getElementById("emailText").style.color="red";
			document.getElementById("passwordText").style.color="red";
			return ;			
		}
		else {
			var url = '<a href=/provisioning/endPointSynchronizationWizard.action?icsSessionVO.endPointRequest.endPointVO.icsProviderId='+icsProviderId+'&icsSessionVO.endPointRequest.endPointVO.userName='+userName+'&icsSessionVO.endPointRequest.endPointVO.password='+password+'/>';	
		 	document.forms[0].action =url;
			document.forms[0].submit();
		} 
	}
	
	function onError() {
		document.getElementById("buttonsErrorBlock").style.display="block";
		document.getElementById("buttonsBlock").style.display="none";
		document.getElementById("errorBlock").style.display="block";
		document.getElementById("userName").style.border="1px solid red";
		document.getElementById("password").style.border="1px solid red";
		document.getElementById("emailText").style.color="red";
		document.getElementById("passwordText").style.color="red";
		return ;
	}

	function trim(str) {
	    var chars = "\\s";
		return ltrim(rtrim(str, chars), chars);
	}
	 
	function ltrim(str, chars) {
		chars = chars || "\\s";
		return str.replace(new RegExp("^[" + chars + "]+", "g"), "");
	}
	 
	function rtrim(str, chars) {
		chars = chars || "\\s";
		return str.replace(new RegExp("[" + chars + "]+$", "g"), "");
	}
	
	
</script>
</body>
</html>
