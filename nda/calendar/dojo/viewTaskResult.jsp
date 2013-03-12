<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object>
 <json:property name="statusCode" value="${taskResponse.statusCode}"/>
 <json:property name="statusDesc" value="${taskResponse.statusDesc}"/>
 <json:array name="myTask" items="${taskResponse.taskVO}" var="myTask">
 <json:object>
 	  <json:property name="" value="${myTask.uid}"/>
 	  <json:property name="" value="${myTask.taskName}"/> 
 	  <json:property name="" value="${myTask.taskDescription}"/>
 	  <json:property name="" value="${myTask.taskStartDate}"/> 	  
 	  <json:property name="" value="${myTask.taskDueDate}"/> 	
 	  <json:property name="" value="${myTask.taskStatus}"/>   
 	  <json:property name="" value="${myTask.taskStatusType}"/>
 	  <json:property name="" value="${myTask.taskPriority}"/>
 </json:object>
 </json:array>
 </json:object>