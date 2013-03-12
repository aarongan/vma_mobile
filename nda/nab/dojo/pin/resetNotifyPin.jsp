<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object> 
	  <json:property name="statusCode" value="${pinResponse.statusCode}"/>
	  <json:property name="statusDesc" value="${pinResponse.statusDesc}"/>
	  <json:property name="errorCode" value="${pinResponse.errorCode}"/>
	  <json:property name="messageCode" value="${pinResponse.messageCode}"/>
 </json:object>
