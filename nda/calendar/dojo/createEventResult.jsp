<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<json:object>
    <json:property name="statusDesc" value="${eventResponse.statusDesc}"/>
    <json:property name="statusCode" value="${eventResponse.statusCode}"/>
    <json:property name="operation" value="${eventResponse.operation}"/>
  <json:array name="items" items="${eventResponse.events}" var="items">
  <json:object>
      <json:property name="calId" value="${items.calId}"/>
	  <json:property name="eventId" value="${items.eventId}"/>
	  <json:property name="duration" value="${items.duration}"/>
      <json:object name="categoryType">
		 	  		<json:property name="id" value="${items.categories}"/>
		 	  		<json:property name="description" value="${items.categories}"/>
		 	  		<json:property name="url" value=""/>
		 	  	</json:object> 	 
	  <json:property name="eventSummary" value="${items.eventSummary}"/>
      <json:property name="AllDay" value="${items.allDayFlag}"/>
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
      <json:property name="eventType" value="${items.eventType}"/>
                <json:array name="attachments" items="${items.attachments}" var="attachments">
                   <json:object> 
	                   <json:property name="fileName" value="${attachments.fileName}"/>
                   </json:object>
                </json:array>
      <json:property name="seeGuestList" value="${items.seeGuestListFlag}"/>
      <json:property name="personalNotes" value="${items.personalNotes}"/>
      <json:property name="inviteOthers" value="${items.inviteOthersFlag}"/>
      <json:property name="location" value="${items.location}"/>	
      <json:property name="eventStart" value="${items.startString}"/>
      <json:property name="eventEnd" value="${items.endString}"/>
      <json:property name="description" value="${items.description}"/>	
                <json:array name="attendees" items="${items.eventAttendees}" var="attendees">
                   <json:object> 
	                   <json:property name="userId" value="${attendees.userId}"/>
                       <json:property name="contactId" value="${attendees.contactId}"/>
	               </json:object>
                </json:array>	      
      <json:object name="smsList">
		 	  		<json:property name="fullName" value="${items.userId}"/>
		 	  		<json:property name="phone" value="${items.phoneNumber}"/>
      </json:object> 	          
  </json:object>
  </json:array>
</json:object>
