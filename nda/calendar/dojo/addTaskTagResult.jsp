<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object>
 <json:property name="statusCode" value="${taskTagResponse.statusCode}"/>
 <json:property name="statusDesc" value="${taskTagResponse.statusDesc}"/>
  <json:property name="operation" value="Add"/>
 <json:array name="myTaskTag" items="${taskTagResponse.tagVO}" var="myTaskTag">
 <json:object>
 	  <json:property name="tagId" value="${myTaskTag.tagId}"/>
 	  <json:property name="tagName" value="${myTaskTag.tagName}"/>
 	  <json:property name="tagURL" value="${myTaskTag.tagURL}"/>
 </json:object>
 </json:array>
 </json:object>