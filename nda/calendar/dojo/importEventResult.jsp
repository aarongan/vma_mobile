<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<textarea>
<json:object>
	<json:property name="statusCode" value="${eventResponse.statusCode}"/>
	<json:property name="statusDesc" value="${eventResponse.statusDesc}"/>
	<json:property name="operation" value="${eventResponse.operation}"/>
	<json:property name="calId" value="${eventResponse.calId}"/>
 	<json:property name="calendarName" value="${eventResponse.calendarName}"/> 
 	<json:property name="isDefault" value="${eventResponse.isDefault}"/>
 	<json:property name="picURL" value="${eventResponse.picURL}"/> 	  
 	<json:property name="calendarColor" value="${eventResponse.calendarColor}"/> 	
 	<json:property name="sourceId" value="${eventResponse.sourceId}"/>
      <json:array name="items" items="${eventResponse.events}" var="items">
  <json:object>
	  <json:property name="eventId" value="${items.eventId}"/>
	  <json:property name="title" value="${items.eventSummary}"/>
      <json:property name="eventType" value="${items.eventType}"/>
            <json:object name="categoryType">
		 	  		<json:property name="id" value="${items.categories}"/>
		 	  		<json:property name="description" value="${items.categories}"/>
		 	  		<json:property name="url" value=""/>
		 	  	</json:object> 
      <json:property name="location" value="${items.location}"/>	
      <json:property name="eventStart" value="${items.startTime}"/>
      <json:property name="eventEnd" value="${items.endTime}"/>
      <json:property name="calId" value="${eventResponse.calId}"/>
 	  <json:property name="calendarName" value="${eventResponse.calendarName}"/> 
 	  <json:property name="picURL" value="${eventResponse.picURL}"/> 	  
 	  <json:property name="calendarColor" value="${eventResponse.calendarColor}"/> 	
      <json:property name="description" value="${items.description}"/>	
      <json:property name="organizer" value="${items.eventOrganizer.contactId}"/>
      <json:property name="duration" value="${items.duration}"/>
      <json:property name="isAllDay" value="${items.allDayFlag}"/>
      <json:property name="seeGuestList" value="${items.seeGuestListFlag}"/>
       <json:property name="inviteOthers" value="${items.inviteOthersFlag}"/>
                <json:array name="attendees" items="${items.eventAttendees}" var="attendees">
                   <json:object> 
	                   <json:property name="userId" value="${attendees.userId}"/>
                       <json:property name="statusType" value="${attendees.participantStatus}"/>
                       <json:property name="picURL" value="${attendees.picURL}"/>
	               </json:object>
                </json:array>
  </json:object>
  </json:array>
</json:object></textarea>
