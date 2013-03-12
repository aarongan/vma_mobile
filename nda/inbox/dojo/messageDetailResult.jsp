<%@ page contentType="application/json; charset=UTF-8" %> 
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/struts-tags.tld" prefix="s"%>


<json:object name="messageDetail">

    <json:property name="statusCode" value="${response.statusCode}" />
	<json:property name="statusDesc" value="${response.statusDesc}" />
    <json:property name="isSlide" value="${response.slide}" />
	<json:object name="unread">
	<json:property name="All" value="${response.unreadSummaryInfo.totalAllMsgs}" />
	<json:property name="email" value="${response.unreadSummaryInfo.totalEmailMsgs}" />
	<json:property name="sms" value="${response.unreadSummaryInfo.totalSmsMsgs}" />
	<json:property name="mms" value="${response.unreadSummaryInfo.totalMmsMsgs}" />
	<json:property name="vvm" value="${response.unreadSummaryInfo.totalVvmMsgs}" />
	<json:property name="call_log"
		value="${response.unreadSummaryInfo.totalCallLogMsgs}" />
	</json:object>
	
	<json:property name="mailQuotaUsage" value="${response.mailQuotaUsage}" />
	<json:property name="messageId" value="${response.messageHeader.uid}" />
	<json:property name="composerId" value="${response.composerId}" />
	<json:property name="replyMode" value="${response.messageHeader.replyMode}" />
	
	<json:property name="folderName"
		value="${response.messageHeader.folder}" />
	<json:property name="vcard" value="${response.vcard}" />
	<json:property name="captionTxt"
			value="${response.captionTxt}" />
	<json:property name="displayImages"
			value="${response.displayImages}" />			
	<json:property name="receivedDate"
		value="${response.messageHeader.relativeShortDateTxt}" />
	<json:property name="relativeTime"
		value="${response.messageHeader.relativeDetailedDateTxt}" />
	<json:property name="receivedTimestamp"
		value="${response.messageHeader.receivedDate}" />

	<json:property name="type" value="${response.messageHeader.type}" />
	<json:array name="from" items="${response.messageHeader.from}"
		var="addressInfo">
		<json:object>
			<json:property name="name" value="${addressInfo.personalName}" />
			<json:property name="emailAddress"
				value="${addressInfo.emailAddress}" />
		</json:object>
	</json:array>

	<json:array name="to" items="${response.messageHeader.to}"
		var="addressInfo">
		<json:object>
			<json:property name="name" value="${addressInfo.personalName}" />
			<json:property name="emailAddress"
				value="${addressInfo.emailAddress}" />
		</json:object>
	</json:array>

	<json:array name="cc" items="${response.messageHeader.cc}"
		var="address">
		<json:object>
			<json:property name="name" value="${address.personalName}" />
			<json:property name="emailAddress" value="${address.emailAddress}" />
		</json:object>
	</json:array>


	<json:array name="bcc" items="${response.messageHeader.bcc}"
		var="address">
		<json:object>
			<json:property name="name" value="${address.personalName}" />
			<json:property name="emailAddress" value="${address.emailAddress}" />
		</json:object>
	</json:array>

	<json:property name="replyTo" value="${response.messageHeader.replyTo}" />
	<json:property name="replyFrom" value="${response.messageHeader.replyFrom}" />
	<json:property name="subject" value="${response.messageHeader.subject}" escapeXml="false" />
	<json:property name="attachment"
		value="${response.messageHeader.xattach}" />
	<json:property name="contactId" value="${response.messageHeader.contactId}" />
	<c:if test="${response.messageHeader.photo}">
		<json:property name="senderIcon" value="${response.messageHeader.pictureUrl}" />
	</c:if>
	<json:property name="size" value="${response.messageHeader.size}" />
	<json:property name="priority"
		value="${response.messageHeader.priority}" />
	<json:property name="answered"
		value="${response.messageHeader.answered}" />
	<json:property name="draft" value="${response.messageHeader.draft}" />
	<json:property name="read" value="${response.messageHeader.seen}" />
	<json:property name="sourceSystem"
		value="${response.messageHeader.messageSource}" />
	<json:property name="sourceMessageId" value="${response.messageHeader.sourceMessageId}" escapeXml="false"/>
	<json:property name="sourceMessageUID"
					value="${response.messageHeader.sourceMessageUID}" />
	<json:property name="sourceMessageFolder"
					value="${response.messageHeader.sourceMessageFolder}" />					
	<json:property name="isStarred"
		value="${response.messageHeader.starred}" />
	<json:property name="inNetwork"
		value="${response.messageHeader.inNetwork}" />
	<json:property name="isBuddy" value="${response.messageHeader.connected}" />
	<json:property name="ics" value="${response.messageHeader.ics}" />
	<json:property name="sensitivity" value="${response.messageHeader.sensitive}" />
	<json:property name="isHTML" value="${response.messageBody.html}"/>
	<json:property name="body" value="${response.messageBody.messageBody}"
		escapeXml="false" />
	<json:property name="orderNum" value="${response.messageHeader.orderNum}" />
	
	<json:property name="newContent"
		value="${response.messageBody.newContent}" escapeXml="false" />

	<json:property name="oldContent"
		value="${response.messageBody.oldContent}" escapeXml="false" />


	<json:array name="tags" items="${response.messageHeader.tags}"
		var="tag">
		<json:object>
			<json:property name="id" value="${tag.tagId}" />
			<json:property name="name" value="${tag.tagName}" escapeXml="false" />
		</json:object>
	</json:array>

	<json:array name="attachmentList" items="${response.attachments}"
		var="attachment">

		<json:object>
			<json:property name="attachName"
				value="${attachment.attachmentFileName}" escapeXml="false" />
			<json:property name="attachSize" value="${attachment.attachmentSize}" />
			<json:property name="attachPath" value="${attachment.attachmentPath}" />
			<json:property name="attachType" value="${attachment.contentType}" />
			<json:property name="attachInfo" value="${attachment.attachInfo}" />
			<json:property name="xml" escapeXml="false" value="${attachment.xml}" />
		</json:object>
	</json:array>
	
		<json:array name="slideList" items="${response.slideList}"
		var="slides">

		<json:object>
			<json:property name="captionTxt" value="${slides.captionTxt}" escapeXml="false" />
			<json:property name="imagePath" value="${slides.imagePath}" escapeXml="false"/>
			<json:property name="imageName" value="${slides.imageName}" escapeXml="false"/>
			<json:property name="imageSize" value="${slides.imageSize}" escapeXml="false"/>
			<json:property name="imagePart" value="${slides.imagePart}" escapeXml="false"/>
			<json:property name="audioPath" value="${slides.audioPath}" escapeXml="false"/>
			<json:property name="audioName" value="${slides.audioName}" escapeXml="false"/>
			<json:property name="audioSize" value="${slides.audioSize}" escapeXml="false"/>
			<json:property name="audioPart" value="${slides.audioPart}" escapeXml="false"/>
			<json:property name="slideNum" value="${slides.slideNum}" escapeXml="false"/>
			<json:property name="timer" value="${slides.timer}" />
			<json:property name="composerId" value="${slides.composerId}"/>
			
			
		</json:object>
	</json:array>
	
	<json:property name="isSendLater"
		value="${response.sendLaterDetails.sendLater}" />
	<json:property name="startTime"
		value="${response.sendLaterDetails.startTime}" />
	<json:property name="endTime"
		value="${response.sendLaterDetails.endTime}" />
	<json:property name="recurrenceType"
		value="${response.sendLaterDetails.recurrenceType}" />


</json:object>
