<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- Copyright (c) 2002-2006 by SAS Institute Inc., Cary, NC 27513 USA. All Rights Reserved. -->
<!-- packageviewer/PackageViewerError.jsp -->
<%@ page language="java"
	import="com.sas.webapp.components.Logger,
    com.sas.services.user.UserContextInterface,
    com.sas.apps.packageviewer.container.PackageViewerFactory,
	com.sas.midtier.components.container.util.impl.ComponentsUtil"
	contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://www.sas.com/taglib/saspackageviewer" prefix="packageviewer"%>
<%@ taglib uri="http://www.sas.com/taglib/sas" prefix="sas" %>
<%@ taglib uri="http://www.sas.com/taglib/sas-uis" prefix="sas-uis" %>

<sas-uis:Timeout frames="true"/> 

<%

Logger logger = (Logger) ComponentsUtil.locateComponent(Logger.class, request);
UserContextInterface userContext = null;
try
{
    userContext = PackageViewerFactory.getUserContext(request);

%>
<html>

<head>
    <sas:StyleSheet/>
    <sas:InitializeComponents/>
</head>

<table class="errorMessageBox" cellspacing="0" cellpadding="3" 	width="80%" align="center">
	<tr>
		<td>

		<table cellspacing="0" cellpadding="3" width="100%">
            <tr><td colspan="2" height="12"></td></tr>
			<tr class="logonPageMessageBoxTopRow">
				<td><sas:ThemedImage image="MessageError_24" bundle="com.sas.apps.packageviewer.res.Resources"/>
				<td class="logonPageMessageBoxTopRowText" align="left" nowrap
					width="100%"><packageviewer:Text
					key="error.invalidpackage.txt" /></td>
			</tr>
			<tr class="logonPageMessageBoxBottomRow ">
				<td colspan="2" nowrap>
				<ul>
					<li><packageviewer:Text key="error.invalidpackagereason1.txt" /></li>
					<li><packageviewer:Text key="error.invalidpackagereason2.txt" /></li>
					<li><packageviewer:Text key="error.invalidpackagereason3.txt" /></li>
				</ul>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>


<%
}
catch(Exception e)
{
    if (logger != null) {
		logger.error(e.getMessage(), "PackageViewerError.jsp", e, userContext);
	} else {
        System.err.println (e.getMessage());
	}
}

%>
