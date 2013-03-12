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
	 	  <json:property name="sourceId" value="${myCal.sourceId}"/>
     	  <json:property name="reminderType" value="${myCal.reminderType}"/>  
     	  <json:property name="reminderPhoneNumber" value="${myCal.reminderPhoneNumber}"/>  
     	  <json:property name="reminderEmail" value="${myCal.reminderEmail}"/>
    	  <json:property name="isAutomaticAddEvent" value="${myCal.automaticAddEvent}"/>  
    	  <json:property name="timeType" value="${myCal.timeType}"/>
    	  <json:property name="reminderStartTime" value="${myCal.reminderStartTime}"/>
    	  <json:property name="isFreeBusyLookup" value="${myCal.freeBusyLookup}"/> 
    	
    </json:object>	  
    </json:array>
 </json:object>
