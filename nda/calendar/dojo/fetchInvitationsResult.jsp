<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json" %> 
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<json:object>
    <json:property name="statusDesc" value="${eventResponse.statusDesc}"/>
    <json:property name="statusCode" value="${eventResponse.statusCode}"/>
    <json:property name="operation" value="${eventResponse.operation}"/>
    <json:property name="inviteCount" value="${eventResponse.inviteCount}"/>
  <json:array name="items" items="${eventResponse.events}" var="items">
  <json:object>
      <json:property name="messageId" value="${items.eventId}"/>
      <json:property name="calID" value="${items.calId}"/>
      <json:property name="picURL" value="${items.picURL}"/>
      <json:property name="type" value="${items.componentType}"/>
      <json:property name="subject" value="${items.eventSummary}"/>
      <json:property name="message" value="${items.description}"/>
      <json:property name="senderName" value="${items.eventOrganizer.userId}"/>
      <json:property name="dueDate" value="${items.startDate}"/>
      <json:property name="dueTime" value="${items.dayWeekStart}"/>
      <json:property name="organizer" value="${items.eventOrganizer.contactId}"/>
      <json:property name="readwrite" value="true"/>
      <json:property name="inviteOthers" value="${items.inviteOthersFlag}"/>
      <json:property name="seeGuestList" value="${items.seeGuestListFlag}"/>
      <json:property name="calendarColor" value="${eventResponse.calendarColor}"/>
  </json:object>
  </json:array>
</json:object>
