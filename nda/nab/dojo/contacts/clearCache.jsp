<%@page contentType="text/xml;charset=ISO-8859-1" %>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld"%>
<result><code>${response.statusCode}</code><message>${response.statusDesc}</message><mdn>${request.user.userId}</mdn><sessionId>${request.user.sessionId}</sessionId></result>