<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object> 
	  <json:property name="statusCode" value="${shareContactResponse.statusCode}"/>
	  <json:property name="statusDesc" value="${shareContactResponse.statusDesc}"/>
	  <json:property name="errorCode" value="${shareContactResponse.errorCode}"/>
 </json:object>

