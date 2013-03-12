<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>Upload a attachment file</title>
<link href="<s:url value="/css/main.css"/>" rel="stylesheet" type="text/css"/>

</head>

<body>

<s:actionerror />
<s:fielderror />
<s:form action="importEvent" method="POST" enctype="multipart/form-data">
<tr>
<td colspan="2"><h1>Import the Event file</h1></td>
</tr>

<s:file name="iCalFileName" label="File"/>
<s:textfield name="caption" label="Caption"/>
<s:submit />
</s:form>
</body>
</html>
