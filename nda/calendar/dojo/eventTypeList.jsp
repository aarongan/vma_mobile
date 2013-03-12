<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<json:object>
  <json:array name="items" items="${propertiesResponse.attributeList}" var="items">
  <json:object>
    <json:property name="eventID" value="${items.attributeId}"/>
    <json:property name="eventDesc" value="${items.attributeDesc}"/>
    <json:property name="eventURL" value="${items.eventURL}"/>
    </json:object>
  </json:array>    
</json:object>
