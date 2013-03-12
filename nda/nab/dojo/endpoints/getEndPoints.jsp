<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object>
	  <json:property name="statusCode" value="${getEndPointResponse.statusCode}"/>
	  <json:property name="statusDesc" value="${getEndPointResponse.statusDesc}"/>
	  <json:property name="title" value="${getEndPointResponse.title}"/>
	  
	  <json:array name="items" items="${getEndPointResponse.endPointVOList}" var="endpoint">
		  <json:object>
			 <json:property name="endPointId" value="${endpoint.endPointId}"/>
			 <json:property name="endPointName" value="${endpoint.endPointName}"/>
			 <json:property name="loginUserName" value="${endpoint.loginUserName}"/>
			 <json:property name="statusId" value="${endpoint.statusId}"/>
			 <json:property name="currentCapacity" value="${endpoint.attributeList.currentCapacity}"/>
			 <json:property name="totalCapacity" value="${endpoint.attributeList.totalCapacity}"/>
			 <json:property name="lastSyncDate" value="${endpoint.attributeList.lastSyncDate}"/>
			 <json:property name="baCapable" value="${endpoint.baCapable}" />
			 <json:property name="imageUrl" value="${endpoint.imageUrl}" />
			 <json:property name="prodName" value="${endpoint.prodName}" />
		  </json:object>
	  </json:array>
 </json:object>
