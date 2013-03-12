<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<textarea>
	<json:object>
		 <json:property name="statusCode" value="${importResponse.statusCode}"/>
		 <json:property name="errorCode" value="${importResponse.errorCode}"/>
		 <json:property name="statusDesc" value="${importResponse.statusDesc}"/>
		 <json:property name="messageCode" value="${importResponse.messageCode}"/>
		 <json:property name="title" value="${importResponse.title}"/>
		 <json:property name="count" value="${importResponse.contactsCount}"/>
		 
		 <%-- 
		 <json:array name="map" items="${importResponse.fieldMapVOList}" var="fieldMapVO">
	   		<json:object>
	   			<json:property name="value" value="${fieldMapVO.key}"/>
	   			<json:property name="label" value="${fieldMapVO.value}"/>
	   		</json:object>
		 </json:array>
		 <json:array name="contacts" items="${importResponse.contactList}" var="contact">
		   	<json:array name="contactDetails" items="${contact}" var="contactDetails">
		   			${contactDetails}		   				   			
		   </json:array>	
		 </json:array> --%>	   
	</json:object>
</textarea>