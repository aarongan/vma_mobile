<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object> 
	  <json:property name="statusCode" value="${shareMemberResponse.statusCode}"/>
	  <json:property name="statusDesc" value="${shareMemberResponse.statusDesc}"/>	
	  	 <json:array name="members" items="${shareMemberResponse.members}" var="member">
			<json:object>
				 <json:property name="contactId" value="${member.contactId}"/>
				 <json:property name="userId" value="${member.userId}"/>
				 <json:property name="statusCode" value="${member.statusCode}"/>
				 <json:property name="statusDesc" value="${member.statusDesc}"/>
		    </json:object>
	     </json:array> 	  
 </json:object>

