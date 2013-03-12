<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>

		

<%@page import="com.vzw.is.ics.utils.props.ICSExtProps"%>
<%@page import="com.vzw.is.ics.utils.props.ICSProps"%>
<%@page import="com.vzw.is.ics.utils.props.ICSCodeProps"%>
<%@page import="com.vzw.is.ics.utils.props.ICSMasterProps"%>
<%@page import="com.vzw.is.ics.utils.props.ICSProtocolErrCodeProps"%>
<%@page import="com.vzw.is.ics.mailconnector.pool.MailPoolImpl"%>
<%@page import="com.vzw.is.ics.ldap.service.pool.LDAPPoolImpl"%>
<%@page import="com.vzw.is.ics.utils.props.ICSHBXProps"%>
<%@page import="com.vzw.is.ics.utils.props.ICSAuditEventTypeProps"%>
<%@page import="com.vzw.is.ics.utils.props.ICSAuditRequestURIProps"%>
<%@page import="com.vzw.is.ics.utils.props.ICSEventFeedProps"%>
<%@page import="com.vzw.is.ics.utils.props.ICSMailStorePartitions"%>
<%@page import="com.vzw.is.ics.utils.props.ICSModuleProps"%>
<%@page import="com.vzw.is.ics.utils.props.ICSAvatarProps"%>
<%@page import="com.vzw.is.ics.utils.props.ICSProviderServicesMap"%>
<%@page import="com.vzw.is.ics.common.inbox.filter.ICSFiltersReferenceData"%>
<%@page import="com.vzw.is.ics.common.pref.ICSMasterAttributesProps"%>
<%@page import="com.vzw.is.ics.utils.props.ICSSegregatedProviderProps"%>
<%@page import="com.vzw.is.ics.utils.props.ICSPhoneImageProps"%>
<%@page import="com.vzw.is.ics.props.ICSPhoneCapabilityUtil"%>
<HTML>
<HEAD>
<TITLE>Property Reloader</TITLE>
<script type="text/javascript">

function showValue(propId,propName) {
	
	document.forms[0].submit;	
}

</script>

</HEAD>
<%
	String strAction  = (String) request.getParameter("action");
	String strRole  = (String) request.getParameter("role");
	String PROP_NAME = (String) request.getParameter("PROP_NAME");
	
	
 %>

