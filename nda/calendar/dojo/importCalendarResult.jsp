<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<textarea>
 <json:object>
 <json:property name="statusCode" value="${calResponse.statusCode}"/>
 <json:property name="statusDesc" value="${calResponse.statusDesc}"/>
 <json:property name="componentCount" value="${calResponse.componentCount}"/>
 <json:array name="items" items="${calResponse.calendarMap}" var="items">
 <json:object>
 	  <json:property name="calId" value="${items.calId}"/>
 	  <json:property name="calendarName" value="${items.calendarName}"/> 
 	  <json:property name="isDefault" value="${items.isDefault}"/>
 	  <json:property name="picURL" value="${items.picURL}"/> 	  
 	  <json:property name="calendarColor" value="${items.calendarColor}"/> 	
 	  <json:property name="sourceId" value="${items.sourceId}"/>
 	  <json:array name="events" items="${items.eventList}" var="events">
 		<json:object>
 			    <json:property name="calId" value="${items.calId}"/>
 			    <json:property name="calendarColor" value="${items.calendarColor}"/> 
 		 	  	<json:property name="id" value="${events.eventId}"/>
		 	  	<json:property name="title" value="${events.eventSummary}"/> 
		 	  	<json:object name="categoryType">
		 	  		<json:property name="id" value="${events.categories}"/>
		 	  		<json:property name="description" value="${events.categories}"/>
		 	  		<json:property name="url" value=""/>
		 	  	</json:object> 	  
		 	  	<json:property name="picURL" value="${items.picURL}"/>
		 	  	<json:property name="calendarName" value="${items.calendarName}"/> 
		  	  	<json:property name="eventStart" value="${events.startTime}"/> 	
		 	  	<json:property name="eventEnd" value="${events.endTime}"/>
		 	  	<json:property name="place" value="${events.location}"/>
		 	  	<json:property name="message" value="${events.description}"/>
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
 		 	  	<json:property name="id" value="${task.taskId}"/>
		 	  	<json:property name="taskTitle" value="${task.summary}"/> 
		 	  	<json:object name="categoryType">
		 	  		<json:property name="id" value="${task.categories}"/>
		 	  		<json:property name="description" value="${task.categories}"/>
		 	  		<json:property name="url" value="${task.categories}"/>
		 	  	</json:object> 	  
		 	  	<json:property name="dueDate" value="${task.dueDate}"/> 	
		 	  	<json:property name="taskDetails" value="${task.description}"/>
						 	  
		</json:object>
    	</json:array>
    	
 </json:object>
 </json:array>
 </json:object>
 
 </textarea>
