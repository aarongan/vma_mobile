<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="../common/taglibraries.jsp" %>	
<html>
	<head>
<link rel="stylesheet" type="text/css" href="<%=staticContentURL%>styles/css/ics/provisioning/provisioning.css" />
<script src="<%=staticContentURL%>scripts/provisioning/jquery.min.js"></script>
<script src="<%=staticContentURL%>scripts/provisioning/jquery.Jcrop.js"></script>
<script type="text/javascript" src="<%=staticContentURL%>scripts/provisioning/provisioning.js"></script>
<link rel="stylesheet" href="<%=staticContentURL%>styles/css/ics/provisioning/jquery.Jcrop.css" type="text/css" />

<script language="Javascript">
					var width = '<s:property value="imageVO.width"/>';
					var height = '<s:property value="imageVO.height"/>';
					var imageWidth = parseInt('<s:property value="imageVO.width"/>');
					var imageHeight = parseInt('<s:property value="imageVO.height"/>');
					
			var cropReqUrl;
			// Remember to invoke within jQuery(window).load(...)
			// If you don't, Jcrop may not initialize properly
			jQuery(window).load(function(){

				jQuery('#cropbox').Jcrop({
					setSelect: [ 100, 100, 200, 200 ],
					onChange: showPreview,
					onSelect: showPreview,
					aspectRatio: 1
				});

			});

			// Our simple event handler, called from onChange and onSelect
			// event handlers, as per the Jcrop invocation above
			function showPreview(coords)
			{
			//formUrl(coords);
				if (parseInt(coords.w) > 0)
				{
					var rx = 100 / coords.w;
					var ry = 100 / coords.h;

					//alert(coords.w);alert(coords.h);
					jQuery('#preview').css({
						width: Math.round(rx * 200) + 'px',
						height: Math.round(ry * 200) + 'px',
						marginLeft: '-' + Math.round(rx * coords.x) + 'px',
						marginTop: '-' + Math.round(ry * coords.y) + 'px'
					});
					
					var contentType	= escape('<s:property value="imageVO.contentType"/>');
					var crop	= true;	
					var fileName = escape('<s:property value="imageVO.fileName"/>');		
						cropReqUrl = 	'imageVO.fileName='+fileName+'&imageVO.crop=true&imageVO.contentType='+contentType+
								'&imageVO.height='+Math.floor(coords.h*(imageHeight/200))+'&imageVO.width='+Math.floor(coords.w*(imageWidth/200))+
								'&imageVO.xcoordinate='+Math.floor(coords.x*(imageWidth/200))+
								'&imageVO.ycoordinate='+Math.floor(coords.y*(imageHeight/200))+'&outputFormat=jsp&'+'';	
					 	 					
				}
			}
			
			
			// event handlers, as per the Jcrop invocation above
			function formUrl(c)
			{
			var contentType	= escape('<s:property value="imageVO.contentType"/>');
			var crop	= true;	
			var fileName = escape('<s:property value="imageVO.fileName"/>');
		
				cropReqUrl = 	'imageVO.fileName='+fileName+'&imageVO.crop=true&imageVO.contentType='+contentType+
								'&imageVO.height='+Math.round(c.y2-c.y)+'&imageVO.width='+Math.round(c.x2-c.x)+
								'&imageVO.xcoordinate='+c.x+'&imageVO.ycoordinate='+c.y+'&outputFormat=jsp&'+'';	
			};
		

		function cropImage() {
		
		document.forms[0].action = '<s:url encode="false" value="/nab/pictures/cropimage.action?'+cropReqUrl+'"/>';
		document.forms[0].submit();
		}
		
		function onOk() {
			document.forms[0].action ='<s:url namespace="/provisioning" action="cancelUploadPicture"/>';
			document.forms[0].submit();
					
		}
		
		function submitBack() {
			document.forms[0].action= '<s:url namespace="/provisioning" action="showAddPicture"/>?profileRequest.backToUploadPicture=true' ;
			document.forms[0].submit(); 
			document.getElementById("container").className="processing";		
		}
		
		function showAddPicture() {
			document.forms[0].action= '<s:url namespace="/provisioning" action="uploadPicture"/>' ;
			document.forms[0].submit(); 
			//document.getElementById("container").className="processing";		
		}
		function uploadPicture() {
			document.forms[0].action= '<s:url namespace="/provisioning" action="uploadPicture"/>' ;
			document.forms[0].submit(); 
			//document.getElementById("container").className="processing";		
		}
		function changeTitle() {
			if(parent.Lib) {
				parent.Lib.LayerManager.layerIFrame.chrome.fillTitle('Edit Picture');
			}
}
		</script>

	</head>

	<body class="pl" onload="changeTitle();setAmTimer();">
