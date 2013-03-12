<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object> 
	  <json:property name="statusCode" value="${shareMemberResponse.statusCode}"/>
	  <json:property name="statusDesc" value="${shareMemberResponse.statusDesc}"/>	 	  
	  	  <json:array name="modifiedMembers" items="${shareMemberResponse.modifiedMemberList}" var="modifiedMember">
			<json:object>
				 <json:property name="contactId" value="${modifiedMember.contactId}"/>
				 <json:property name="userId" value="${modifiedMember.userId}"/>
				 <json:property name="memberShipStatus" value="${modifiedMember.memberShipStatus}"/>
				 <json:property name="accessRights" value="${modifiedMember.accessRights}"/>
				 <json:property name="statusCode" value="${modifiedMember.statusCode}"/>
				 <json:property name="statusDesc" value="${modifiedMember.statusDesc}"/>
		    </json:object>
		  </json:array>		    
	  	  <json:array name="deletedMembers" items="${shareMemberResponse.deletedMemberList}" var="deletedMember">
			<json:object>
				 <json:property name="contactId" value="${deletedMember.contactId}"/>
				 <json:property name="userId" value="${deletedMember.userId}"/>
				 <json:property name="statusCode" value="${deletedMember.statusCode}"/>
				 <json:property name="statusDesc" value="${deletedMember.statusDesc}"/>
		    </json:object>		    
	     </json:array>	 
	     <json:array name="addedMembers" items="${shareMemberResponse.addMemberList}" var="addedMember">
			<json:object>
				 <json:property name="contactId" value="${addedMember.contactId}"/>
				 <json:property name="userId" value="${addedMember.userId}"/>
				 <json:property name="statusCode" value="${addedMember.statusCode}"/>
				 <json:property name="statusDesc" value="${addedMember.statusDesc}"/>
		    </json:object>		    
	     </json:array>	  
 </json:object>

