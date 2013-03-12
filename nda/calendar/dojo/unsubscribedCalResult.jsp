 <%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
 <%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>
 
 <json:object>
 	<json:property name="statusCode" value="${calendarSubscriptionResponse.statusCode}"/>
 	<json:property name="statusDesc" value="${calendarSubscriptionResponse.statusDesc}"/>
 	<!-- <json:property name="Opearation" value="delete"/> -->


 </json:object>
  
 
 