<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/struts-tags.tld" prefix="s"%>

<json:object name="messageThreadDetails">

	<json:property name="statusCode"
		value="${threadDetailresponse.statusCode}" />
	<json:property name="statusDesc"
		value="${threadDetailresponse.statusDesc}" />
	<json:property name="isThread" value="${threadDetailresponse.thread}" />
	<json:object name="unread">
		<json:property name="All"
			value="${threadDetailresponse.unreadSummaryInfo.totalAllMsgs}" />
		<json:property name="email"
			value="${threadDetailresponse.unreadSummaryInfo.totalEmailMsgs}" />
		<json:property name="sms"
			value="${threadDetailresponse.unreadSummaryInfo.totalSmsMsgs}" />
		<json:property name="mms"
			value="${threadDetailresponse.unreadSummaryInfo.totalMmsMsgs}" />
		<json:property name="vvm"
			value="${threadDetailresponse.unreadSummaryInfo.totalVvmMsgs}" />
		<json:property name="call_log"
			value="${threadDetailresponse.unreadSummaryInfo.totalCallLogMsgs}" />
	</json:object>

	<json:property name="threadId"
		value="${threadDetailresponse.messageId}" />
	<json:property name="folderName" value="${threadDetailresponse.folder}" />
	<json:property name="vcard" value="${threadDetailresponse.vcard}" />
	<json:property name="captionTxt"
		value="${threadDetailresponse.captionTxt}" escapeXml="false" />
	<json:property name="subject" value="${threadDetailresponse.subject}"
		escapeXml="false" />
	<json:property name="isStarred" value="${threadDetailresponse.starred}" />
	<json:array name="tags" items="${threadDetailresponse.aggregateTags}"
		var="aggTag">
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
			<json:property name="replyMode" value="${memberHeader.replyMode}" />
			<json:property name="isSlide" value="${threadDetailresponse.slide}" />

			<json:array name="from" items="${memberHeader.from}"
				var="addressInfo">
				<json:object>
					<json:property name="name" value="${addressInfo.personalName}" />
					<json:property name="emailAddress"
						value="${addressInfo.emailAddress}" />
				</json:object>
			</json:array>

			<json:array name="to" items="${memberHeader.to}" var="addressInfo">
				<json:object>
					<json:property name="name" value="${addressInfo.personalName}" />
					<json:property name="emailAddress"
						value="${addressInfo.emailAddress}" />
				</json:object>
			</json:array>


			<json:property name="subject" value="${memberHeader.subject}"
				escapeXml="false" />
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
			<json:property name="sourceSystem"
				value="${memberHeader.messageSource}" />
			<json:property name="sourceMessageId"
				value="${memberHeader.sourceMessageId}" escapeXml="false" />
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

			<c:if test="${memberHeader.messageDetails!=null}">


				<json:property name="receivedTimestamp"
					value="${memberHeader.receivedDate}" />

				<json:property name="relativeTime"
					value="${memberHeader.relativeDetailedDateTxt}" />

				<json:array name="cc" items="${memberHeader.cc}" var="address">
					<json:object>
						<json:property name="name" value="${address.personalName}" />
						<json:property name="emailAddress" value="${address.emailAddress}" />
					</json:object>
				</json:array>


				<json:array name="bcc" items="${memberHeader.bcc}" var="address">
					<json:object>
						<json:property name="name" value="${address.personalName}" />
						<json:property name="emailAddress" value="${address.emailAddress}" />
					</json:object>
				</json:array>
				<json:property name="replyTo" value="${memberHeader.replyTo}" />
				<json:property name="replyFrom" value="${memberHeader.replyFrom}" />

				<json:property name="composerId"
					value="${memberHeader.messageDetails.composerId}" />


				<json:property name="displayImages"
					value="${memberHeader.messageDetails.displayImages}" />

				<json:property name="isHTML"
					value="${memberHeader.messageDetails.messageBody.html}" />
				<json:property name="body"
					value="${memberHeader.messageDetails.messageBody.messageBody}"
					escapeXml="false" />


				<json:array name="attachmentList"
					items="${memberHeader.messageDetails.attachments}" var="attachment">

					<json:object>
						<json:property name="attachName"
							value="${attachment.attachmentFileName}" escapeXml="false" />
						<json:property name="attachSize"
							value="${attachment.attachmentSize}" />
						<json:property name="attachPath"
							value="${attachment.attachmentPath}" />
						<json:property name="attachType" value="${attachment.contentType}" />
						<json:property name="attachInfo" value="${attachment.attachInfo}" />
						<json:property name="xml" escapeXml="false"
							value="${attachment.xml}" />
					</json:object>

				</json:array>

				<json:array name="slideList"
					items="${threadDetailresponse.slideList}" var="slides">

					<json:object>
						<json:property name="captionTxt" value="${slides.captionTxt}"
							escapeXml="false" />
						<json:property name="imagePath" value="${slides.imagePath}"
							escapeXml="false" />
						<json:property name="imageName" value="${slides.imageName}"
							escapeXml="false" />
						<json:property name="imageSize" value="${slides.imageSize}"
							escapeXml="false" />
						<json:property name="imagePart" value="${slides.imagePart}"
							escapeXml="false" />
						<json:property name="audioPath" value="${slides.audioPath}"
							escapeXml="false" />
						<json:property name="audioName" value="${slides.audioName}"
							escapeXml="false" />
						<json:property name="audioSize" value="${slides.audioSize}"
							escapeXml="false" />
						<json:property name="audioPart" value="${slides.audioPart}"
							escapeXml="false" />
						<json:property name="slideNum" value="${slides.slideNum}"
							escapeXml="false" />
						<json:property name="timer" value="${slides.timer}" />
						<json:property name="composerId" value="${slides.composerId}" />

					</json:object>
				</json:array>

				<json:property name="isSendLater"
					value="${memberHeader.messageDetails.sendLaterDetails.sendLater}" />
				<json:property name="startTime"
					value="${memberHeader.messageDetails.sendLaterDetails.startTime}" />
				<json:property name="endTime"
					value="${memberHeader.messageDetails.sendLaterDetails.endTime}" />
				<json:property name="recurrenceType"
					value="${memberHeader.messageDetails.sendLaterDetails.recurrenceType}" />
			</c:if>

			<json:array name="tags" items="${memberHeader.tags}" var="tag">
				<json:object>
					<json:property name="id" value="${tag.tagId}" />
					<json:property name="name" value="${tag.tagName}" escapeXml="false" />
				</json:object>
			</json:array>

		</json:object>

	</json:array>

</json:object>
