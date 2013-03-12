<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>
	
 <json:object>
	 <json:property name="statusCode" value="${profileResponse.statusCode}"/>
	 <json:property name="statusDesc" value="${profileResponse.statusDesc}"/>
	 <json:property name="title" value="${profileResponse.title}"/>
	 
	 <json:property name="mdn" value="${profileResponse.mdn}"/>
	 <json:property name="email" value="${profileResponse.emailId}"/>
	 <json:property name="loginId" value="${profileResponse.loginId}"/>
	 
	 <json:property name="updatedDate" value="${profileResponse.profile.modified}"/>
	 <json:property name="firstName" value="${profileResponse.profile.firstName}" escapeXml="false"/>
	 <json:property name="lastName" value="${profileResponse.profile.lastName}" escapeXml="false"/>
	 <json:property name="photo" value="${profileResponse.profile.photo}"/>
	 <json:property name="prefModeOfComm" value="${profileResponse.profile.prefModeOfComm}"/>
	 <json:property name="orgName" value="${profileResponse.profile.orgName}" escapeXml="false"/>
	 <json:property name="jobTitle" value="${profileResponse.profile.jobTitle}" escapeXml="false"/>
 	 <%--<json:object name="newFields">--%>
 	 <%-- Business Requirement DONOT TAKE connected out  --%>
 	 <json:property name="ics" value="C"/>
	 	 <json:property name="middleName" value="${profileResponse.profile.middleName}" escapeXml="false"/>
	 	 <json:property name="nickName" value="${profileResponse.profile.nickName}" escapeXml="false"/>
	 	 <json:property name="relationship" value="${profileResponse.profile.relationship}" escapeXml="false"/>
	 	 <json:property name="gender" value="${profileResponse.profile.gender}"/>
	 	 <json:property name="orgUnit" value="${profileResponse.profile.orgUnit}" escapeXml="false"/>
	 	 <json:property name="namePrefix" value="${profileResponse.profile.namePrefix}"/>
		 <json:property name="nameSuffix" value="${profileResponse.profile.nameSuffix}"/>
		 <json:property name="anniversary" value="${profileResponse.profile.anniversary}"/>
		 <json:property name="spouse" value="${profileResponse.profile.spouse}" escapeXml="false"/>
		 <json:property name="children" value="${profileResponse.profile.children}" escapeXml="false"/>
		 <json:property name="note" value="${profileResponse.profile.note}" escapeXml="false"/>
		 <json:property name="profession" value="${profileResponse.profile.profession}" escapeXml="false"/>
		 <json:property name="assistant" value="${profileResponse.profile.assistant}" escapeXml="false"/>
		 <json:property name="maritalStatus" value="${profileResponse.profile.maritalStatus}"/>
		 <json:property name="timeZone" value="${profileResponse.profile.timeZone}"/>
		 <json:property name="birthday" value="${profileResponse.profile.birthday}"/>
     <%--</json:object>--%>
     <json:property name="avatarId" value="${profileResponse.profile.picture.avatarId}"/>
     <json:property name="avatarName" value="${profileResponse.profile.picture.avatarName}"/>
	 
	 <s:if test="%{profileResponse.profile.photo == true && profileResponse.profile.picture.avatarId == null}">
	 	<json:property name="picUrl"><s:property value="@com.vzw.is.ics.common.NABCommonConstants@PROFILE_IMAGE_URL"/></json:property>
	 </s:if>
	 
	 <json:object name="phones">  
		 <s:set name="mobilePhone" value="profileResponse.profile.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@MOBILE_PHONE_TYPE]" />
		 <s:if test="%{#mobilePhone.value != null && #mobilePhone.value.size > 0}" > 
		 <json:array name="${mobilePhone.key}" items="${mobilePhone.value}" var="phone">
				<json:object> 
				   <json:property name="number" value="${phone.number}" escapeXml="false"/>
				   <json:property name="index" value="${phone.index}" escapeXml="false"/>
				   <json:property name="carrier" value="${phone.carrier}" escapeXml="false"/>
			   </json:object>
		 </json:array> 
		 </s:if>
		 
		 <s:set name="homePhone" value="profileResponse.profile.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@HOME_PHONE_TYPE]" />
		  <s:if test="%{#homePhone.value != null && #homePhone.value.size > 0}" > 
		 <json:array name="${homePhone.key}" items="${homePhone.value}" var="phone">
				<json:object> 
				   <json:property name="number" value="${phone.number}" escapeXml="false"/>
				   <json:property name="index" value="${phone.index}"/>
			   </json:object>
		 </json:array> 
		 </s:if>
		 
		 <s:set name="businessPhone" value="profileResponse.profile.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@BUSINESS_PHONE_TYPE]" />
		  <s:if test="%{#businessPhone.value != null && #businessPhone.value.size > 0}" > 
		 <json:array name="${businessPhone.key}" items="${businessPhone.value}" var="phone">
				<json:object> 
				   <json:property name="number" value="${phone.number}" escapeXml="false"/>
				   <json:property name="index" value="${phone.index}"/>
			   </json:object>
		 </json:array> 
		 </s:if>
		 
		 <s:set name="otherPhone" value="profileResponse.profile.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@OTHER_PHONE_TYPE]" />
		  <s:if test="%{#otherPhone.value != null && #otherPhone.value.size > 0}" > 
			 <json:array name="${otherPhone.key}" items="${otherPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		  </s:if>
		  
		 <s:set name="pagerPhone" value="profileResponse.profile.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@PAGER_TYPE]" />
		 <s:if test="%{#pagerPhone.value != null && #pagerPhone.value.size > 0}" > 
			 <json:array name="${pagerPhone.key}" items="${pagerPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
		 
		  <s:set name="businessFaxPhone" value="profileResponse.profile.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@BUSINESS_FAX_TYPE]" />
		   <s:if test="%{#businessFaxPhone.value != null && #businessFaxPhone.value.size > 0}" > 
			 <json:array name="${businessFaxPhone.key}" items="${businessFaxPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
		 
		 <s:set name="assistantPhone" value="profileResponse.profile.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@ASSISTANT_PHONE_TYPE]" />
		  <s:if test="%{#assistantPhone.value != null && #assistantPhone.value.size > 0}" > 
			 <json:array name="${assistantPhone.key}" items="${assistantPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
		 
		<s:set name="callbackPhone" value="profileResponse.profile.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@CALL_BACK_PHONE_TYPE]" />
		 <s:if test="%{#callbackPhone.value != null && #callbackPhone.value.size > 0}" > 
			 <json:array name="${callbackPhone.key}" items="${callbackPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>

		<s:set name="carPhone" value="profileResponse.profile.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@CAR_PHONE_TYPE]" />
		 <s:if test="%{#carPhone.value != null && #carPhone.value.size > 0}" > 
			 <json:array name="${carPhone.key}" items="${carPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
		 
		<s:set name="companymainPhone" value="profileResponse.profile.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@COMPANY_MAIN_PHONE_TYPE]" />
		  <s:if test="%{#companymainPhone.value != null && #companymainPhone.value.size > 0}" > 
			 <json:array name="${companymainPhone.key}" items="${companymainPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>

		<s:set name="primaryPhone" value="profileResponse.profile.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@PRIMARY_PHONE_TYPE]" />
		 <s:if test="%{#primaryPhone.value != null && #primaryPhone.value.size > 0}" > 
			 <json:array name="${primaryPhone.key}" items="${primaryPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
	
		<s:set name="radioPhone" value="profileResponse.profile.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@RADIO_PHONE_TYPE]" />
		 <s:if test="%{#radioPhone.value != null && #radioPhone.value.size > 0}" > 
			 <json:array name="${radioPhone.key}" items="${radioPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>		 

		<s:set name="schoolPhone" value="profileResponse.profile.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@SCHOOL_PHONE_TYPE]" />
		 <s:if test="%{#schoolPhone.value != null && #schoolPhone.value.size > 0}" > 
			 <json:array name="${schoolPhone.key}" items="${schoolPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
		 
		<s:set name="telexPhone" value="profileResponse.profile.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@TELEX_PHONE_TYPE]" />
		 <s:if test="%{#telexPhone.value != null && #telexPhone.value.size > 0}" > 
			 <json:array name="${telexPhone.key}" items="${telexPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
		 
		<s:set name="ttydPhone" value="profileResponse.profile.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@TTYD_PHONE_TYPE]" />
		 <s:if test="%{#ttydPhone.value != null && #ttydPhone.value.size > 0}" > 
			 <json:array name="${ttydPhone.key}" items="${ttydPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
		 
		<s:set name="videoPhone" value="profileResponse.profile.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@VIDEO_PHONE_TYPE]" />
		 <s:if test="%{#videoPhone.value != null && #videoPhone.value.size > 0}" > 
			 <json:array name="${videoPhone.key}" items="${videoPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
		 
		<s:set name="voipPhone" value="profileResponse.profile.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@VOIP_PHONE_TYPE]" />
		  <s:if test="%{#voipPhone.value != null && #voipPhone.value.size > 0}" > 
			 <json:array name="${voipPhone.key}" items="${voipPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
		 
		<s:set name="homefaxPhone" value="profileResponse.profile.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@HOME_FAX_TYPE]" />
		  <s:if test="%{#homefaxPhone.value != null && #homefaxPhone.value.size > 0}" > 
			 <json:array name="${homefaxPhone.key}" items="${homefaxPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>

		<s:set name="primaryfaxPhone" value="profileResponse.profile.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@PRIMARY_FAX_TYPE]" />
		 <s:if test="%{#primaryfaxPhone.value != null && #primaryfaxPhone.value.size > 0}" > 
			 <json:array name="${primaryfaxPhone.key}" items="${primaryfaxPhone.value}" var="phone">
					<json:object> 
					   <json:property name="number" value="${phone.number}" escapeXml="false"/>
					   <json:property name="index" value="${phone.index}"/>
				   </json:object>
			 </json:array> 
		 </s:if>
		 
		<s:set name="otherfaxPhone" value="profileResponse.profile.phonesMap[@com.vzw.is.ics.common.NABCommonConstants@OTHER_FAX_TYPE]" />
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
		 <s:set name="homeAddress" value="profileResponse.profile.addressMap[@com.vzw.is.ics.common.NABCommonConstants@HOME_ADDR_TYPE]" />
		 <s:if test="%{#homeAddress.value != null && #homeAddress.value.size > 0}" > 
			<json:array name="${homeAddress.key}" items="${homeAddress.value}" var="address">
		 		<json:object> 
					   <json:property name="index" value="${address.index}"/>
					   <json:property name="street" value="${address.street}" escapeXml="false"/>
					   <json:property name="city" value="${address.city}" escapeXml="false"/>
					   <json:property name="state" value="${address.state}"/>
					   <json:property name="zipCode" value="${address.zipCode}" escapeXml="false"/>
					   <json:property name="country" value="${address.country}" escapeXml="false"/>
				  <%-- <json:property name="addressType" value="${address.type}"/>
					   <json:property name="preference" value="${address.preference}"/> --%>
			   </json:object>
	 		</json:array> 
		 </s:if>
			 
		 <s:set name="personalAddress" value="profileResponse.profile.addressMap[@com.vzw.is.ics.common.NABCommonConstants@PERSONAL_ADDR_TYPE]" />
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
		 
		 <s:set name="businessAddress" value="profileResponse.profile.addressMap[@com.vzw.is.ics.common.NABCommonConstants@BUSINESS_ADDR_TYPE]" />
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
		 
		 <s:set name="otherAddress" value="profileResponse.profile.addressMap[@com.vzw.is.ics.common.NABCommonConstants@OTHER_ADDR_TYPE]" />
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
		 <s:set name="personalEmail" value="profileResponse.profile.emailMap[@com.vzw.is.ics.common.NABCommonConstants@PERSONAL_EMAIL_ADDR_TYPE]" />
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
		 
		 <s:set name="businessEmail" value="profileResponse.profile.emailMap[@com.vzw.is.ics.common.NABCommonConstants@BUSINESS_EMAIL_ADDR_TYPE]" />
		  <s:if test="%{#businessEmail.value != null && #businessEmail.value.size > 0}" > 
			<json:array name="${businessEmail.key}" items="${businessEmail.value}" var="emailDetail">
		 		<json:object> 
					  <json:property name="index" value="${emailDetail.index}"/>
					  <json:property name="address" value="${emailDetail.address}" escapeXml="false"/>
					  <json:property name="preference" value="${emailDetail.preference}"/>
			   </json:object>
	 		</json:array> 
		 </s:if>
		 
		 <s:set name="otherEmail" value="profileResponse.profile.emailMap[@com.vzw.is.ics.common.NABCommonConstants@OTHER_EMAIL_ADDR_TYPE]" />
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
		 <s:set name="businessWebPage" value="profileResponse.profile.webPageMap[@com.vzw.is.ics.common.NABCommonConstants@BUSINESS_WEB_PAGE_TYPE]" />
		 <s:if test="%{#businessWebPage.value != null && #businessWebPage.value.size > 0}" > 
			<json:array name="${businessWebPage.key}" items="${businessWebPage.value}" var="webpage">
		 		<json:object> 
				   <%-- <json:property name="webPageType" value="${webpage.type}"/> --%>
				   <json:property name="index" value="${webpage.index}"/>
				   <json:property name="url" value="${webpage.url}" escapeXml="false"/>
			   </json:object>
 			</json:array> 
		 </s:if>
		 
		 <s:set name="homeWebPage" value="profileResponse.profile.webPageMap[@com.vzw.is.ics.common.NABCommonConstants@HOME_WEB_PAGE_TYPE]" />
		  <s:if test="%{#homeWebPage.value != null && #homeWebPage.value.size > 0}" > 
			<json:array name="${homeWebPage.key}" items="${homeWebPage.value}" var="webpage">
		 		<json:object> 
				   <json:property name="index" value="${webpage.index}"/>
				   <json:property name="url" value="${webpage.url}" escapeXml="false"/>
			   </json:object>
	 		</json:array> 
		 </s:if>
		 
		 <s:set name="otherWebPage" value="profileResponse.profile.webPageMap[@com.vzw.is.ics.common.NABCommonConstants@OTHER_WEB_PAGE_TYPE]" />
		  <s:if test="%{#otherWebPage.value != null && #otherWebPage.value.size > 0}" > 
			<json:array name="${otherWebPage.key}" items="${otherWebPage.value}" var="webpage">
		 		<json:object> 
				   <json:property name="index" value="${webpage.index}"/>
				   <json:property name="url" value="${webpage.url}" escapeXml="false"/>
			   </json:object>
	 		</json:array> 
		 </s:if>			 			 
	 </json:object>
	 
	 
	 
	 <json:array name="ims" items="${profileResponse.profile.ims}" var="im">
	  <json:object>
	   <json:property name="imType" value="${im.type}"/>
	   <json:property name="address" value="${im.address}" escapeXml="false"/>
	   <json:property name="preference" value="${im.preference}"/>
	  </json:object>
	 </json:array>	
	 	 
 </json:object>
