<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/struts-tags.tld" prefix="s"%>


<json:object name="messageThreadDetails">

	<json:property name="statusCode" value="${threadDetailresponse.statusCode}" />
	<json:property name="statusDesc" value="${threadDetailresponse.statusDesc}" />
	
	<json:object name="unread">
	<json:property name="All" value="${threadDetailresponse.unreadSummaryInfo.totalAllMsgs}" />
	<json:property name="email" value="${threadDetailresponse.unreadSummaryInfo.totalEmailMsgs}" />
	<json:property name="sms" value="${threadDetailresponse.unreadSummaryInfo.totalSmsMsgs}" />
	<json:property name="mms" value="${threadDetailresponse.unreadSummaryInfo.totalMmsMsgs}" />
	<json:property name="vvm" value="${threadDetailresponse.unreadSummaryInfo.totalVvmMsgs}" />
	<json:property name="call_log"
		value="${threadDetailresponse.unreadSummaryInfo.totalCallLogMsgs}" />
	</json:object>
	
	<json:property name="threadId"
		value="${threadDetailresponse.messageId}" />
	<json:property name="folderName" value="${threadDetailresponse.folder}" />
	<json:property name="vcard" value="${threadDetailresponse.vcard}" />

	<json:property name="subject" value="${threadDetailresponse.subject}" escapeXml="false" />
	<json:property name="captionTxt" value="${threadDetailresponse.captionTxt}" escapeXml="false" />
	<json:property name="isStarred" value="${threadDetailresponse.starred}" />
	<json:array name="tags" items="${threadDetailresponse.aggregateTags}" var="aggTag">
		<json:object>
			<json:property name="id" value="${aggTag.tagId}" />
			<json:property name="name" value="${aggTag.tagName}" />
		</json:object>
	</json:array>


	<json:array name="memberHeaders"
		items="${threadDetailresponse.memberHeaders}" var="memberHeader">
		<json:object>
			<json:property name="messageId" value="${memberHeader.uid}" />
			<json:property name="folderName" value="${memberHeader.folder}" />
			<json:property name="type" value="${memberHeader.type}" />

			<json:array name="from" items="${memberHeader.from}"
				var="addressInfo">
				<json:object>
					<json:property name="name" value="${addressInfo.personalName}" />
					<json:property name="emailAddress"
						value="${addressInfo.emailAddress}" />
				</json:object>
			</json:array>
			
			<json:array name="to" items="${memberHeader.to}"
				var="addressInfo">
				<json:object>
					<json:property name="name" value="${addressInfo.personalName}" />
					<json:property name="emailAddress"
						value="${addressInfo.emailAddress}" />
				</json:object>
			</json:array>


			<json:property name="subject" value="${memberHeader.subject}" escapeXml="false" />
			<json:property name="receivedDateShortTxt"
				value="${memberHeader.relativeShortDateTxt}" />
			<json:property name="receivedDateDetailedTxt"
				value="${memberHeader.relativeDetailedDateTxt}" />

			<json:property name="receivedDate"
				value="${memberHeader.receivedDate}" />
			<json:property name="contactId" value="${memberHeader.contactId}" />
			<c:if test="${memberHeader.photo}">
				<json:property name="senderIcon" value="${memberHeader.pictureUrl}" />
			</c:if>
			<json:property name="attachment" value="${memberHeader.xattach}" />
			<json:property name="size" value="${memberHeader.size}" />
			<json:property name="priority" value="${memberHeader.priority}" />
			<json:property name="answered" value="${memberHeader.answered}" />
			<json:property name="draft" value="${memberHeader.draft}" />
			<json:property name="read" value="${memberHeader.seen}" />
			<json:property name="sourceSystem" value="${memberHeader.messageSource}" />
			<json:property name="sourceMessageId" value="${memberHeader.sourceMessageId}" escapeXml="false"/>
			<json:property name="sourceMessageUID"
					value="${memberHeader.sourceMessageUID}" />
			<json:property name="sourceMessageFolder"
					value="${memberHeader.sourceMessageFolder}" />					
			<json:property name="isStarred" value="${memberHeader.starred}" />

			<!-- TODO: isNetwork is yet to be supported -->
			<json:property name="inNetwork" value="${memberHeader.inNetwork}" />
			<json:property name="isBuddy" value="${memberHeader.connected}" />
			<json:property name="ics" value="${memberHeader.ics}" />
	        <json:property name="sensitivity" value="${memberHeader.sensitive}" />
				<json:property name="orderNum" value="${memberHeader.orderNum}" />

			<json:array name="tags" items="${memberHeader.tags}" var="tag">
				<json:object>
					<json:property name="id" value="${tag.tagId}" />
					<json:property name="name" value="${tag.tagName}" escapeXml="false"  />
				</json:object>
			</json:array>

		</json:object>

	</json:array>

	<json:object name="recentMessageDetails">
		<json:property name="messageId"
			value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.uid}" />
		<json:property name="composerId" value="${threadDetailresponse.recentMessageDetailResponse.composerId}" />
		<json:property name="folderName"
			value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.folder}" />

		<json:property name="receivedDate"
			value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.relativeShortDateTxt}" />
		<json:property name="sensitivity" value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.sensitive}" />
		<json:property name="contactId" value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.contactId}" />
			<c:if test="${threadDetailresponse.recentMessageDetailResponse.messageHeader.photo}">
				<json:property name="senderIcon" value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.pictureUrl}" />
			</c:if>
			
		<json:property name="relativeTime"
			value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.relativeDetailedDateTxt}" />
		<json:property name="receivedTimestamp"
			value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.receivedDate}" />

		<json:property name="type"
			value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.type}" />
		<json:array name="from"
			items="${threadDetailresponse.recentMessageDetailResponse.messageHeader.from}"
			var="addressInfo">
			<json:object>
				<json:property name="name" value="${addressInfo.personalName}" />
				<json:property name="emailAddress"
					value="${addressInfo.emailAddress}" />
			</json:object>
		</json:array>

		<json:array name="to"
			items="${threadDetailresponse.recentMessageDetailResponse.messageHeader.to}"
			var="addressInfo">
			<json:object>
				<json:property name="name" value="${addressInfo.personalName}" />
				<json:property name="emailAddress"
					value="${addressInfo.emailAddress}" />
			</json:object>
		</json:array>

		<json:array name="cc"
			items="${threadDetailresponse.recentMessageDetailResponse.messageHeader.cc}"
			var="address">
			<json:object>
				<json:property name="name" value="${address.personalName}" />
				<json:property name="emailAddress" value="${address.emailAddress}" />
			</json:object>
		</json:array>


		<json:array name="bcc"
			items="${threadDetailresponse.recentMessageDetailResponse.messageHeader.bcc}"
			var="address">
			<json:object>
				<json:property name="name" value="${address.personalName}" />
				<json:property name="emailAddress" value="${address.emailAddress}" />
			</json:object>
		</json:array>

		<json:property name="replyTo"
			value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.replyTo}" />
		<json:property name="replyFrom"
			value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.replyFrom}" />
		<json:property name="subject"
			value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.subject}" escapeXml="false" />
		<json:property name="attachment"
			value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.xattach}" />
		<json:property name="size"
			value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.size}" />
		<json:property name="displayImages"
			value="${threadDetailresponse.recentMessageDetailResponse.displayImages}" />
		<json:property name="priority"
			value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.priority}" />
		<json:property name="answered"
			value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.answered}" />
		<json:property name="read"
			value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.seen}" />
		<json:property name="sourceSystem"
			value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.messageSource}" />
		<json:property name="sourceMessageUID"
					value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.sourceMessageUID}" />
		<json:property name="isStarred"
			value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.starred}" />
		<json:property name="inNetwork"
			value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.inNetwork}" />
		<json:property name="orderNum" value="${threadDetailresponse.recentMessageDetailResponse.messageHeader.orderNum}" />
		
		<json:property name="isHTML" value="${threadDetailresponse.recentMessageDetailResponse.messageBody.html}"/>
		<json:property name="body"
			value="${threadDetailresponse.recentMessageDetailResponse.messageBody.messageBody}"
			escapeXml="false" />

		<json:property name="newContent"
			value="${threadDetailresponse.recentMessageDetailResponse.messageBody.newContent}"
			escapeXml="false" />

		<json:property name="oldContent"
			value="${threadDetailresponse.recentMessageDetailResponse.messageBody.oldContent}"
			escapeXml="false" />


		<json:array name="tags"
			items="${threadDetailresponse.recentMessageDetailResponse.messageHeader.tags}"
			var="tag">
			<json:object>
				<json:property name="id" value="${tag.tagId}" />
				<json:property name="name" value="${tag.tagName}" escapeXml="false" />
			</json:object>
		</json:array>

		<json:array name="attachmentList"
			items="${threadDetailresponse.recentMessageDetailResponse.attachments}"
			var="attachment">

			<json:object>
				<json:property name="attachName"
					value="${attachment.attachmentFileName}" escapeXml="false"  />
				<json:property name="attachSize"
					value="${attachment.attachmentSize}" />
				<json:property name="attachPath"
					value="${attachment.attachmentPath}" />
				<json:property name="attachType" value="${attachment.contentType}" />
				<json:property name="attachInfo" value="${attachment.attachInfo}" />
				<json:property name="xml" escapeXml="false" value="${attachment.xml}" />
			</json:object>

		</json:array>

		<json:property name="isSendLater"
		value="${threadDetailresponse.recentMessageDetailResponse.sendLaterDetails.sendLater}" />
	<json:property name="startTime"
		value="${threadDetailresponse.recentMessageDetailResponse.sendLaterDetails.startTime}" />
	<json:property name="endTime"
		value="${threadDetailresponse.recentMessageDetailResponse.sendLaterDetails.endTime}" />
	<json:property name="recurrenceType"
		value="${threadDetailresponse.recentMessageDetailResponse.sendLaterDetails.recurrenceType}" />

	</json:object>


</json:object>
