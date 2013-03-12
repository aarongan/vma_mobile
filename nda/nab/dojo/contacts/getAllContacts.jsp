<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>

 <json:object> 
  <json:property name="statusCode" value="${cntResponse.statusCode}"/>
  <json:property name="statusDesc" value="${cntResponse.statusDesc}"/>
  <json:property name="errorCode" value="${cntResponse.errorCode}"/>
  <json:property name="binStatusCode" value="${cntResponse.binStatusCode}"/>
  <json:property name="binStatusDesc" value="${cntResponse.binStatusDesc}"/>
  <json:property name="binErrorCode" value="${cntResponse.binErrorCode}"/>
  
  <json:array name="items" items="${cntResponse.contacts}" var="contact">
	<json:object>
	 <json:property name="contactFolder" value="${contact.contactFolder}"/>
	 <json:property name="contactType" value="${contact.contactType}"/>
	 <json:property name="firstName" value="${contact.firstName}" escapeXml="false"/>
	 <json:property name="lastName" value="${contact.lastName}" escapeXml="false"/>
	 <json:property name="displayName" value="${contact.displayName}" escapeXml="false"/>
	 <json:property name="contactId" value="${contact.contactId}"/>
 	 <json:property name="version" value="${contact.version}"/>
	 <json:property name="orgName" value="${contact.orgName}" escapeXml="false"/>
	 <json:property name="jobTitle" value="${contact.jobTitle}" escapeXml="false"/>
	 <json:property name="photo" value="${contact.photo}"/>
	 <json:property name="avatarId" value="${contact.picture.avatarId}"/>
	 <json:property name="avatarName" value="${contact.picture.avatarName}"/>
	 <json:property name="createdDate" value="${contact.created}"/>
	 <json:property name="updatedDate" value="${contact.modified}"/>
	 <json:property name="updatedTimestamp" value="${contact.modifiedTime}"/>
	 <json:property name="defaultEmail" value="${contact.defaultEmail}" escapeXml="false"/>
	 <json:property name="defaultPhone" value="${contact.defaultPhone}" escapeXml="false"/>
	 <json:property name="inNetworkFlag" value="${contact.inNetworkFlag}"/>
	 <json:property name="connected" value="${contact.connected}"/>
	 <json:property name="starred" value="${contact.favorite}"/>
	 <json:property name="ice" value="${contact.incaseofemergency}"/>
	 <json:property name="ics" value="${contact.ics}"/>
	 <json:property name="userId" value="${contact.userId}"/>
	 <json:property name="handset" value="${contact.handset}"/>
	 <json:property name="buddyuserid" value="${contact.buddyassoc.buddyuserid}"/>
	 <json:property name="searchMobileGroups" value="${contact.searchMobileGroupIds}" />
	  <json:property name="searchWebGroups" value="${contact.searchWebGroupIds}" />
	 <json:property name="searchEmails" value="${contact.searchEmails}" escapeXml="false"/>
	 <json:property name="searchPhones" value="${contact.searchPhones}" escapeXml="false"/>
	 <json:property name="nameEmail" escapeXml="false">
	 	,${contact.firstName},,${contact.lastName},${contact.searchEmails}
	 </json:property>
	 <json:property name="firstNameSort" escapeXml="false">
	 	${contact.firstName} ${contact.lastName} ${contact.orgName}
	 </json:property>
	 <json:property name="lastNameSort" escapeXml="false">
	 	${contact.lastName} ${contact.firstName} ${contact.orgName}
	 </json:property>
	 	 <json:property name="orgNameSort" escapeXml="false">
	 	${contact.orgName} ${contact.firstName} ${contact.lastName}
	 </json:property>
	 
	 <json:array name="groups" items="${contact.groups}" var="group">
	  <json:object>
	   <json:property name="id" value="${group.id}"/>
	   <json:property name="name" value="${group.name}"/>
	   <json:property name="version" value="${group.version}"/>
	  </json:object>
	 </json:array>
	
	<json:array name="mobileGroups" items="${contact.mobileGroups}" var="mgroup">
	  <json:object>
	   <json:property name="id" value="${mgroup.id}"/>
	   <json:property name="name" value="${mgroup.name}"/>
	   <json:property name="version" value="${mgroup.version}"/>
	  </json:object>
	</json:array>	
	 
	<json:array name="addresses" items="${contact.addresses}" var="address">
	  <json:object>
	   <json:property name="addressType" value="${address.type}"/>
	   <%--<json:property name="index" value="${address.index}"/>--%>
	   <json:property name="poBox" value="${address.poBox}"/>
	   <json:property name="street" value="${address.street}"/>
	   <json:property name="apartment" value="${address.apartment}"/>
	   <json:property name="city" value="${address.city}"/>
	   <json:property name="state" value="${address.state}"/>
	   <json:property name="zipCode" value="${address.zipCode}"/>
	   <json:property name="country" value="${address.country}"/>
	   <json:property name="preference" value="${address.preference}"/>
	  </json:object>
	</json:array>	
	
	<json:array name="phones" items="${contact.phones}" var="phone">
	  <json:object>
	   <json:property name="number" value="${phone.number}"/>
	   <%--<json:property name="index" value="${phone.index}"/>--%>
	   <json:property name="phoneType" value="${phone.type}"/>
	   <json:property name="carrier" value="${phone.carrier}"/>
	   <json:property name="preference" value="${phone.preference}"/>
	   <json:property name="userId" value="${phone.userId}"/>
	  </json:object>
	</json:array>
	
	<json:array name="emails" items="${contact.emails}" var="email">
	  <json:object>
	   <json:property name="emailType" value="${email.type}"/>
	    <%--<json:property name="index" value="${email.index}"/>--%>
	   <json:property name="address" value="${email.address}"/>
	   <json:property name="preference" value="${email.preference}"/>
	  </json:object>
	 </json:array>	
	 
	<json:array name="ims" items="${contact.ims}" var="im">
	  <json:object>
	   <json:property name="imType" value="${im.type}"/>
	   <json:property name="address" value="${im.address}"/>
	   <json:property name="preference" value="${im.preference}"/>
	  </json:object>
	 </json:array>	
	 
	 <json:array name="webpages" items="${contact.webpages}" var="webpage">
	  <json:object>
	   <json:property name="webPageType" value="${webpage.type}"/>
	   <%--<json:property name="index" value="${webpage.index}"/>--%>
	   <json:property name="url" value="${webpage.url}"/>
	  </json:object>
	 </json:array>	
	
	<json:array name="endPointAssoc" items="${contact.endPointAssoc}" var="endPointAssoc">
	  <json:object>
	   <json:property name="id" value="${endPointAssoc.endPointId}"/>
	   <%--<json:property name="type" value="${endPointAssoc.endpointtype}"/>--%>
	   <json:property name="name" value="${endPointAssoc.endPointName}"/>
	   <json:property name="state" value="${endPointAssoc.state}"/>
	   <json:property name="picUrl" value="${endpoint.imgUrl}"/>
	  </json:object>
	 </json:array>
 
  </json:object>
  </json:array>
 </json:object>
