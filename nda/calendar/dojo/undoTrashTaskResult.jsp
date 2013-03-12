<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object>
 <json:property name="statusCode" value="${taskResponse.statusCode}"/>
 <json:property name="statusDesc" value="${taskResponse.statusDesc}"/>
 <json:array name="myTask" items="${taskResponse.taskVO}" var="myTask">
 <json:object>
 	  <json:property name="taskId" value="${myTask.taskId}"/>
	  <json:property name="calId" value="${myTask.calId}"/>
	  <json:property name="calendarColor" value="${myTask.calendarColor}" /> 	  
 	  <json:property name="summary" value="${myTask.summary}"/> 
 	  <json:property name="description" value="${myTask.description}"/>
 	  <json:property name="dtStart" value="${myTask.dtStart}"/> 	  
 	  <json:property name="dueDate" value="${myTask.dueDate}"/> 	
 	  <json:property name="priority" value="${myTask.priority}"/>   
 	  <json:property name="percentage" value="${myTask.percentage}"/>
 	  <json:property name="taskSetting" value="${myTask.taskSetting}"/>
 	  <json:property name="showOnMyCalendar" value="${myTask.showOnMyCalendar}"/>
 	  <json:property name="starred" value="${myTask.starred}"/>
	  <json:property name="reminderDay" value="${myTask.alarmVO.reminderDay}"/>
	  <json:property name="notificationType" value="${myTask.alarmVO.notificationType}"/>
 	  <json:array name="tags" items="${myTask.tagVO}" var="tags">
			 <json:object>
		 	  	<json:property name="tagId" value="${tags.tagId}"/>
		 	  	<json:property name="tagName" value="${tags.tagName}"/>
		 	  	<json:property name="tagURL" value="${tags.tagURL}"/>
		 	</json:object>
 	  </json:array> 	  
  </json:object>
 </json:array>
 </json:object>
