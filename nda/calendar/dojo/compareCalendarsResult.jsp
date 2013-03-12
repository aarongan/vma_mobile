<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<json:object>
    <json:property name="statusDesc" value="${compareCalendarsResponse.statusDesc}"/>
    <json:property name="statusCode" value="${compareCalendarsResponse.statusCode}"/>
 <json:array name="items" items="${compareCalendarsResponse.freeBusyVO}" var="items">
  <json:object>
      <json:property name="calId" value="${items.calId}"/>
	          <json:array name="freebusy" items="${items.fblist}" var="freebusy">
                   <json:object> 
	                   <json:property name="type" value="${freebusy.type}"/>
	                   <json:property name="startTime" value="${freebusy.startTimeStr}"/>
	                   <json:property name="endTime" value="${freebusy.endTimeStr}"/>
	               </json:object>
               </json:array>
  </json:object> 
 </json:array>	          
</json:object>
