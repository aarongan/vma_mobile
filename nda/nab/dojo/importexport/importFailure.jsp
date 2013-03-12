<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<textarea>
 <json:object> 
	  <json:property name="statusCode" value="${importResponse.statusCode}"/>
	  <json:property name="statusDesc" value="${importResponse.statusDesc}"/>
	  <json:property name="errorCode" value="${importResponse.errorCode}"/>
	  <json:property name="title" value="${importResponse.title}"/>
 </json:object>
</textarea>