<BODY>
<form>
	<%if(strRole != null && strRole.equalsIgnoreCase("admin")) {%>
		
			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_EXT_PROPS")) { %>
				<P>Reloading ICSExtProps ...</P>
					<%ICSExtProps.reload();%>	
				<P>Reloaded ICSExtProps ...</P>
			<%} %>
			
			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_PROPS")) { %>
				<P>Reloading ICSProps ...</P>
				   <%	ICSProps.reload(); %>
				<P>Reloaded ICSProps ...</P>
			<%} %>
			
			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_ERROR_FWD_MSGS")) { %>
				<P>Reloading ICSCodeProps ...</P>
				   <%	ICSCodeProps.reload(); %>
				<P>Reloaded ICSCodeProps ...</P>
			<%} %>
			
			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_MASTER_PROVIDERS")) { %>
				<P>Reloading ICSMasterProps ...</P>
				   <%	ICSMasterProps.reload(); %>
				<P>Reloaded ICSMasterProps ...</P>
			<%} %>
			
			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_MASTER_SERVICES")) { %>
				<P>Reloading ICSMasterProps ...</P>
				   <%	ICSMasterProps.reload(); %>
				<P>Reloaded ICSMasterProps ...</P>
			<%} %>
			
			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_PROTOCOL_CODE_MAP")) { %>
				<P>Reloading ICSProtocolErrCodeProps ...</P>
				   <%	ICSProtocolErrCodeProps.reload(); %>
				<P>Reloaded ICSProtocolErrCodeProps ...</P>
			<%} %>
			
			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_TERMS_AND_CONDITIONS")) { %>
				<P>Reloading ICSMasterProps ...</P>
				   <%	ICSMasterProps.reload(); %>
				<P>Reloaded ICSMasterProps ...</P>
			<%} %>
			
			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_PROVIDER_SRVC_DETAILS")) { %>
				<P>Reloading ICSProviderServicesProps ...</P>
				   <%	ICSProviderServicesMap.reload(); %>
				<P>Reloaded ICSProviderServicesProps ...</P>
			<%} %>
			
			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_HBX_PROPS")) { %>
				<P>Reloading ICSHBXProps ...</P>
				   <%	ICSHBXProps.reload(); %>
				<P>Reloaded ICSHBXProps ...</P>
			<%} %>
			
			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_MAIL_POOL")) { %>
				<P>Reloading ICS Mail Pool ...</P>
				   <%	MailPoolImpl.reload(); %>
				<P>Reloaded ICS Mail Pool ...</P>
			<%} %>
			
			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_LDAP_POOL")) { %>
				<P>Reloading LDAP Pool ...</P>
				   <%	LDAPPoolImpl.reload(); %>
				<P>Reloaded LDAP Pool  ...</P>
			<%} %>
			
			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_FILTER_DATA")) { %>
				<P>Reloading Filter Reference Data ...</P>
				   <%	ICSFiltersReferenceData.reload(); %>
				<P>Reloaded Filter Reference Data ...</P>
			<%} %>
			
			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_AVATAR_PROPS")) { %>
				<P>Reloading ICS Avatar props ...</P>
				   <%	ICSAvatarProps.reload(); %>
				<P>Reloaded ICS Avatar props ...</P>
			<%} %>
			
			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_MODULE_PROPS")) { %>
				<P>Reloading ICS Module props ...</P>
				   <%	ICSModuleProps.reload(); %>
				<P>Reloaded ICS Module props ...</P>
			<%} %>
			
			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_PHONE_IMAGE_PROPS")) { %>
				<P>Reloading ICS Phone Image props ...</P>
				   <%	ICSPhoneImageProps.reload(); %>
				<P>Reloaded ICS Phone Image props ...</P>
			<%} %>
			
			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_MASTER_ATTRIBUTE_PROPS")) { %>
				<P>Reloading ICS Master Attribute props ...</P>
				   <%	ICSMasterAttributesProps.reload(); %>
				<P>Reloaded ICS Master Attribute props ...</P>
			<%} %>
			
			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_MAIL_STORE_PARTITIONS")) { %>
				<P>Reloading ICS Mail Store partitions ...</P>
				   <%	ICSMailStorePartitions.reload(); %>
				<P>Reloaded ICS Mail Store partitions ...</P>
			<%} %>
			
			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_EVENT_FEED_PROPS")) { %>
				<P>Reloading ICS Event Feed props ...</P>
				   <%	ICSEventFeedProps.reload(); %>
				<P>Reloaded ICS Event Feed props ...</P>
			<%} %>
			
			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_AUDIT_EVENT_TYPE_PROPS")) { %>
				<P>Reloading ICS Audit Event Type props ...</P>
				   <%	ICSAuditEventTypeProps.reload(); %>
				<P>Reloaded ICS Audit Event type props ...</P>
			<%} %>
			
			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_AUDIT_REQ_URI_PROPS")) { %>
				<P>Reloading ICS Audit Request URI props ...</P>
				   <%	ICSAuditRequestURIProps.reload(); %>
				<P>Reloaded ICS Audit Request URI props ...</P>
			<%} %>

			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_SEGREGATED_PROVIDERS")) { %>
				<P>Reloading Segregated Providers Data ...</P>
				   <%	ICSSegregatedProviderProps.reload(); %>
				<P>Reloaded Filter Reference Data ...</P>
			<%} %>	
			
			<%if(strAction == null || strAction.equalsIgnoreCase("ICS_PHONE_CAPABILITY_PROPS")) { %>
				<P>Reloading ICSPhoneCapabilityProps ...</P>
					<%ICSPhoneCapabilityUtil.reload();%>	
				<P>Reloaded ICSPhoneCapabilityProps ...</P>
			<%} %>	

								
	<% } else { %>
		<P>You are not authorized to perform this operation</P>
	<%} %>		
	
	<br/>
	
			<P> Below are the actions to load specific properties. eg: /nda/common/ReloadProps.jsp?action=any of the below actions&role=authorized role </P>
			<P>ICS_EXT_PROPS </P>
			<P>ICS_PROPS </P>
			<P>ICS_ERROR_FWD_MSGS</P>
			<P>ICS_MASTER_PROVIDERS</P>
			<P>ICS_MASTER_SERVICES</P>
			<P>ICS_PROTOCOL_CODE_MAP</P>
			<P>ICS_TERMS_AND_CONDITIONS</P>	
			<P>ICS_PROVIDER_SRVC_DETAILS</P>			
			<P>ICS_HBX_PROPS</P>	
			<P>ICS_MAIL_POOL</P>
			<P>ICS_LDAP_POOL</P>
			<P>ICS_FILTER_DATA</P>
			<P>ICS_AVATAR_PROPS </P>
			<P>ICS_MODULE_PROPS </P>
			<P>ICS_MASTER_ATTRIBUTE_PROPS</P>
			<P>ICS_MAIL_STORE_PARTITIONS</P>
			<P>ICS_EVENT_FEED_PROPS</P>
			<P>ICS_AUDIT_EVENT_TYPE_PROPS</P>
			<P>ICS_AUDIT_REQ_URI_PROPS</P>	
			<P>ICS_SEGREGATED_PROVIDERS</P>
			<P>ICS_PHONE_IMAGE_PROPS</P>
			<P>ICS_PHONE_CAPABILITY_PROPS</P>
	</form>		
</BODY>


</HTML>
