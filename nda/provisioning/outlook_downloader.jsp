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
<div id="layer_holder" style="width:800px;height:425px">
<s:form action="addEndPoint.action">
<div id="main">
	<div id="contentDiv" style="float:left;width:535px;padding-top:10px;padding-right:10px;">
		<div id="pageHeaderDiv">
			<span style="float:left; margin-left: 20px;">
				<strong>Connection Wizard</strong>				
			</span><br/><br/>
		</div>
		<div id="headingDiv" style="float:left;padding-top:15px;padding-left:10px;">
			<span style="float:left; margin-left: 20px">
				<img alt="Outlook" src="<%=staticContentURL%>styles/images/ics/provision/providers/icons/medium/outlook.gif" />				
			</span>
			<span style="float:left; margin-left: 5px;padding-top:5px;">
				<strong>Connect with Outlook</strong><br/>				
			</span><br/>
		</div>
		<div id="descDiv" style="float:left;padding-top:15px;margin-left: 5px;padding-left:10px;">
			<span style="float:left; margin-left: 20px">
				<input type="checkbox" id="syncEmails" name="endPointRequest.endPointVO.syncEmails" value="true" style="margin-right: 5px;"/><strong>Sync my emails</strong>
			</span><br/>
			<span style="float:left; margin-left: 40px">	
				Please run the installer. It will create a connection between your Outlook
			</span><br/>				 
			<span style="float:left; margin-left: 40px">
				account and your ICS account. Then you'll come back here to finish up.
			</span><br/>
		</div>		
	   <div id="buttonsErrorBlock" style="display:none;float:left;margin-top:60px;margin-left:370px;">
			<span style="float:left;padding-left:10px;padding-top:5px;">
				<a href="javascript:onCancel();" class="a" style="margin-right:10px">
					<span><span><span>Cancel</span></span></span>
				</a>
			</span>
			<span style="float:left;">
				<a href="javascript:back();" class="button" id="backButton">
					<span class="interface"><span><span>Back</span></span></span>
				</a>
			</span>			
			<span style="float:left;padding-left:10px;">
				<a href="javascript:submitNext();" class="button" id="nextButton">
					<span class="red"><span><span>Next</span></span></span>
				</a>
			</span>
	   </div>	
					
	   <div id="buttonsBlock" style="display:block;float:left;margin-top:95px;margin-left:370px;">
			<span style="float:left;padding-left:10px;padding-top:5px;">
				<a href="cancelEndPointWizard.action" class="a" style="margin-right:10px">
					<span><span><span>Cancel</span></span></span>
				</a>
			</span>
			<span style="float:left;">
				<a href="javascript:back();" class="button" id="backButton">
					<span class="interface"><span><span>Back</span></span></span>
				</a>
			</span>			
			<span style="float:left;padding-left:10px;">
				<s:url id="nextButtonUrlId" action="addProvisionEndPoint"/>
				<s:a id="nextButton" href="javascript:submitNext();" targets="loginDiv" cssClass="button" >
					<span class="red"><span><span>Next</span></span></span>
				</s:a> 
			</span>
	   </div>									
	</div>
	
	<div id="helpDiv" style="float:left;width:225px;height:400px;margin-left:10px;margin-top:20px;border:1px solid #CCCCCC">
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

</div>

<script type="text/javascript">
	function submitNext() {
		var contactSyncOrImport = document.getElementById("syncOrImportContacts").value;
		var calendarSyncOrImport = document.getElementById("syncOrImportCalendars").value;
		var importContacts = false;
		var syncContacts = false;
		var importCalendars = false;		
		var syncCalendars = false;
		
		if(contactSyncOrImport == 'Sync') {
			syncContacts = true;
			importContacts = false;
		}
		else if(contactSyncOrImport == 'Import') {
			syncContacts = false;
			importContacts = true;
		}
		
		if(calendarSyncOrImport == 'Sync') {
			syncCalendars = true;
			importCalendars = false;
		}
		else if(calendarSyncOrImport == 'Import') {
			syncCalendars = false;
			importCalendars = true;
		}
			
		var url = '<s:url value="/endpoints/addEndPoint.action?endPointRequest.source=provision&endPointRequest.fmtType=jsp"/>';
	 	document.forms[0].action =url;
		document.forms[0].submit();
	}
	
</script>
</body>
</html>
