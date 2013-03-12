<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

<json:object name="messageDetail">

	<json:property name="messageId" value="${eventResponse.events[0].eventId}" />
	<json:property name="folderName" value="" />
	
	<json:property name="receivedDate" value="" />
	<json:property name="relativeTime" value="" />
	<json:property name="receivedTimestamp" value="" />
			
	<json:property name="type" value="" />
	
	
	<json:property  name="from" value="${eventResponse.events[0].eventOrganizer.contactId}" />
	
	<json:array name="to" items="${eventResponse.events[0].eventAttendees}" var="attendee">
		<json:object>
			<json:property name="name" value="${attendee.userId}" />
			<json:property name="emailAddress" value="${attendee.contactId}" />
		</json:object>
	</json:array>
	
	
	<json:array name="cc" items="" var="">
	</json:array>
	
	
	<json:array name="bcc" items="" var="">
	</json:array>
	
	<json:property name="replyTo" value="" />
	<json:property name="subject" value="${eventResponse.events[0].eventSummary}" />
	<json:property name="attachment" value="" />
	<json:property name="size" value="" />
	<json:property name="priority" 	value="" />
	<json:property name="answered"	value="" />
	<json:property name="draft" value="" />
	<json:property name="read" value="" />
	<json:property name="msgSource" value="" />
	<json:property name="isStarred" value="" />
	<json:property name="inNetwork" value="" />

	<json:property name="body" value="${eventResponse.events[0].description}" escapeXml="false" />	
	
	<json:array name="tags" items="" var="">
	</json:array>
	
	<json:array name="attachmentList" items="${eventResponse.events[0].attachments}" var="attachment">

		<json:object>
			<json:property name="attachName" value="${attachment.fileName}" />
			<json:property name="attachSize" value="${attachment.fileSize}" />
			<json:property name="attachPath" value="${attachment.filePath}" />
		</json:object>
		
		
	</json:array>	

	<json:property name="calID" value="${eventResponse.events[0].calId}"/>
        <json:property name="eventType" value="${eventResponse.events[0].eventType}"/>
	<json:property name="categoryType" value="${eventResponse.events[0].categories}"/>
	<json:property name="categoryId" value="${eventResponse.events[0].categories}"/>
	<json:property name="place" value="${eventResponse.events[0].location}"/>	
	<json:property name="eventStartDate" value="${eventResponse.events[0].startTime}"/>
	<json:property name="eventEndDate" value="${eventResponse.events[0].endTime}"/>	
	<json:property name="recurrence" value="${eventResponse.events[0].recurrence}"/>
	<json:property name="note" value="${eventResponse.events[0].personalNotes}"/>
	<json:property name="duration" value="${eventResponse.events[0].duration}"/>
	<json:property name="isAllDay" value="${eventResponse.events[0].allDayFlag}"/>
	<json:property name="isOwner" value="${eventResponse.events[0].isOwner}"/>
	<json:property name="seeGuestList" value="${eventResponse.events[0].seeGuestListFlag}"/>
	<json:property name="inviteOthers" value="${eventResponse.events[0].inviteOthersFlag}"/>
	<json:property name="reminderType" value="${eventResponse.events[0].reminderType}"/>
	<json:property name="reminderEmail" value="${eventResponse.events[0].reminderEmail}"/>
	<json:property name="reminderPhoneNumber" value="${eventResponse.events[0].reminderPhoneNumber}"/>
	<json:property name="reminderStartTime" value="${eventResponse.events[0].reminderStartTime}"/>
    
	<json:object name="smsList">
	        <json:property name="fullName" value="${items.userId}"/>
	        <json:property name="phone" value="${items.phoneNumber}"/>
        </json:object> 

</json:object>
