<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

 <json:object>
	 <json:property name="statusCode" value="${response.statusCode}"/>
	 <json:property name="statusDesc" value="${response.statusDesc}"/>
	 <json:property name="errorCode" value="${response.errorCode}"/>
	 <json:property name="baCapable" value="${sessionVO.baFlags.baCapable}"/>
	 <json:property name="showBAWelcome" value="${showBAWelcome}"/>
	 <json:property name="ie6Upgrade" value="${sessionVO.baFlags.upgradeAlert}"/>
	 <json:object name="userInfo">
	 		<json:property name="username" value="${sessionVO.userInfo.userName}"/>
	 		<json:property name="formatedMtn" value="${sessionVO.formatedMTN}"/>
 		<json:property name="mtn" value="${sessionVO.userInfo.mobileNumber}"/>
 		<json:property name="accountId" value="${sessionVO.userInfo.accountId}"/>
 		<json:property name="isCSR" value="${sessionVO.userInfo.CSR}"/>
	 </json:object>
 </json:object>
 