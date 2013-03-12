<%@ page contentType="application/json; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/struts-tags.tld" prefix="s"%>

<json:object>

	<json:property name="statusCode" value="${response.statusCode}" />
	<json:property name="statusDesc" value="${response.statusDesc}" />

	<json:array name="emails" items="${response.emails}" var="emails">
		<json:object>
			<json:property name="folder" value="${emails.folder}" />
			<json:property name="size" value="${emails.displaySize}" />
			<json:property name="percentage" value="${emails.percentage}" />
			<json:property name="unit" value="${emails.unit}" />
		</json:object>
	</json:array>

	<json:array name="sms" items="${response.sms}" var="sms">
		<json:object>
			<json:property name="folder" value="${sms.folder}" />
			<json:property name="size" value="${sms.displaySize}" />
			<json:property name="percentage" value="${sms.percentage}" />
			<json:property name="unit" value="${sms.unit}" />
		</json:object>
	</json:array>

	<json:array name="mms" items="${response.mms}" var="mms">
		<json:object>

			<json:property name="folder" value="${mms.folder}" />
			<json:property name="size" value="${mms.displaySize}" />
			<json:property name="percentage" value="${mms.percentage}" />
			<json:property name="unit" value="${mms.unit}" />
		</json:object>
	</json:array>

	<json:array name="message" items="${response.messageTypeList}"
		var="msg">
		<json:object>
			<json:property name="folder" value="${msg.folder}" />
			<json:property name="size" value="${msg.displaySize}" />
			<json:property name="percentage" value="${msg.percentage}" />
			<json:property name="unit" value="${msg.unit}" />
		</json:object>
	</json:array>

	<json:array name="remaining" items="${response.remaining}"
		var="remaining">
		<json:object>
			<json:property name="folder" value="${remaining.folder}" />
			<json:property name="size" value="${remaining.displaySize}" />
			<json:property name="percentage" value="${remaining.percentage}" />
			<json:property name="unit" value="${remaining.unit}" />
		</json:object>
	</json:array>
</json:object>
