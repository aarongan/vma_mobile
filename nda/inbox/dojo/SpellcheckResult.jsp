<%@ page contentType="application/json; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/json.tld" prefix="json"%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/struts-tags.tld" prefix="s"%>


<json:object name="spellcheckResults">

	<json:property name="statusCode" value="${response.statusCode}" />
	<json:property name="statusDesc" value="${response.statusDesc}" />

	<json:array name="words" items="${response.misspellWords}"
		var="misspell">
		<json:object>
			<json:property name="word" value="${misspell.word}" />
			<json:property name="offset" value="${misspell.index}" />
			<json:property name="len" value="${misspell.length}" />
			<json:property name="suggestions" value="${misspell.commaSeperatedSuggestions}" />						
		</json:object>
	</json:array>

</json:object>
