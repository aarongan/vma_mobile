<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object>
	  <json:property name="statusCode" value="${cgResponse.statusCode}"/>
	  <json:property name="statusDesc" value="${cgResponse.statusDesc}"/>
	  <json:property name="errorCode" value="${cgResponse.errorCode}"/>
	  <json:property name="title" value="${cgResponse.title}"/>
	  
  	  <json:property name="id" value="${cgResponse.group.id}"/>
	  <json:property name="name" value="${cgResponse.group.name}"/>
	  <json:property name="count" value="${cgResponse.group.contactsCount}"/>
	  
  	  <json:array name="items" items="${cgResponse.group.contactIdList}" var="contact">
		  <json:object>
			 <json:property name="id" value="${contact.contactId}"/>
		  	 <json:property name="remove" value="${contact.remove}"/>
		  	 <json:property name="statusCode" value="${contact.statusCode}"/>
		  </json:object>
	  </json:array>
 </json:object>
  
