<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

 <json:object>
 <json:property name="statusCode" value="${eventResponse.statusCode}"/>
 <json:property name="statusDesc" value="${eventResponse.statusDesc}"/>
 <json:array name="items" items="${eventResponse.events}" var="items">
 <json:object>
     
	<json:property name="messageId" value="${items.eventId}" />
	<json:property name="folderName" value="" />
	
	<json:property name="receivedDate" value="" />
	<json:property name="relativeTime" value="" />
	<json:property name="receivedTimestamp" value="" />
			
	<json:property name="type" value="" />
	
	<json:array name="from" items="" var="">
		<json:object>
			<json:property name="name" value="${items.eventOrganizer.name}" />
			<json:property name="emailAddress" value="${items.eventOrganizer.email}" />
		</json:object>
	</json:array>
	
	<json:array name="to" items="${items.eventAttendees}" var="attendee">
		<json:object>
			<json:property name="name" value="${attendee.name}" />
			<json:property name="emailAddress" value="${attendee.email}" />
		</json:object>
	</json:array>
	
	
	<json:array name="cc" items="" var="">
	</json:array>
	
	
	<json:array name="bcc" items="" var="">
	</json:array>
	
	<json:property name="replyTo" value="" />
	<json:property name="subject" value="${items.eventSummary}" />
	<json:property name="attachment" value="" />
	<json:property name="size" value="" />
	<json:property name="priority" 	value="" />
	<json:property name="answered"	value="" />
	<json:property name="draft" value="" />
	<json:property name="read" value="" />
	<json:property name="msgSource" value="" />
	<json:property name="isStarred" value="" />
	<json:property name="inNetwork" value="" />

	<json:property name="body" value="${items.description}" escapeXml="false" />	
	
	<json:array name="tags" items="" var="">
	</json:array>
	
	<json:array name="attachmentList" items="${items.attachments}" var="attachment">
	    <json:object>
			<json:property name="attachName" value="${attachment.fileName}" />
			<json:property name="attachSize" value="${attachment.fileSize}" />
			<json:property name="attachPath" value="${attachment.filePath}" />
			<json:property name="attachmentId" value="${attachment.attachmentId}" />
		</json:object>
	</json:array>	

    <json:property name="contactId" value="${items.eventOrganizer.nabContactId}" />
	
	<c:if test="${items.eventOrganizer.photo}">
	 	<json:property name="senderIcon"><s:property value="@com.vzw.is.ics.common.NABCommonConstants@CONTACT_IMAGE_URL"/>cdRequest.contactId=${items.eventOrganizer.nabContactId}&version=${items.eventOrganizer.photoVersion}</json:property>
	</c:if>

	<json:property name="calID" value="${items.calId}"/>
	<json:property  name="relativeDate" value="${items.relativeTime}" />
    <json:property name="eventType" value="${items.eventType}"/>
	<json:property name="categoryType" value="${items.categories}"/>
	<json:property name="categoryId" value="${items.categories}"/>
	<json:property name="place" value="${items.location}"/>	
	<json:property name="eventStartDate" value="${items.startTime}"/>
	<json:property name="eventEndDate" value="${items.endTime}"/>	
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
	<json:property name="note" value="${items.personalNotes}"/>
	<json:property name="duration" value="${items.duration}"/>
	<json:property name="isAllDay" value="${items.allDayFlag}"/>
	<json:property name="isAttachment" value="${items.attachmentFlag}"/>
	<json:property name="isOwner" value="${items.isOwner}"/>
	<json:property name="seeGuestList" value="${items.seeGuestListFlag}"/>
	<json:property name="inviteOthers" value="${items.inviteOthersFlag}"/>
   
	<json:array name="attendeeResponseList" items="${items.eventAttendees}" var="attendee">
          <json:object>
			<json:property name="userId" value="${attendee.name}" />
			<json:property name="contactId" value="${attendee.contactId}" />
			<json:property name="picURL" value="${attendee.picURL}" />
			<json:property name="permission" value="${attendee.permission}" />
			<json:property name="participantStatus" value="${attendee.participantStatus}" />
	  </json:object>
	</json:array>
	
	<json:object name="smsList">
		    <json:property name="fullName" value="${items.userId}"/>
		    <json:property name="phone" value="${items.phoneNumber}"/>
    </json:object> 

   	
 </json:object>
 </json:array>
</json:object>
