 <%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
 <%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object>
  	<json:property name="statusCode" value="${calendarResponse.statusCode}"/>
 	<json:property name="statusDesc" value="${calendarResponse.statusDesc}"/>
  <json:array name="items" items="${calendarResponse.calendarMap}" var="items">
  <json:object>
	  <json:property name="calId" value="${items.calId}"/>
 	  <json:property name="calendarName" value="${items.calendarName}"/> 
      <json:property name="picURL" value="${items.picURL}"/> 	  
 	  <json:property name="calendarColor" value="${items.calendarColor}"/> 	
 	  <json:property name="sourceId" value="${items.sourceId}"/>  
 	  <json:property name="shareType" value="${items.shareType}"/> 	
 	  <json:property name="calOwnerEmail" value="${items.owner}"/>
 	  <json:array name="permissions" items="${items.permissionMap}" var="permissions">
 	      <json:object>
 	       		<json:property name="userId" value="${permissions.userId}"/>
 	       		<json:property name="permissionType" value="${permissions.partial}"/>
 	      </json:object>
 	  </json:array>
  </json:object>
  </json:array>
 </json:object>
