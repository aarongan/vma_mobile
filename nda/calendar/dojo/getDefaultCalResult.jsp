 <%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
 <%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>
 
 <json:object>
   	<json:property name="statusCode" value="${calendarResponse.statusCode}"/>
	<json:property name="statusDesc" value="${calendarResponse.statusDesc}"/>
	
  <json:array name="myCal" items="${calendarResponse.calendarVO}" var="myCal">
    <json:object>
  	  <json:property name="name" value="${myCal.calendarName}"/>       
    </json:object>	
  </json:array>
  
</json:object>