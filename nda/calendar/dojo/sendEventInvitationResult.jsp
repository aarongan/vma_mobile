<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<json:object>
    <json:property name="statusDesc" value="${eventResponse.statusDesc}"/>
    <json:property name="statusCode" value="${eventResponse.statusCode}"/>
    <json:property name="operation" value="${eventResponse.operation}"/>
  <json:array name="eventDetails" items="${eventResponse.events}" var="eventsDetails">
  <json:object>
      <json:property name="calId" value="${eventsDetails.calId}"/>
	  <json:property name="eventId" value="${eventsDetails.eventId}"/>
	  <json:property name="seeGuestList" value="${eventsDetails.seeGuestList}"/>
      <json:property name="inviteOthers" value="${eventsDetails.inviteOthers}"/>
                <json:array name="attendees" items="${eventsDetails.eventAttendees}" var="attendees">
                   <json:object> 
	                   <json:property name="userId" value="${attendees.userId}"/>
                       <json:property name="statusType" value="${attendees.participantStatus}"/>
	               </json:object>
                </json:array>	      
  </json:object>
  </json:array>
</json:object>
