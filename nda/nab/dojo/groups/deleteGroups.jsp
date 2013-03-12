<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object> 
	  <json:property name="statusCode" value="${groupResponse.statusCode}"/>
	  <json:property name="statusDesc" value="${groupResponse.statusDesc}"/>
	  <json:property name="errorCode" value="${groupResponse.errorCode}"/>
	  <json:property name="title" value="${groupResponse.title}"/>
	  
	  <json:array name="items" items="${groupResponse.groupVOList}" var="group">
			<json:object>
				 <json:property name="groupName" value="${group.name}"/>
				 <json:property name="groupId" value="${group.id}"/>
		  </json:object>
	  </json:array>
 </json:object>

