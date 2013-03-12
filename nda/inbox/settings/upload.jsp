<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>Upload a attachment file</title>
<link href="<s:url value="/css/main.css"/>" rel="stylesheet" type="text/css"/>

</head>

<body>

<s:actionerror />
<s:fielderror />
<s:form action="uploadAttachment"  method="POST" enctype="multipart/form-data">
<tr>
<td colspan="2"><h1>Upload a attachment file</h1></td>
</tr>

<s:file name="upload" label="File"/>
<s:submit />
</s:form>
</body>
</html>
