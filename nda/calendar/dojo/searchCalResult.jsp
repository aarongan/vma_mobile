<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<json:object>
	<json:property name="statusCode" value="${searchCalendarResponse.statusCode}"/>
	<json:property name="statusDesc" value="${searchCalendarResponse.statusDesc}"/>
    <json:array name="myCal" items="${searchCalendarResponse.calendarMap}" var="myCal">
    <json:object>
    	<json:property name="calId" value="${myCal.calId}"/>      
  	  <json:property name="name" value="${myCal.calendarName}"/>       
    </json:object>	
  </json:array>
</json:object>