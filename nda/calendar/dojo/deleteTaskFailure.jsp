<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object>
 <json:property name="statusCode" value="${deleteTaskResponse.statusCode}"/>
 <json:property name="statusDesc" value="${deleteTaskResponse.statusDesc}"/>
 <json:property name="operation" value="Delete"/>
 <json:array name="myTask" items="${deleteTaskResponse.deleteTaskVO}" var="myTask">
 <json:object>
 	  <json:property name="calId" value="${myTask.calId}"/>
 	  <json:property name="taskIds" value="${myTask.taskIds}"/>
 	  <json:property name="statusCode" value="${myTask.statusCode}"/>
 	  <json:property name="statusDesc" value="${myTask.statusDesc}"/>
 </json:object>
 </json:array>
  </json:object>