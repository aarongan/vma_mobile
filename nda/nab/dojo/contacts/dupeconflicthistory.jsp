<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object> 
  <json:property name="statusCode" value="${clResponse.statusCode}"/>
  <json:property name="statusDesc" value="${clResponse.statusDesc}"/>
  <json:property name="title" value="${clResponse.title}"/>
  
  <json:array name="items" items="${clResponse.contacts}" var="contact" prettyPrint="true">
	<json:object>

	 <json:property name="contactId" value="${contact.contactId}"/>
	 <json:property name="createdDate" value="${contact.created}"/>
	 <json:property name="updatedDate" value="${contact.modified}"/>
	 <json:property name="firstName" value="${contact.firstName}"/>
	 <json:property name="lastName" value="${contact.lastName}"/>
	 <json:property name="photo" value="${contact.photo}"/>
	 <!--<json:property name="prefModeOfComm" value="${contact.prefModeOfComm}"/>-->
	 <json:property name="company" value="${contact.orgName}"/>
	 <json:property name="jobTitle" value="${contact.jobTitle}"/>
	 <json:property name="inNetworkFlag" value="${contact.inNetworkFlag}"/>
	 <json:property name="source" value="${contact.source}"/>
	 <json:property name="buddyuserid" value="${contact.buddyassoc.buddyuserid}"/>
	 <json:property name="connected" value="${contact.connected}"/>
	 <json:property name="ics" value="${contact.ics}"/>
	 
	 <!--<json:property name="version" value="${contact.version}"/>-->
	 
 	 <json:property name="middleName" value="${contact.middleName}"/>
 	 <json:property name="nickName" value="${contact.nickName}"/>
 	 <json:property name="relationship" value="${contact.relationship}"/>
 	 <json:property name="gender" value="${contact.gender}"/>
 	 <json:property name="orgUnit" value="${contact.orgUnit}"/>
 	 <json:property name="namePrefix" value="${contact.namePrefix}"/>
	 <json:property name="nameSuffix" value="${contact.nameSuffix}"/>
	 <json:property name="anniversary" value="${contact.anniversary}"/>
	 <json:property name="spouse" value="${contact.spouse}"/>
	 <json:property name="children" value="${contact.children}"/>
	 <json:property name="note" value="${contact.note}"/>
	 <json:property name="profession" value="${contact.profession}"/>
	 <json:property name="assistant" value="${contact.assistant}"/>
	 <json:property name="maritalStatus" value="${contact.maritalStatus}"/>
	 <json:property name="timeZone" value="${contact.timeZone}"/>
	 <json:property name="birthday" value="${contact.birthday}"/>
	 <json:property name="starred" value="${contact.favorite}"/>
	 <json:property name="ice" value="${contact.incaseofemergency}"/>
	 <json:property name="userId" value="${contact.userId}"/>
	 <json:property name="handset" value="${contact.handset}"/>
	 
	 <json:array name="groups" items="${contact.groups}" var="group">
	  <json:object>
	   <json:property name="id" value="${group.id}"/>
	   <json:property name="name" value="${group.name}"/>
	   <!--<json:property name="version" value="${group.version}"/>-->
	  </json:object>
	 </json:array>
	
	 <json:array name="mobileGroups" items="${contact.mobileGroups}" var="mgroup">
	  <json:object>
	   <json:property name="id" value="${mgroup.id}"/>
	   <json:property name="name" value="${mgroup.name}"/>
	   <!--<json:property name="version" value="${mgroup.version}"/>-->
	  </json:object>
	 </json:array>
	 
	 <json:array name="phones" items="${contact.phones}" var="phone">
	  <json:object>
	   <json:property name="number" value="${phone.number}"/>
	   <json:property name="index" value="${phone.index}"/>
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
	 	 
	 <json:array name="webPages" items="${contact.webpages}" var="webpage">
	  <json:object>
	   <json:property name="webPageType" value="${webpage.type}"/>
	   <%--<json:property name="index" value="${webpage.index}"/>--%>
	   <json:property name="url" value="${webpage.url}"/>
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

	 <json:array name="endPointAssoc" items="${contact.endPointAssoc}" var="endPointAssoc">
	  <json:object>
	   <json:property name="id" value="${endPointAssoc.endPointId}"/>
	   <%--<json:property name="type" value="${endPointAssoc.endpointtype}"/>--%>
	   <json:property name="name" value="${endPointAssoc.endPointName}"/>
	   <json:property name="state" value="${endPointAssoc.state}"/>
	   <json:property name="picUrl" value="${endpoint.imgUrl}"/>
	  </json:object>
	 </json:array>
	
	 <json:array name="dupeitems" items="${contact.dupeAndConflictContacts}" var="dcContact" prettyPrint="true">
		 <json:object>
			 <json:property name="contactId" value="${dcContact.contactId}"/>
			 <json:property name="createdDate" value="${dcContact.created}"/>
			 <json:property name="updatedDate" value="${dcContact.modified}"/>
			 <json:property name="firstName" value="${dcContact.firstName}"/>
			 <json:property name="lastName" value="${dcContact.lastName}"/>
			 <json:property name="photo" value="${dcContact.photo}"/>
			 <!--<json:property name="prefModeOfComm" value="${dcContact.prefModeOfComm}"/>-->
			 <json:property name="company" value="${dcContact.orgName}"/>
			 <json:property name="jobTitle" value="${dcContact.jobTitle}"/>
			 <json:property name="inNetworkFlag" value="${dcContact.inNetworkFlag}"/>
			 <json:property name="source" value="${dcContact.source}"/>
			 <json:property name="buddyuserid" value="${dcContact.buddyassoc.buddyuserid}"/>
			 <json:property name="connected" value="${dcContact.connected}"/>
			 <!--<json:property name="version" value="${dcContact.version}"/>-->
			 <json:property name="middleName" value="${dcContact.middleName}"/>
		 	 <json:property name="nickName" value="${dcContact.nickName}"/>
		 	 <json:property name="relationship" value="${dcContact.relationship}"/>
		 	 <json:property name="gender" value="${dcContact.gender}"/>
		 	 <json:property name="orgUnit" value="${dcContact.orgUnit}"/>
		 	 <json:property name="namePrefix" value="${dcContact.namePrefix}"/>
			 <json:property name="nameSuffix" value="${dcContact.nameSuffix}"/>
			 <json:property name="anniversary" value="${dcContact.anniversary}"/>
			 <json:property name="spouse" value="${dcContact.spouse}"/>
			 <json:property name="children" value="${dcContact.children}"/>
			 <json:property name="note" value="${dcContact.note}"/>
			 <json:property name="profession" value="${dcContact.profession}"/>
			 <json:property name="assistant" value="${dcContact.assistant}"/>
			 <json:property name="maritalStatus" value="${dcContact.maritalStatus}"/>
			 <json:property name="timeZone" value="${dcContact.timeZone}"/>
			 <json:property name="birthday" value="${dcContact.birthday}"/>
			<!-- <json:property name="incaseofemergency" value="${dcContact.incaseofemergency}"/>
		 	 <json:property name="favorite" value="${dcContact.favorite}"/> -->
			 <json:property name="endpointid" value="${dcContact.endpointid}"/>
			 <json:property name="endpointtype" value="${dcContact.endpointtype}"/>
			 <json:property name="endpointname" value="${dcContact.endpointname}"/>
			 
			 <json:array name="groups" items="${dcContact.groups}" var="group">
			  <json:object>
			   <json:property name="id" value="${group.id}"/>
			   <json:property name="name" value="${group.name}"/>
			   <!--<json:property name="version" value="${group.version}"/>-->
			  </json:object>
			 </json:array>
			
			 <json:array name="mobileGroups" items="${dcContact.mobileGroups}" var="mgroup">
			  <json:object>
			   <json:property name="id" value="${mgroup.id}"/>
			   <json:property name="name" value="${mgroup.name}"/>
			   <!--<json:property name="version" value="${mgroup.version}"/>-->
			  </json:object>
			 </json:array>
			 
			 <json:array name="phones" items="${dcContact.phones}" var="phone">
			  <json:object>
			   <json:property name="number" value="${phone.number}"/>
			   <json:property name="index" value="${phone.index}"/>
			   <json:property name="phoneType" value="${phone.type}"/>
			   <json:property name="carrier" value="${phone.carrier}"/>
			   <json:property name="preference" value="${phone.preference}"/>
	   		   <json:property name="userId" value="${phone.userId}"/>
			  </json:object>
			 </json:array>	
			 
			 <json:array name="emails" items="${dcContact.emails}" var="email">
			  <json:object>
			   <json:property name="emailType" value="${email.type}"/>
			   <%--<json:property name="index" value="${email.index}"/>--%>
			   <json:property name="address" value="${email.address}"/>
			   <json:property name="preference" value="${email.preference}"/>
			  </json:object>
			 </json:array>	
			 
			 <json:array name="ims" items="${dcContact.ims}" var="im">
			  <json:object>
			   <json:property name="imType" value="${im.type}"/>
			   <json:property name="address" value="${im.address}"/>
			   <json:property name="preference" value="${im.preference}"/>
			  </json:object>
			 </json:array>	
			 	 
			 <json:array name="webPages" items="${dcContact.webpages}" var="webpage">
			  <json:object>
			   <json:property name="webPageType" value="${webpage.type}"/>
			   <%--<json:property name="index" value="${webpage.index}"/>--%>
			   <json:property name="url" value="${webpage.url}"/>
			  </json:object>
			 </json:array>	
			 
			 <json:array name="addresses" items="${dcContact.addresses}" var="address">
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
			<%--
			 <json:array name="endPointAssoc" items="${dcContact.endPointAssoc}" var="endPointAssoc">
			  <json:object>
			   <json:property name="id" value="${endPointAssoc.endpointid}"/>
			   <json:property name="name" value="${endPointAssoc.endpointtype}"/>
			  </json:object>
			 </json:array> --%>
		 </json:object>
	 </json:array>
	 
		
  
  </json:object>
  </json:array>
 </json:object>
 
 
 