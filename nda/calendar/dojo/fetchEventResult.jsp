<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<json:object>
    <json:property name="statusDesc" value="${eventResponse.statusDesc}"/>
    <json:property name="statusCode" value="${eventResponse.statusCode}"/>
    <json:property name="operation" value="${eventResponse.operation}"/>
    <json:property name="color" value="${eventResponse.calendarColor}"/>
    <json:property name="calId" value="${eventResponse.calId}"/>
  <json:array name="items" items="${eventResponse.events}" var="items">
  <json:object>
      <json:property name="calId" value="${eventResponse.calId}"/>
      <json:property name="calendarColor" value="${eventResponse.calendarColor}"/>
      <json:property name="calendarName" value="${eventResponse.calendarName}"/>
	  <json:property name="eventId" value="${items.eventId}"/>
	  <json:property name="title" value="${items.eventSummary}"/>
      <json:property name="eventType" value="${items.eventType}"/>
                <json:object name="categoryType">
		 	  		<json:property name="id" value="${items.categories}"/>
		 	  		<json:property name="description" value="${items.categories}"/>
		 	  		<json:property name="url" value=""/>
		 	    </json:object> 
      <json:property name="place" value="${items.location}"/>	
      <json:property name="eventStart" value="${items.startTime}"/>
      <json:property name="eventEnd" value="${items.endTime}"/>
      <json:property name="description" value="${items.description}"/>	
      <json:property name="recurrenceType" value="${items.eventRecurrence.rrules.frequency}"/>
                <json:object name="recurrenceDetails">
		 	  		<json:property name="count" value="${items.eventRecurrence.rrules.count}"/>
		 	  		<json:property name="interval" value="${items.eventRecurrence.rrules.interval}"/>
		 	  		<json:property name="until" value="${items.eventRecurrence.rrules.untilDate}"/>
		 	  		<json:property name="recurrenceMonth" value="${items.eventRecurrence.rrules.recurrenceMonth}"/>
		 	  		<json:property name="recurrenceMonthDay" value="${items.eventRecurrence.rrules.recurrenceMonthDay}"/>
		 	  		<json:property name="recurrenceDay" value="${items.eventRecurrence.rrules.recurrenceDay}"/>
		 	  		<json:property name="recurrenceWeek" value="${items.eventRecurrence.rrules.recurrenceWeek}"/>
		 	  	</json:object> 
      <json:property name="organizer" value="${items.eventOrganizer.contactId}"/>
      <json:property name="duration" value="${items.duration}"/>
      <json:property name="isAllDay" value="${items.allDayFlag}"/>
      <json:property name="isAttachment" value="${items.attachmentFlag}"/>
      <json:property name="isOwner" value="${items.isOwner}"/>
      <json:property name="seeGuestList" value="${items.seeGuestListFlag}"/>
      <json:property name="inviteOthers" value="${items.inviteOthersFlag}"/>
      <json:property name="picURL" value="${eventResponse.picURL}"/>
                    <json:array name="attendees" items="${items.eventAttendees}" var="attendees">
                    <json:object> 
	                   <json:property name="userId" value="${attendees.name}"/>
                       <json:property name="statusType" value="${attendees.participantStatus}"/>
                       <json:property name="picURL" value="${attendees.picURL}"/>
	                </json:object>
                    </json:array>
  </json:object>
  </json:array>
</json:object>
