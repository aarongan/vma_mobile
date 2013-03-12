<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
  
 <%@ include file="../common/taglibraries.jsp" %>	
  
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script type="text/javascript" src="<%=staticContentURL%>scripts/provisioning/provisioning.js"></script>
</head>

<body class="pl" onload="onPageLoad();setAmTimer();">
<div id="layer_holder" style="width:300px;height:100px">

	<s:form action="/nab/pictures/storeimage.action" method="POST" enctype="multipart/form-data" theme="simple">
			<div id="uploadDiv" style="float:left;width:275px;height:30px;padding-left:15px;padding-top:10px;">				
				<s:file id="image" name="imageVO.image" cssStyle="float:left;"></s:file>
			<s:hidden id="outputFormat" name="outputFormat" value="jsp"/>
			</div>
			<div id="buttonsDiv" style="float:left;width:275px;height:30px;">
				<span style="float: left; padding-left: 110px; padding-top: 8px; padding-right: 5px;">
					<a href="javascript:onCancel();" class="a" style="margin-right:10px"><span><span><span>Cancel</span></span></span></a>
				</span>
				<span style="float: left;">
			<s:submit value="upload" label="upload" cssStyle="COLOR:RED;" onclick="return validateUrl();" ></s:submit>
				</span>
			</div>
	</s:form>
	</div>
	
<script type="text/javascript">

function onPageLoad()
{
	var errorCode= '<s:property value="picResponse.errorCode"/>';
	if(errorCode){
	var errCode = parseInt(errorCode); 
		if(errCode > 0)
				alert('That photo exceeds our 1 MB limit. Please try again with a smaller image.'); 
	}
}
function validateUrl() {
	var imgFile = document.getElementById("image"); 
	var imageFilenameRegex = /(.*?)\.(jpg|jpeg|png|gif|bmp|pjpeg|x-png)$/i;
	
	if(imgFile == null 	|| imgFile.value == '' || imgFile.value == ' ' ) {
		return false;
	}
    else if ((imgFile.value).search(imageFilenameRegex) == -1)
    {
        alert("That kind of file is not supported. Please try a .jpg, .jpeg, .bmp, .gif or .png image.");
        return false;
    }	
	else 
		return true;
}

function onCancel() {
	document.forms[0].action ='<s:url value="/provisioning/cancelUploadPicture.action" includeParams="none"/>';
	document.forms[0].submit();
	
	if(document.getElementById("container")) {
	document.getElementById("container").className="processing";			
}
}
</script>
</body>
</html>
