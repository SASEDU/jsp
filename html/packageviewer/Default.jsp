<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- Copyright (c) 2002-2007 by SAS Institute Inc., Cary, NC 27513 USA. All Rights Reserved. -->
<!-- packageviewer/Default.jsp -->
<%@ page
  language="java"
  import="com.sas.webapp.components.Logger,
    com.sas.services.user.UserContextInterface,
    com.sas.midtier.components.container.util.impl.ComponentsUtil,
    com.sas.webapp.remote.session.RemoteContextManager,
    com.sas.webapp.util.SessionFacade"

  contentType= "text/html; charset=UTF-8"
%>

<%@ taglib uri="http://www.sas.com/taglib/saspackageviewer" prefix="packageviewer"%>
<%@ taglib uri="http://www.sas.com/taglib/sas" prefix="sas"%>

<%

Logger logger = (Logger) ComponentsUtil.locateComponent(Logger.class, request);
UserContextInterface userContext = null;
try
{
    SessionFacade sessionFacade = RemoteContextManager.getSessionFacade(request);
    userContext = sessionFacade.getUserContext();

%>
<html>

<head>
    <sas:StyleSheet/>
    <sas:InitializeComponents/>
</head>

<body>
<p><img border="0" src="<packageviewer:ImagePath image="1x1.gif"/>" height="12" /></p>

<table cellspacing="6" cellpadding="6" align="left" border="0" width="100%">
    <tr>
        <td>
                <table class="infoMessageBox" cellspacing="2" cellpadding="2" width="80%">
                    <tr>
                        <td valign="center"><img border="0" src="<sas:ThemeImage image="MessageInform_24"/>" width="24" height="24" /></td>
                        <td align="left" width="100%" nowrap>
                            <packageviewer:Text key="message.notimplemented.txt"/>
                        </td>
                    </tr>
                </table>
        </td>
    </tr>
</table>
</body>
</html>

<%
}
catch(Exception e)
{
    logger.error(e.getMessage(), "Default.jsp", e, userContext);

}
%>
