<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>
	<json:object>
	 
	 <json:property name="statusCode" value="${cdResponse.statusCode}"/>
	 <json:property name="statusDesc" value="${cdResponse.statusDesc}"/>
	 <json:property name="errorCode" value="${cdResponse.errorCode}"/>
	 <json:property name="title" value="${cdResponse.title}"/>
	 
	 <json:property name="contactId" value="${cdResponse.contact.contactId}"/>
	 <json:property name="updatedDate" value="${cdResponse.contact.modified}"/>
	 <json:property name="firstName" value="${cdResponse.contact.firstName}" escapeXml="false" />
	 <json:property name="lastName" value="${cdResponse.contact.lastName}" escapeXml="false" />
	 <json:property name="displayName" value="${cdResponse.contact.displayName}" escapeXml="false"/>
	 <json:property name="photo" value="${cdResponse.contact.photo}"/>
	 <json:property name="photoUrl" value="${cdResponse.contact.photoUrl}"/>
	 <!--<json:property name="prefModeOfComm" value="${cdResponse.contact.prefModeOfComm}"/>-->
	 <json:property name="orgName" value="${cdResponse.contact.orgName}" escapeXml="false" />
	 <json:property name="jobTitle" value="${cdResponse.contact.jobTitle}" escapeXml="false" />
	 <json:property name="source" value="${cdResponse.contact.source}"/>
	 <json:property name="buddyuserid" value="${cdResponse.contact.buddyassoc.buddyuserid}"/>
	 <json:property name="buddyStatus" value="${cdResponse.contact.buddyassoc.status}"/>
	 <json:property name="buddyMDN" value="${cdResponse.contact.buddyassoc.buddymdn}"/>
	 <json:property name="starred" value="${cdResponse.contact.favorite}"/>
	 <json:property name="ics" value="${cdResponse.contact.cvi}"/>
	 <json:property name="userId" value="${cdResponse.contact.userId}"/>
	 <json:property name="handset" value="${cdResponse.contact.handset}"/>
	 	 <json:property name="middleName" value="${cdResponse.contact.middleName}" escapeXml="false" />
	 	 <json:property name="nickName" value="${cdResponse.contact.nickName}" escapeXml="false" />
	 	 <json:property name="relationship" value="${cdResponse.contact.relationship}" escapeXml="false"/>
	 	 <json:property name="gender" value="${cdResponse.contact.gender}"/>
	 	 <json:property name="orgUnit" value="${cdResponse.contact.orgUnit}" escapeXml="false"/>
	 	 <json:property name="namePrefix" value="${cdResponse.contact.namePrefix}"/>
		 <json:property name="nameSuffix" value="${cdResponse.contact.nameSuffix}"/>
		 <json:property name="anniversary" value="${cdResponse.contact.anniversary}"/>
		 <json:property name="spouse" value="${cdResponse.contact.spouse}" escapeXml="false"/>
		 <json:property name="children" value="${cdResponse.contact.children}" escapeXml="false"/>
		 <json:property name="note" value="${cdResponse.contact.note}" escapeXml="false"/>
		 <json:property name="profession" value="${cdResponse.contact.profession}" escapeXml="false"/>
		 <json:property name="assistant" value="${cdResponse.contact.assistant}" escapeXml="false"/>
		 <json:property name="maritalStatus" value="${cdResponse.contact.maritalStatus}"/>
	 <json:property name="updatedTimestamp" value="${cdResponse.contact.modifiedTime}"/>
		 <json:property name="timeZone" value="${cdResponse.contact.timeZone}"/>
		 <json:property name="birthday" value="${cdResponse.contact.birthday}"/>
	 <json:property name="avatarId" value="${cdResponse.contact.picture.avatarId}"/>
	 <json:property name="avatarName" value="${cdResponse.contact.picture.avatarName}"/>
	 <json:array name="groups" items="${cdResponse.contact.groups}" var="group">
	  <json:object>
	   <json:property name="id" value="${group.id}"/>
	   <json:property name="name" value="${group.name}"/>
	  </json:object>
	 </json:array>
	
	 <json:array name="mobileGroups" items="${cdResponse.contact.mobileGroups}" var="mgroup">
	  <json:object>
	   <json:property name="id" value="${mgroup.id}"/>
	   <json:property name="name" value="${mgroup.name}"/>
	  </json:object>
	 </json:array>
	 
	 <json:object name="phones">  
		 <s:set name="mobilePhone" value="cdResponse.contact.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@MOBILE_PHONE_TYPE]" />
		 <s:if test="%{#mobilePhone.value != null && #mobilePhone.value.size > 0}" > 
		 <json:array name="${mobilePhone.key}" items="${mobilePhone.value}" var="phone">
				<json:object> 
				   <json:property name="number" value="${phone.number}" escapeXml="false"/>
				   <json:property name="index" value="${phone.index}" escapeXml="false"/>
				   <json:property name="carrier" value="${phone.carrier}" escapeXml="false"/>
			   </json:object>
		 </json:array> 
		 </s:if>
		 
		 <s:set name="homePhone" value="cdResponse.contact.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@HOME_PHONE_TYPE]" />
		  <s:if test="%{#homePhone.value != null && #homePhone.value.size > 0}" > 
		 <json:array name="${homePhone.key}" items="${homePhone.value}" var="phone">
				<json:object> 
				   <json:property name="number" value="${phone.number}" escapeXml="false"/>
				   <json:property name="index" value="${phone.index}"/>
			   </json:object>
		 </json:array> 
		 </s:if>
		 
		 <s:set name="businessPhone" value="cdResponse.contact.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@BUSINESS_PHONE_TYPE]" />
		  <s:if test="%{#businessPhone.value != null && #businessPhone.value.size > 0}" > 
		 <json:array name="${businessPhone.key}" items="${businessPhone.value}" var="phone">
				<json:object> 
				   <json:property name="number" value="${phone.number}" escapeXml="false"/>
				   <json:property name="index" value="${phone.index}"/>
			   </json:object>
		 </json:array> 
		 </s:if>
		 
		 <s:set name="otherPhone" value="cdResponse.contact.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@OTHER_PHONE_TYPE]" />
		  <s:if test="%{#otherPhone.value != null && #otherPhone.value.size > 0}" > 
			 <json:array name="${otherPhone.key}" items="${otherPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		  </s:if>
		  
		 <s:set name="pagerPhone" value="cdResponse.contact.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@PAGER_TYPE]" />
		 <s:if test="%{#pagerPhone.value != null && #pagerPhone.value.size > 0}" > 
			 <json:array name="${pagerPhone.key}" items="${pagerPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
		 
		  <s:set name="businessFaxPhone" value="cdResponse.contact.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@BUSINESS_FAX_TYPE]" />
		   <s:if test="%{#businessFaxPhone.value != null && #businessFaxPhone.value.size > 0}" > 
			 <json:array name="${businessFaxPhone.key}" items="${businessFaxPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
		 
		 <s:set name="assistantPhone" value="cdResponse.contact.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@ASSISTANT_PHONE_TYPE]" />
		  <s:if test="%{#assistantPhone.value != null && #assistantPhone.value.size > 0}" > 
			 <json:array name="${assistantPhone.key}" items="${assistantPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
		 
		<s:set name="callbackPhone" value="cdResponse.contact.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@CALL_BACK_PHONE_TYPE]" />
		 <s:if test="%{#callbackPhone.value != null && #callbackPhone.value.size > 0}" > 
			 <json:array name="${callbackPhone.key}" items="${callbackPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>

		<s:set name="carPhone" value="cdResponse.contact.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@CAR_PHONE_TYPE]" />
		 <s:if test="%{#carPhone.value != null && #carPhone.value.size > 0}" > 
			 <json:array name="${carPhone.key}" items="${carPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
		 
		<s:set name="companymainPhone" value="cdResponse.contact.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@COMPANY_MAIN_PHONE_TYPE]" />
		  <s:if test="%{#companymainPhone.value != null && #companymainPhone.value.size > 0}" > 
			 <json:array name="${companymainPhone.key}" items="${companymainPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>

		<s:set name="primaryPhone" value="cdResponse.contact.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@PRIMARY_PHONE_TYPE]" />
		 <s:if test="%{#primaryPhone.value != null && #primaryPhone.value.size > 0}" > 
			 <json:array name="${primaryPhone.key}" items="${primaryPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
	
		<s:set name="radioPhone" value="cdResponse.contact.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@RADIO_PHONE_TYPE]" />
		 <s:if test="%{#radioPhone.value != null && #radioPhone.value.size > 0}" > 
			 <json:array name="${radioPhone.key}" items="${radioPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>		 

		<s:set name="schoolPhone" value="cdResponse.contact.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@SCHOOL_PHONE_TYPE]" />
		 <s:if test="%{#schoolPhone.value != null && #schoolPhone.value.size > 0}" > 
			 <json:array name="${schoolPhone.key}" items="${schoolPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
		 
		<s:set name="telexPhone" value="cdResponse.contact.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@TELEX_PHONE_TYPE]" />
		 <s:if test="%{#telexPhone.value != null && #telexPhone.value.size > 0}" > 
			 <json:array name="${telexPhone.key}" items="${telexPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
		 
		<s:set name="ttydPhone" value="cdResponse.contact.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@TTYD_PHONE_TYPE]" />
		 <s:if test="%{#ttydPhone.value != null && #ttydPhone.value.size > 0}" > 
			 <json:array name="${ttydPhone.key}" items="${ttydPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
		 
		<s:set name="videoPhone" value="cdResponse.contact.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@VIDEO_PHONE_TYPE]" />
		 <s:if test="%{#videoPhone.value != null && #videoPhone.value.size > 0}" > 
			 <json:array name="${videoPhone.key}" items="${videoPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
		 
		<s:set name="voipPhone" value="cdResponse.contact.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@VOIP_PHONE_TYPE]" />
		  <s:if test="%{#voipPhone.value != null && #voipPhone.value.size > 0}" > 
			 <json:array name="${voipPhone.key}" items="${voipPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
		 
		<s:set name="homefaxPhone" value="cdResponse.contact.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@HOME_FAX_TYPE]" />
		  <s:if test="%{#homefaxPhone.value != null && #homefaxPhone.value.size > 0}" > 
			 <json:array name="${homefaxPhone.key}" items="${homefaxPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>

		<s:set name="primaryfaxPhone" value="cdResponse.contact.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@PRIMARY_FAX_TYPE]" />
		 <s:if test="%{#primaryfaxPhone.value != null && #primaryfaxPhone.value.size > 0}" > 
			 <json:array name="${primaryfaxPhone.key}" items="${primaryfaxPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
		 
		<s:set name="otherfaxPhone" value="cdResponse.contact.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@OTHER_FAX_TYPE]" />
		  <s:if test="%{#otherfaxPhone.value != null && #otherfaxPhone.value.size > 0}" > 
			 <json:array name="${otherfaxPhone.key}" items="${otherfaxPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>		 		 		 		 		 		 		 		 		 		 		 
	</json:object>
	 	 
	 <json:object name="addresses">
		 <s:set name="homeAddress" value="cdResponse.contact.addressMap[@com.vzw.is.ics.common.NABCommonConstants@HOME_ADDR_TYPE]" />
		 <s:if test="%{#homeAddress.value != null && #homeAddress.value.size > 0}" > 
			<json:array name="${homeAddress.key}" items="${homeAddress.value}" var="address">
		 		<json:object> 
					   <json:property name="index" value="${address.index}"/>
					   <json:property name="street" value="${address.street}" escapeXml="false"/>
					   <json:property name="city" value="${address.city}" escapeXml="false"/>
					   <json:property name="state" value="${address.state}"/>
					   <json:property name="zipCode" value="${address.zipCode}" escapeXml="false"/>
					   <json:property name="country" value="${address.country}" escapeXml="false" />
				  <%-- <json:property name="addressType" value="${address.type}"/>
					   <json:property name="preference" value="${address.preference}"/> --%>
			   </json:object>
	 		</json:array> 
		 </s:if>
			 
		 <s:set name="personalAddress" value="cdResponse.contact.addressMap[@com.vzw.is.ics.common.NABCommonConstants@PERSONAL_ADDR_TYPE]" />
		 <s:if test="%{#personalAddress.value != null && #personalAddress.value.size > 0}" > 
			<json:array name="${personalAddress.key}" items="${personalAddress.value}" var="address">
		 		<json:object> 
					   <json:property name="index" value="${address.index}"/>
					   <json:property name="street" value="${address.street}" escapeXml="false"/>
					   <json:property name="city" value="${address.city}" escapeXml="false"/>
					   <json:property name="state" value="${address.state}"/>
					   <json:property name="zipCode" value="${address.zipCode}" escapeXml="false"/>
					   <json:property name="country" value="${address.country}" escapeXml="false"/>
			   </json:object>
	 		</json:array> 
		 </s:if>
		 
		 <s:set name="businessAddress" value="cdResponse.contact.addressMap[@com.vzw.is.ics.common.NABCommonConstants@BUSINESS_ADDR_TYPE]" />
		  <s:if test="%{#businessAddress.value != null && #businessAddress.value.size > 0}" > 
			<json:array name="${businessAddress.key}" items="${businessAddress.value}" var="address">
		 		<json:object> 
					   <json:property name="index" value="${address.index}"/>
					   <json:property name="street" value="${address.street}" escapeXml="false"/>
					   <json:property name="city" value="${address.city}" escapeXml="false"/>
					   <json:property name="state" value="${address.state}"/>
					   <json:property name="zipCode" value="${address.zipCode}" escapeXml="false"/>
					   <json:property name="country" value="${address.country}" escapeXml="false"/>
			   </json:object>
	 		</json:array> 
		 </s:if>
		 
		 <s:set name="otherAddress" value="cdResponse.contact.addressMap[@com.vzw.is.ics.common.NABCommonConstants@OTHER_ADDR_TYPE]" />
		  <s:if test="%{#otherAddress.value != null && #otherAddress.value.size > 0}" > 
			<json:array name="${otherAddress.key}" items="${otherAddress.value}" var="address">
		 		<json:object> 
					   <json:property name="index" value="${address.index}"/>
					   <json:property name="street" value="${address.street}" escapeXml="false"/>
					   <json:property name="city" value="${address.city}" escapeXml="false"/>
					   <json:property name="state" value="${address.state}"/>
					   <json:property name="zipCode" value="${address.zipCode}" escapeXml="false"/>
					   <json:property name="country" value="${address.country}" escapeXml="false"/>
			   </json:object>
	 		</json:array> 
		 </s:if>			 			 
	 </json:object>
	 
	 <json:object name="emails">
		 <s:set name="personalEmail" value="cdResponse.contact.emailMap[@com.vzw.is.ics.common.NABCommonConstants@PERSONAL_EMAIL_ADDR_TYPE]" />
		 <s:if test="%{#personalEmail.value != null && #personalEmail.value.size > 0}" > 
			<json:array name="${personalEmail.key}" items="${personalEmail.value}" var="emailDetail">
		 		<json:object> 
					  <json:property name="index" value="${emailDetail.index}"/>
					  <json:property name="address" value="${emailDetail.address}" escapeXml="false"/>
					  <json:property name="preference" value="${emailDetail.preference}"/>
					  <%-- <json:property name="emailType" value="${emailDetail.type}"/> --%> 
			   </json:object>
	 		</json:array> 
		 </s:if>
		 
		 <s:set name="businessEmail" value="cdResponse.contact.emailMap[@com.vzw.is.ics.common.NABCommonConstants@BUSINESS_EMAIL_ADDR_TYPE]" />
		  <s:if test="%{#businessEmail.value != null && #businessEmail.value.size > 0}" > 
			<json:array name="${businessEmail.key}" items="${businessEmail.value}" var="emailDetail">
		 		<json:object> 
					  <json:property name="index" value="${emailDetail.index}"/>
					  <json:property name="address" value="${emailDetail.address}" escapeXml="false"/>
					  <json:property name="preference" value="${emailDetail.preference}"/>
			   </json:object>
	 		</json:array> 
		 </s:if>
		 
		 <s:set name="otherEmail" value="cdResponse.contact.emailMap[@com.vzw.is.ics.common.NABCommonConstants@OTHER_EMAIL_ADDR_TYPE]" />
		  <s:if test="%{#otherEmail.value != null && #otherEmail.value.size > 0}" > 
			<json:array name="${otherEmail.key}" items="${otherEmail.value}" var="emailDetail">
		 		<json:object> 
					  <json:property name="index" value="${emailDetail.index}"/>
					  <json:property name="address" value="${emailDetail.address}" escapeXml="false"/>
					  <json:property name="preference" value="${emailDetail.preference}"/>
			   </json:object>
	 		</json:array> 
		 </s:if>			 			 
	 </json:object>
	 
	  <json:object name="webpages">
		 <s:set name="businessWebPage" value="cdResponse.contact.webPageMap[@com.vzw.is.ics.common.NABCommonConstants@BUSINESS_WEB_PAGE_TYPE]" />
		 <s:if test="%{#businessWebPage.value != null && #businessWebPage.value.size > 0}" > 
			<json:array name="${businessWebPage.key}" items="${businessWebPage.value}" var="webpage">
		 		<json:object> 
				   <%-- <json:property name="webPageType" value="${webpage.type}"/> --%>
				   <json:property name="index" value="${webpage.index}"/>
				   <json:property name="url" value="${webpage.url}" escapeXml="false"/>
			   </json:object>
 			</json:array> 
		 </s:if>
		 
		 <s:set name="homeWebPage" value="cdResponse.contact.webPageMap[@com.vzw.is.ics.common.NABCommonConstants@HOME_WEB_PAGE_TYPE]" />
		  <s:if test="%{#homeWebPage.value != null && #homeWebPage.value.size > 0}" > 
			<json:array name="${homeWebPage.key}" items="${homeWebPage.value}" var="webpage">
		 		<json:object> 
				   <json:property name="index" value="${webpage.index}"/>
				   <json:property name="url" value="${webpage.url}" escapeXml="false"/>
			   </json:object>
	 		</json:array> 
		 </s:if>
		 
		 <s:set name="otherWebPage" value="cdResponse.contact.webPageMap[@com.vzw.is.ics.common.NABCommonConstants@OTHER_WEB_PAGE_TYPE]" />
		  <s:if test="%{#otherWebPage.value != null && #otherWebPage.value.size > 0}" > 
			<json:array name="${otherWebPage.key}" items="${otherWebPage.value}" var="webpage">
		 		<json:object> 
				   <json:property name="index" value="${webpage.index}"/>
				   <json:property name="url" value="${webpage.url}" escapeXml="false"/>
			   </json:object>
	 		</json:array> 
		 </s:if>			 			 
	 </json:object>
	 
	 
	 <json:array name="ims" items="${cdResponse.contact.ims}" var="im">
	  <json:object>
	   <json:property name="imType" value="${im.type}"/>
	   <json:property name="address" value="${im.address}" escapeXml="false"/>
	   <json:property name="preference" value="${im.preference}"/>
	  </json:object>
	 </json:array>	
	 	 
	 <json:array name="endPointAssoc" items="${cdResponse.contact.endPointAssoc}" var="endPointAssoc">

	   <json:property name="name" value="${endPointAssoc.endPointName}"/>

	 </json:array>
  
  </json:object>
