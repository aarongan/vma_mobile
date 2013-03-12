<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<json:object>
    <json:property name="statusCode" value="${calResponse.statusCode}"/>
    <json:property name="statusDesc" value="${calResponse.statusDesc}"/>
    <json:property name="title" value="${calResponse.title}"/>
    <json:property name="operation" value="${calResponse.operation}"/>
  
    <json:array name="items" items="${calResponse.events}" var="items">
	 <json:object>
  	  <json:property name="eventStart" value="${items.startTime}"/>
      <json:property name="eventEnd" value="${items.endTime}"/>
      <json:property name="description" value="${items.description}"/>	
      <json:property name="duration" value="${items.duration}"/>
  	  
  	  <json:property name="eventId" value="${items.eventId}"/>
  	  <json:property name="place" value="${items.location}"/>
  	  <json:property name="title" value="${items.eventSummary}"/>
  	  <json:property name="picUrl" value="${calResponse.picURL}"/>
  	  <json:property name="color" value="${calResponse.calendarColor}"/>
  	  <json:property name="calId" value="${items.calId}"/>
      <json:object name="categoryType">
 	  		<json:property name="id" value="${items.categories}"/>
 	  		<json:property name="description" value="${items.categories}"/>
 	  		<json:property name="url" value=""/>
 	  </json:object> 
      <%--
      <json:property name="calId" value="${calResponse.calId}"/>
      <json:property name="calendarColor" value="${calResponse.calendarColor}"/>
      <json:property name="calendarName" value="${calResponse.calendarName}"/>
	  
	  <json:property name="title" value="${items.eventSummary}"/>
      <json:property name="eventType" value="${items.eventType}"/>
      <json:property name="place" value="${items.location}"/>	
      <json:property name="organizer" value="${items.eventOrganizer.contactId}"/>
      <json:property name="isAllDay" value="${items.allDayFlag}"/>
      <json:property name="seeGuestList" value="${items.seeGuestListFlag}"/>
      <json:property name="inviteOthers" value="${items.inviteOthersFlag}"/>
      <json:array name="attendees" items="${items.eventAttendees}" var="attendees">
         <json:object> 
          <json:property name="userId" value="${attendees.userId}"/>
             <json:property name="statusType" value="${attendees.participantStatus}"/>
             <json:property name="picURL" value="${attendees.picURL}"/>
      </json:object>
      </json:array>--%>
  
	 </json:object>
	</json:array>
</json:object>
