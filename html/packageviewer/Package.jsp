<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- Copyright (c) 2002-2007 by SAS Institute Inc., Cary, NC 27513 USA. All Rights Reserved. -->
<!-- packageviewer/Package.jsp -->
<%@ page
  language="java"
  import="com.sas.apps.packageviewer.util.RequestId,
    com.sas.webapp.components.Logger,
    com.sas.services.user.UserContextInterface,
    com.sas.services.publish.ResultPackageInterface,
    com.sas.apps.packageviewer.PackageBean,
    com.sas.apps.packageviewer.res.RB,
    java.util.Date,
    java.text.DateFormat,
    java.util.Locale"
  contentType= "text/html; charset=UTF-8"
%>

<%@ taglib uri="http://www.sas.com/taglib/sas" prefix="sas" %>
<%@ taglib uri="http://www.sas.com/taglib/sas-uis" prefix="sas-uis" %>

<sas-uis:Timeout frames="true"/> 

<%

UserContextInterface userContext = null;
try {

    userContext = com.sas.apps.packageviewer.container.PackageViewerFactory.getUserContext(request);
    ResultPackageInterface displayPackage = null;
    Locale locale = request.getLocale();
    try {
      if (userContext != null && userContext.getProfile() != null && userContext.getProfile().getLocale("SAS") != null) {
        locale = userContext.getProfile().getLocale("SAS");
      }
    }
    catch (Exception e) {}

    PackageBean pBean = (PackageBean)session.getAttribute(com.sas.apps.packageviewer.util.SessionId.PACKAGE_BEAN);
    ResultPackageInterface rspk = pBean.getResultPackage (request.getParameter(RequestId.PackageId));

    String packageItemId = request.getParameter(RequestId.PackageItemId);
    if (packageItemId != null) {
        displayPackage = (ResultPackageInterface)rspk.getEntry(packageItemId);
    } else {
        displayPackage = rspk;
    }

    if ( displayPackage == null) {
        throw new Exception("PACKAGE is null");
    }

    String dateString = DateFormat.getDateTimeInstance (DateFormat.MEDIUM, DateFormat.LONG, locale)
                           .format (new Date (displayPackage.getCreationDateTime()));
%>
<html>

<head>
    <sas:StyleSheet/>
    <sas:InitializeComponents/>
</head>

<body>

    <br>
    <table border="0" width="60%">
        <tr style="background-color: #dcdcdc"><td nowrap><%=RB.getStringResource ("label.name.txt", locale)%></td><td><%=displayPackage.getName()%></td></tr>
        <tr><td nowrap><%=RB.getStringResource ("label.description.txt", locale)%></td><td><%=displayPackage.getDescription()%></td></tr>
        <tr style="background-color: #dcdcdc"><td nowrap><%=RB.getStringResource ("label.abstract.txt", locale)%></td><td><%=displayPackage.getAbstract()%></td></tr>
        <tr><td nowrap><%=RB.getStringResource ("label.creationdate.txt", locale)%></td><td><%=dateString%></td></tr>
    </table>
</body>
</html>
<%
}
catch(Exception e)
{
    Logger logger = (Logger) com.sas.midtier.components.container.util.impl.ComponentsUtil.locateComponent(Logger.class, request);
    if (logger != null) {
        logger.error(e.getMessage(), "Package.jsp", e, userContext);
    } else {
        System.err.println (e.getMessage());
    }
}

%>
