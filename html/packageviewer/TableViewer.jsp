<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- Copyright (c) 2002-2006 by SAS Institute Inc., Cary, NC 27513 USA. All Rights Reserved. -->
<!-- packageviewer/TableViewer.jsp -->
<%@ page
  language="java"
  import="com.sas.apps.packageviewer.util.RequestId,
    com.sas.webapp.components.Logger,
    com.sas.services.user.UserContextInterface,
    com.sas.apps.packageviewer.container.PackageViewerFactory,
    com.sas.midtier.components.container.util.impl.ComponentsUtil,
    com.sas.services.publish.DatasetEntryInterface,
    com.sas.services.publish.RemoteResultSetInterface,
    java.sql.ResultSetMetaData"
  contentType= "text/html; charset=UTF-8"
%>

<%@ taglib uri="http://www.sas.com/taglib/sas" prefix="sas" %>
<%@ taglib uri="http://www.sas.com/taglib/sas-uis" prefix="sas-uis" %>

<sas-uis:Timeout frames="true"/> 

<%

Logger logger = (Logger) ComponentsUtil.locateComponent(Logger.class, request);
UserContextInterface userContext = null;
try
{
    userContext = PackageViewerFactory.getUserContext(request);

    DatasetEntryInterface ds = null;
    Object obj1 = request.getAttribute(RequestId.PackageItem);
    if (obj1 instanceof DatasetEntryInterface) {
        ds = (DatasetEntryInterface)obj1;
    }

    if (ds == null) {
        throw new Exception("DATASET is null");
    }

    RemoteResultSetInterface rs = ds.getRemoteResultSet();
    ResultSetMetaData rsMetaData = rs.getMetaData();
    int columns = rsMetaData.getColumnCount();
%>
<html>

<head>
    <sas:StyleSheet/>
    <sas:InitializeComponents/>
</head>

<body>

<table cellspacing="6" cellpadding="6" align="left" border="0" width="80%">
    <tr><td height="12"></td></tr>
    <tr>
        <td>
            <table class="mainTable" border="0" cellspacing="0" cellpadding="3" width="100%">

<%
                if (columns >= 1)
                {
%>

                    <thead>

                    <tr class="tableColumnHeaderRow">
                        <th class="tableHeader">&nbsp;</th>

<%
                        for (int i = 0; i < columns; i++)
                        {
                                String colName = rsMetaData.getColumnName(i + 1);
%>

                                <th scope="col" class="tableHeader">
                                    <span class="commonTitle"><%= colName %></span>
                                </th>

<%
                        }

%>

                    </tr>
                    </thead>
                    <tbody>


<%

                    int rowCount = 1;
                    String className = "";
                    while (rs.next())
                    {
                      className = ( (rowCount%2) == 0) ? new String("dataRow2_tableRow") : new String("dataRow1_tableRow");

%>

                        <tr class="<%= className %>">
                            <th scope="row" class="tableHeader"><span class="commonTitle"><%= rowCount %></span></th>
<%
                        for (int i = 0; i < columns; i++)
                        {
                            String value = rs.getString(i+1);
                            if (value == null)
                                value="";
                            else
                                value.trim();
                            if (value.length() > 0)
                            {
%>
                                <td class="textTableCell"><%= value %></td>
<%
                            }
                            else
                            {
%>
                                <td class="textTableCell">&nbsp;</td>
<%
                            }
                        }
                        rowCount++;
%>
                        </tr>
<%
                    }
                }
%>

                </tbody>
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
    if (logger != null) {
        logger.error(e.getMessage(), "TableViewer.jsp", e, userContext);
    } else {
        System.err.println (e.getMessage());
    }

}

%>