<s:form theme="simple">
	<div id="layer_holder" style="width:700px;height:470px;*height:480px">

			<s:url id="imageSrcUrl" namespace="/nab/pictures" action="getstoredimage">
				<s:param name="imageVO.fileName" value="imageVO.fileName"/>
				<s:param name="imageVO.contentType" value="imageVO.contentType"/>			
				<s:param name="version" value="version"/>
			</s:url>
		<div style="margin-left: 20px; margin-top: 10px;">	
			<div style="text-align:left;padding-top:10px;padding-bottom:10px">Please upload a picture or select a predefined Avatar:</div>
			<div style="text-align:left;padding-top:8px;padding-bottom:10px"><strong>Upload a Picture</strong></div>
		<div align="left">
			<s:if test="{icsSessionVO.imageVO == null || icsSessionVO.imageVO.fileName == ' '} ">
					<img id="cropbox" src="<%=staticContentURL%>/styles/images/ics/provision/emptyProfilePic.jpg" escape="true"   
			width="200" height="200" />
				<input type="hidden" id="image" name="imageVO.image" value="<%=staticContentURL%>styles/images/ics/provision/emptyProfilePic.jpg"/>
			</s:if>
			<s:else>
				<s:url id="storedImageUrl" namespace="/nab/pictures" action="getstoredimage">
					<s:param name="imageVO.fileName" value="icsSessionVO.imageVO.fileName"/>
					<s:param name="imageVO.contentType" value="icsSessionVO.imageVO.contentType"/>
					<s:param name="imageVO.crop" value="icsSessionVO.imageVO.crop"/>
					<s:param name="imageVO.height" value="icsSessionVO.imageVO.height"/>
					<s:param name="imageVO.width" value="icsSessionVO.imageVO.width" />
					<s:param name="imageVO.xcoordinate" value="icsSessionVO.imageVO.xcoordinate"/>
					<s:param name="imageVO.ycoordinate" value="icsSessionVO.imageVO.ycoordinate" />
					<s:param name="outputFormat" value="jsp" />								
					<s:param name="version" value="version"/>
				</s:url>
				<img id="cropbox" src="<s:property value="%{storedImageUrl}" escape="true"/>"   
			width="200" height="200" />
			<s:hidden id="image" name="imageVO.image" value="%{storedImageUrl}"/>
			</s:else>
			</div>
			<div style="margin-right:10px;text-align:left;padding-top:5px;">
						<a href='javascript:uploadPicture()' class="layerLauncher::" title="Add Photo"><strong>Upload Picture</strong></a>
			</div>
			
	<div style="border-bottom:2px dotted #CCCCCC;width:650px;padding-top:15px"></div>
	<div style="padding-top:15px;text-align:left;padding-bottom:10px"><strong>Preview Image</strong></div>
	<div style="width:690px;height:100px;overflow:hidden;" align="left">
		<div class="icsinline" align="left" style="width:100px;height:100px;overflow:hidden;">
		<s:if test="{icsSessionVO.imageVO == null || icsSessionVO.imageVO.fileName == ' '} ">
			<img id="preview" src="<%=staticContentURL%>/styles/images/ics/provision/emptyProfilePic.jpg" 
				width="<s:property value="imageVO.width"/>" height="<s:property value="imageVO.height"/>" />
			</s:if>
			<s:else>
				<s:url id="storedImageUrl" namespace="/nab/pictures" action="getstoredimage">
					<s:param name="imageVO.fileName" value="icsSessionVO.imageVO.fileName"/>
					<s:param name="imageVO.contentType" value="icsSessionVO.imageVO.contentType"/>
					<s:param name="imageVO.crop" value="icsSessionVO.imageVO.crop"/>
					<s:param name="imageVO.height" value="icsSessionVO.imageVO.height"/>
					<s:param name="imageVO.width" value="icsSessionVO.imageVO.width" />
					<s:param name="imageVO.xcoordinate" value="icsSessionVO.imageVO.xcoordinate"/>
					<s:param name="imageVO.ycoordinate" value="icsSessionVO.imageVO.ycoordinate" />
					<s:param name="outputFormat" value="jsp" />								
					<s:param name="version" value="version"/>
				</s:url>
				<img id="preview" src="<s:property value="%{storedImageUrl}" escape="true"/>" 
				width="100" height="100" />
			</s:else>		
		</div>
		
		<div class="icsinline" style="vertical-align:bottom;width:580px;height:100px;padding-left:5px;">
		<div style="height:75px;text-align: left; vertical-align: top; padding-left: 5px;width:550px;">
			<s:if test="{icsSessionVO.profileRequest != null && icsSessionVO.profileRequest.profile != null}">
				<span style="float: left; padding-left:5px;">				
					<strong><s:property value="icsSessionVO.profileRequest.profile.firstName"/></strong>
				</span>
				<span style="float: left; padding-left:5px;">  
					<strong><s:property value="icsSessionVO.profileRequest.profile.lastName"/></strong>
				</span>
			</s:if>
		</div>
		
				<div style="height:25px;float:left;padding-left:3px;vertical-align:bottom;">
				<button type="submit" style="border:none;*width:55px;" class="button" label="Crop" onclick="onOk()"><span class="red"><span><span>&nbsp;&nbsp;OK&nbsp;&nbsp; </span></span></span></button>
				</div>
		</div>		
		</div>	
	</div>
	</div>

		
	</s:form>
	</body>

</html>
