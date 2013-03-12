<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<json:object>
 <json:property name="statusCode" value="${avatarResponse.statusCode}"/>
 <json:property name="statusDesc" value="${avatarResponse.statusDesc}"/>
 <json:property name="errorCode" value="${avatarResponse.errorCode}"/>
 <json:property name="title" value="${avatarResponse.title}"/>
 
 <json:array name="items" items="${avatarResponse.avatarMap}" var="avatar">
 	<json:object>
	 <json:property name="avatarId" value="${avatar.avatarId}"/>
	 <json:property name="avatarPath" value="${avatar.avatarPath}"/>
 	</json:object>
 </json:array>
</json:object>