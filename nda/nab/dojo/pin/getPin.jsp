<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object> 
	  <json:property name="statusCode" value="${getPinResponse.statusCode}"/>
	  <json:property name="statusDesc" value="${getPinResponse.statusDesc}"/>
	  <json:property name="errorCode" value="${getPinResponse.errorCode}"/>
	  <json:property name="messageCode" value="${getPinResponse.messageCode}"/>
	  <json:property name="pin" value="${getPinResponse.pin}"/>
 </json:object>
