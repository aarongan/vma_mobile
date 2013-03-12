<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object> 
  <json:property name="statusCode" value="${gpsResponse.statusCode}"/>
  <json:property name="statusDesc" value="${gpsResponse.statusDesc}"/>
  <json:property name="errorCode" value="${gpsResponse.errorCode}"/>
  <json:property name="allowedSMS" value="${gpsResponse.allowedSMS}"/>
  <json:property name="pin" value="${gpsResponse.pin}"/>
 </json:object>