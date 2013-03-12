<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ include file="../common/taglibraries.jsp" %>	

<html>
<body class="pl">
<s:form action="cancelSync.action">
<div id="main">
	<div id="contentDiv" style="float:left;width:250px;padding-top:10px;padding-right:10px;">
		<div style="margin-left: 20px">
			<span style="float:left;">
				<img src="<%=staticContentURL%>styles/images/ics/provision/redphone.gif" />				
			</span>
			<span style="float:left; margin-left: 20px">
				<strong>My Cell Phone</strong>
			</span><br/><br/><br/>
		</div>
		<div style="margin-left: 20px">
			<span style="float:left;">
				<img src="<%=staticContentURL%>styles/images/ics/provision/_small.gif" />				
			</span>
			<span style="float:left; margin-left: 20px">
				<strong>Aol</strong>
			</span><br/><br/>
		</div>
		<div style="margin-left: 20px">
			<span style="float:left;">
				<img src="<%=staticContentURL%>styles/images/ics/provision//outlook_small.gif" />				
			</span>
			<span style="float:left; margin-left: 20px">
				<strong>Outlook</strong>
			</span><br/><br/>
		</div>
		<div style="margin-left: 20px">
			<span style="float:left;">
				<img src="<%=staticContentURL%>styles/images/ics/provision//yahoo_small.gif" />				
			</span>
			<span style="float:left; margin-left: 20px">
				<strong>Yahoo</strong>
			</span><br/><br/>
		</div>
		<div style="margin-left: 20px">
			<span style="float:left;">
				<img src="<%=staticContentURL%>styles/images/ics/provision//google_small.gif" />				
			</span>
			<span style="float:left; margin-left: 20px">
				<strong>Google</strong>
			</span><br/><br/>
		</div>		
		<div style="margin-left: 20px;margin-top:20px;">
			<span style="float:left;">
				<a href="javascript:continue();" style="float:left" class="button" id="continueButton">
					<span class="black"><span><span>Cancel Sync</span></span></span>
				</a>
			</span><br/><br/>
		</div>
	</div>
	<div>
		<span style="float:left;margin-top:75px;">
				<img src="<%=staticContentURL%>styles/images/ics/provision//sync.gif" />				
		</span>	
	</div>
</div>
</s:form>
</body>
</html>
