<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld" %>

<%@page import="com.vzw.is.ics.common.ICSConstants"%>
<%@page import="com.vzw.is.ics.utils.props.ICSProps"%>
<%@page import="com.vzw.is.ics.common.NABConstants"%>

<%! 
	String staticContentURL = ICSProps.getProperty(ICSConstants.EXT_PROPS_STATIC_CONTENT_URL);
	String icsFETimeout = ICSProps.getProperty(ICSConstants.FE_TIMEOUT) ;	 	
	String SEQ_POLL_INTERVAL = (ICSProps.getProperty(NABConstants.SEQ_POLLING_INTERVAL_TIME,NABConstants.SEQ_POLLING_INTERVAL_TIME_DEFAULT_VALUE));
	String NAB_ADD_THRESHOLD = ICSProps.getProperty(NABConstants.NAB_ADD_CONTACTS_BREAKOUT,NABConstants.NAB_ADD_CONTACTS_BREAKOUT_DEFAULT_VALUE);
	String NAB_DEL_THRESHOLD = ICSProps.getProperty(NABConstants.NAB_DELETE_CONTACTS_BREAKOUT,NABConstants.NAB_DELETE_CONTACTS_BREAKOUT_DEFAULT_VALUE);
	String NAB_UNDEL_THRESHOLD = ICSProps.getProperty(NABConstants.NAB_UNDELETE_CONTACTS_BREAKOUT,NABConstants.NAB_UNDELETE_CONTACTS_BREAKOUT_DEFAULT_VALUE);
	String NAB_PERMDEL_THRESHOLD = ICSProps.getProperty(NABConstants.NAB_DELETE_RECYCLE_CONTACTS_BREAKOUT,NABConstants.NAB_DELETE_RECYCLE_CONTACTS_BREAKOUT_DEFAULT_VALUE);
	String NAB_IS_SEQ_EXEC = ICSProps.getProperty(NABConstants.NAB_IS_SEQUENCE_EXECUTION,NABConstants.NAB_IS_SEQUENCE_EXECUTION_DEFAULT_VALUE);	
%>

<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("X-UA-Compatible", "IE=7");
response.setDateHeader("Expires", 0);
%>


