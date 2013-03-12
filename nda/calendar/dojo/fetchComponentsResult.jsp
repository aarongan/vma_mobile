<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object>
 <json:property name="statusCode" value="${calendarResponse.statusCode}"/>
 <json:property name="statusDesc" value="${calendarResponse.statusDesc}"/>
 <json:array name="items" items="${calendarResponse.calendarMap}" var="items">
 <json:object>
 	  <json:array name="events" items="${items.eventList}" var="events">
 		<json:object>
 		 	  	<json:property name="id" value="${events.eventId}"/>
		 	  	<json:property name="title" value="${events.eventSummary}"/> 
		 	  	<json:object name="categoryType">
		 	  		<json:property name="id" value="${events.categories}"/>
		 	  		<json:property name="description" value="${events.categories}"/>
		 	  		<json:property name="url" value=""/>
		 	  	</json:object> 	  
		 	    <json:property name="calId" value="${events.calId}"/> 	
		 	  	<json:property name="calendarColor" value="${events.calendarColor}"/>
		 	  	<json:property name="picURL" value="${events.calendarPicURL}"/>
		 	  	<json:property name="calendarName" value="${events.calendarName}"/>
		  	  	<json:property name="eventStart" value="${events.startTime}"/> 	
		 	  	<json:property name="eventEnd" value="${events.endTime}"/>
		 	  	<json:property name="place" value="${events.location}"/>
		 	  	<json:property name="message" value="${events.description}"/>
		 	  	<json:property name="shareType" value="${events.permission}"/>
		 	  	<json:property name="personalNotes" value="${events.personalNotes}"/>
		 	  	<json:property name="isOwner" value="${events.isOwner}"/>
		 	  	<json:property name="isAllDay" value="${events.allDayFlag}"/>
		 	  	<json:property name="isAttachment" value="${events.attachmentFlag}"/>
		 	  	    <json:array name="'attendees'" items="${events.eventAttendees}" var="attendee">
 						<json:object>
		 	  				<json:property name="emailId" value="${attendee.userId}"/>
						</json:object>
    				</json:array>
				<json:property name="duration" value="${events.duration}"/>
				<json:property name="organizer" value="${events.eventOrganizer.userId}"/>		 	  
						 	  
		</json:object>
    	</json:array>
    	
    	<json:array name="tasks" items="${items.taskList}" var="task">
 		<json:object>
 		 	  	<json:property name="calId" value="${task.calId}"/>
 		 	  	<json:property name="taskId" value="${task.taskId}"/>
		 	  	<json:property name="summary" value="${task.summary}"/> 
		 	  	<json:property name="dueDate" value="${task.dueDate}"/> 	
		 	  	<json:property name="description" value="${task.description}"/>						 	  
		</json:object>
    	</json:array>
    	
 </json:object>
 </json:array>
 </json:object>