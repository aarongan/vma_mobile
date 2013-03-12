<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object>
 <json:property name="statusCode" value="${trashTaskResponse.statusCode}"/>
 <json:property name="statusDesc" value="${trashTaskResponse.statusDesc}"/>
 <json:property name="operation" value="Trash"/>
 <json:array name="myTask" items="${trashTaskResponse.trashTaskVO}" var="myTask">
 <json:object>
 	  <json:property name="calId" value="${myTask.calId}"/>
 	  <json:property name="taskId" value="${myTask.taskId}"/>
 	  <json:property name="statusCode" value="${myTask.statusCode}"/>
 	  <json:property name="statusDesc" value="${myTask.statusDescription}"/>
 </json:object>
 </json:array>
  </json:object>