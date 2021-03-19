<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- Copyright (c) 2002-2007 by SAS Institute Inc., Cary, NC 27513 USA. All Rights Reserved. -->
<!-- packageviewer/PackageTitle.jsp -->
<%@ page
  language="java"
  import="com.sas.apps.packageviewer.util.RequestId,
    com.sas.webapp.components.Logger,
    com.sas.services.user.UserContextInterface,
    com.sas.midtier.components.container.util.impl.ComponentsUtil,
    com.sas.apps.packageviewer.container.PackageViewerFactory"
  contentType= "text/html; charset=UTF-8"
%>

<%@ taglib uri="http://www.sas.com/taglib/sas" prefix="sas" %>
<%@ taglib uri="http://www.sas.com/taglib/sas-uis" prefix="sas-uis" %>

<sas-uis:Timeout frames="true"/> 

<%

Logger logger = null;
UserContextInterface userContext = null;
try
{
    userContext = PackageViewerFactory.getUserContext(request);
    logger = (Logger) ComponentsUtil.locateComponent(Logger.class, request);
    String packageDesc = (String)request.getAttribute(RequestId.PackageDesc);
    String packageAbstract = (String)request.getAttribute(RequestId.PackageAbstract);

%>


<html>

<head>
    <sas:InitializeComponents/>
    <sas:StyleSheet styleNames="SAS Style"/>
</head>

<body>
    <sas:Banner title="<%= packageDesc %>" secondaryTitle="<%=packageAbstract %>"/>
    
</body>
</html>
<%
}
catch(Exception e)
{
    if (logger != null) {
        logger.error(e.getMessage(), "PackageTitle.jsp", e, userContext);
    } else {
        System.err.println (e.getMessage());
    }
}

%>
