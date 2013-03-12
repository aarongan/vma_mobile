<%@ include file="/nda/common/taglibraries.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
	<head>
	   	<link rel='stylesheet' href='<%= staticContentURL %>scripts/release/styles/css/ics/inbox/Print.css'>
	</head>
	<body onload="window.print();">
	<s:iterator value="response.messageDetails">
	<div class="messageNode" style="page-break-after: always">
		<div class="header">
	        <div class="displayName">
				<s:if test="messageHeader.from[0].personalName">
					<s:property value="messageHeader.from[0].personalName"/>
				</s:if>
				<s:else>
					<s:property value="messageHeader.from[0].emailAddress"/>
				</s:else>
	        </div>
			
			<div>
				<span class="label">From:</span><s:property value="messageHeader.from[0].emailAddress"/>
	        </div>
	        
	        <div>
	        	<span class="label">Sent:</span>
	        	<s:property value="messageHeader.relativeShortDateTxt"/>
	        </div>
	        
	        <div>
	        	<span class="label">To:</span><s:property value="messageHeader.to[0].emailAddress"/>
	        </div>
	        
	        <div>
	        	<span class="label">Subject:</span><s:property value="messageHeader.subject"/>
	        </div>
	  	</div>
	  	
	  	
	  	<div class="bodyContent">
	  		<s:property escape="false" value="messageBody.messageBody.replace('\r\n','<br >')" />
	    </div>
	      	
	  	<s:if test="attachments.size > 0">
	  		<div class="attachments">
	  			<div>
	  				<s:property value="attachments.size"/>&nbsp;attachment<s:if test="attachments.size > 1">s</s:if>
	  			</div>
	  			<s:iterator value="attachments">
	  				<div class="fileName">
	  					<s:property value="attachmentFileName"/>
	  				</div>
	  				<div class="fileSize">
	  					<s:property value="attachmentSize"/>
	  				</div>
	  				<s:if test="%{src.length() != 0}">
	  					<img class="printImg" src="<s:property value="src"/>"></img>
	  				</s:if>
	  			</s:iterator>
	  		</div>
	  	</s:if>

        
        
    </div>
</s:iterator>
</body>

</html>

