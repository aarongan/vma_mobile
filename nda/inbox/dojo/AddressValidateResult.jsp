<%@ page contentType="application/json; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>
<json:object>
	<json:property name="statusCode" value="${response.statusCode}" />
	<json:property name="statusDesc" value="${response.statusDesc}" />
	<json:property name="fusionOne" value="${response.fusionOneConnected}" />
	<json:array name="items" items="${response.toGroupList}" var="group">
		<json:object>
			<json:property name="group" value="${group.email}" />
			<json:property name="contactId" value="${group.contactId}" />
			<json:property name="valid" value="${group.valid}" />
			<json:property name="groupLength" value="${group.groupLength}" />
			<json:property name="isGroup" value="${group.validGroup}" />
			<json:array name="validAddresses" items="${group.addresses}" var="addr">
				<json:property name="address" value="${addr}" />
			</json:array>
			<json:array name="notValidContacts" items="${group.noAddresses}" var="name">
				<json:property name="name" value="${name}" />
			</json:array>
			<json:property name="inNetwork" value="${group.inNetwork}" />
		</json:object>
	</json:array>
</json:object>
