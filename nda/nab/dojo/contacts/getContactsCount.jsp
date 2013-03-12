<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>

 <json:object> 
  <json:property name="statusCode" value="${clResponse.statusCode}"/>
  <json:property name="statusDesc" value="${clResponse.statusDesc}"/>
  <json:property name="errorCode" value="${clResponse.errorCode}"/>
 


  <json:property name="contactsCount" value="${clResponse.itemCount}"/>
  </json:object>