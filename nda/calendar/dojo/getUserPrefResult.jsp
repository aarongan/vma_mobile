<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<json:object>	
    <json:property name="statusCode" value="${userPreferencesResponse.statusCode}"/>
	<json:property name="statusDesc" value="${userPreferencesResponse.statusDesc}"/>
    <json:property name="beginTime" value="${userPreferencesResponse.userPreferences.beginTime}"/>
    <json:property name="beginTime_AM_PM" value="${userPreferencesResponse.userPreferences.beginTime}"/>
    <json:property name="sendDailyEmail" value="${userPreferencesResponse.userPreferences.sendDailyEmail}"/>
    <json:property name="eventInvitationType" value="${userPreferencesResponse.userPreferences.eventInvitationType}"/>
    <json:property name="eventInvitationEmailID" value="${userPreferencesResponse.userPreferences.eventInvitationEmailID}"/>
     <json:property name="eventChangesType" value="${userPreferencesResponse.userPreferences.eventChangesType}"/>
    <json:property name="eventChangeCellNumber" value="${userPreferencesResponse.userPreferences.eventChangeCellNumber}"/>   
    <json:property name="eventChangesEmailID" value="${userPreferencesResponse.userPreferences.eventChangesEmailID}"/>
    <json:property name="eventCancellationType" value="${userPreferencesResponse.userPreferences.eventCancellationType}"/>
    <json:property name="eventCancellationEmailID" value="${userPreferencesResponse.userPreferences.eventCancellationEmailID}"/>   
    <json:property name="invitationReplyType" value="${userPreferencesResponse.userPreferences.invitationReplyType}"/>
    <json:property name="invitationReplyEmailID" value="${userPreferencesResponse.userPreferences.invitationReplyEmailID}"/>
  
</json:object>


