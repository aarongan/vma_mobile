<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>

<json:object>
	<json:property name="statusCode" value="${response.statusCode}" />
	<json:property name="statusDesc" value="${response.statusDesc}" />
	<json:property name="numRows" value="${response.numRows}" />
	<json:property name="numDummyRows" value="${response.numOfDummyRows}" />
	<json:property name="contentToken" value="${response.authInfo.token}" />
	
	<json:array name="items" items="${response.items}" var="item">
		<json:object>
			<json:property name="fileId" value="${item.fileId}" />
			<json:property name="filename" value="${item.filename}"  />
			<json:property name="type" value="${item.type}"  />
			<json:property name="fileSize" value="${item.fileSize}" />
			<json:property name="fileExt" value="${item.fileExt}" />
			<json:property name="uploadDateShortTxt" value="${item.uploadDateShortTxt}" />
			<json:property name="uploadDate" value="${item.createdDate}" />
			<json:property name="filePreviewIcon" value="${item.filePreviewIcon}" />
			<json:property name="fileUrl" value="${item.fileUrl}" />
		</json:object>
	</json:array>
</json:object>
