  <%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
  <%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>
  
  <json:object>
  	<json:property name="statusCode" value="${calendarResponse.statusCode}"/>
  	<json:property name="statusDesc" value="${calendarResponse.statusDesc}"/>
 	<json:array name="myCal" items="${calendarResponse.calendarMap}" var="myCal">
 		<json:object>
 	  	 <json:property name="id" value="${myCal.calId}"/>
 	  <json:property name="calendarName" value="${myCal.calendarName}"/> 
 	  <json:property name="isDefault" value="${myCal.isDefault}"/>
 	  <json:property name="picURL" value="${myCal.picURL}"/> 	  
 	  <json:property name="calendarColor" value="${myCal.calendarColor}"/> 	
 	  <json:property name="sourceid" value="${myCal.sourceId}"/>
 		</json:object>
 	</json:array>
 </json:object>
