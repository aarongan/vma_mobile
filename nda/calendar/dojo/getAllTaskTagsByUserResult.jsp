<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object>
 <json:property name="statusCode" value="${taskTagResponse.statusCode}"/>
 <json:property name="statusDesc" value="${taskTagResponse.statusDesc}"/>
 <json:array name="items" items="${taskTagResponse.tagVO}" var="myTaskTag">
 <json:object>
 	  <json:property name="id" value="${myTaskTag.tagId}"/>
 	  <json:property name="name" value="${myTaskTag.tagName}"/>
 	  <json:property name="tagURL" value="${myTaskTag.tagURL}"/>
 </json:object>
 </json:array>
 </json:object>
