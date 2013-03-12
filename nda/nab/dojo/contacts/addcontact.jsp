<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<json:object>
 <json:property name="statusCode" value="${contactResponse.statusCode}"/>
 <json:property name="statusDesc" value="${contactResponse.statusDesc}"/>
 <json:property name="errorCode" value="${contactResponse.errorCode}"/>
<json:property name="xmlContact" value="${contactResponse.xmlContact}" escapeXml="false"/>
 <json:property name="title" value="${contactResponse.title}"/>
 
  <json:array name="contact" items="${contactResponse.contacts}" var="contact">
	<json:object>
	 <json:property name="firstName" value="${contact.firstName}" escapeXml="false"/>
	 <json:property name="lastName" value="${contact.lastName}" escapeXml="false"/>
	 <json:property name="displayName" value="${contact.displayName}" escapeXml="false"/>
	 <json:property name="contactId" value="${contact.contactId}"/>
	 <json:property name="orgName" value="${contact.orgName}" escapeXml="false"/>
	 <json:property name="jobTitle" value="${contact.jobTitle}" escapeXml="false"/>
	 <json:property name="photo" value="${contact.photo}"/>
	 <json:property name="avatarId" value="${contact.picture.avatarId}"/>
	 <json:property name="avatarName" value="${contact.picture.avatarName}"/>
	 <json:property name="updatedDate" value="${contact.modified}"/>
	 <json:property name="updatedTimestamp" value="${contact.modifiedTime}"/>
	 <json:property name="defaultEmail" value="${contact.defaultEmail}" escapeXml="false"/>
	 <json:property name="defaultPhone" value="${contact.defaultPhone}" escapeXml="false"/>
	 <json:property name="starred" value="${contact.favorite}"/>
	 <json:property name="ics" value="${contact.cvi}"/>
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
	 
	 
	 <json:array name="phones" items="${contact.phones}" var="phone">
	  <json:object>
	   <json:property name="number" value="${phone.number}" escapeXml="false"/>
	   <%--<json:property name="index" value="${phone.index}"/>--%>
	   <json:property name="phoneType" value="${phone.type}"/>
	   <json:property name="carrier" value="${phone.carrier}"/>
	   <json:property name="userId" value="${phone.userId}"/>
	  </json:object>
	 </json:array>
	 
	 <%--<json:array name="searchPhones" items="${contact.phones}" var="phone">
	   <json:property value="${phone.unformattedNumber}"/>
	 </json:array>		
	 <json:array name="searchEmails" items="${contact.emails}" var="email">
	   <json:property value="${email.address}"/>
	 </json:array>--%>	
	 
	 <json:array name="emails" items="${contact.emails}" var="email">
	  <json:object>
	   <json:property name="emailType" value="${email.type}"/>
	    <%--<json:property name="index" value="${email.index}"/>--%>
	   <json:property name="address" value="${email.address}"/>

	  </json:object>
	 </json:array>	
	 
	 <json:array name="groups" items="${contact.groups}" var="group">
	  <json:object>
	   <json:property name="id" value="${group.id}"/>
	   <json:property name="name" value="${group.name}"/>

	  </json:object>
	 </json:array>
	
	 <json:array name="mobileGroups" items="${contact.mobileGroups}" var="mgroup">
	  <json:object>
	   <json:property name="id" value="${mgroup.id}"/>
	   <json:property name="name" value="${mgroup.name}"/>

	  </json:object>
	 </json:array>	
 
	 <json:array name="endPointAssoc" items="${contact.endPointAssoc}" var="endPointAssoc">
	   <json:property name="name" value="${endPointAssoc.endPointName}"/>
	 </json:array>
	 
	 <%-- Address & IM added for Flex Contact List View --%>
	 <json:array name="addresses" items="${contact.addresses}" var="address">
	  <json:object>
	   <json:property name="addressType" value="${address.type}"/>
	   <json:property name="street" value="${address.street}"/>
	   <json:property name="city" value="${address.city}"/>
	   <json:property name="state" value="${address.state}"/>
	   <json:property name="zipCode" value="${address.zipCode}"/>
	   <json:property name="country" value="${address.country}"/>
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
	   <json:property name="url" value="${webpage.url}"/>
	  </json:object>
	 </json:array>	
	 
	 <json:property name="type" value="${contact.contactType}"/>
	 <%-- BELOW ARE ARE THE PARAMS FOR SEARCHABLE RECENT CONTACT, GROUP CONTACT 
	 <json:property name="groupId" value="${contact.groupId}"/>
	 <json:property name="groupType" value="${contact.groupType}"/> --%>

    </json:object>
   </json:array>
</json:object>
