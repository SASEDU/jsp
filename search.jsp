<%@page language="java" contentType="text/html;charset=utf-8" 
%><%@
taglib uri='http://www.sas.com/taglib/sas-uis' prefix='sas-uis' 
%><%@
page import="java.util.*, java.io.*"
%><%@
page import="com.sas.framework.themes.client.*"
%><%@
page import="com.sas.framework.webapp.helpers.ClientHelper"
%><%@
page import="com.sas.web.keys.CommonKeys"
%><%@
page import="com.sas.services.storedprocess.webapp.RB"
%><%
 /*****************************************************************/
 /*           S A S  L I B R A R Y                                */
 /*                                                               */
 /*    NAME: search                                               */
 /*   TITLE: Stored Process search                                */
 /* PRODUCT: SAS Integration Technologies - Stored Process        */
 /*  SYSTEM: ALL                                                  */
 /*    KEYS:                                                      */
 /*   PROCS:                                                      */
 /*    DATA: Parameters                                           */
 /*          _match   search term                                 */
 /*          _field   field to search in                          */
 /*          _columns data to display                             */
 /*          _type    type to search for                          */
 /*                                                               */
 /*  NOTES:  Used to generate search form                         */
 /*                                                               */
 /* SUPPORT: Web Tools Group             UPDATE: 14Jul10          */
 /*****************************************************************/

request.setCharacterEncoding("utf-8");
Locale loc = (Locale)session.getAttribute("Banner_Locale");
String find = RB.getStringResource("Find.txt",loc);
String in = RB.getStringResource("In.txt",loc);
String name = RB.getStringResource("Name.txt",loc);
String description = RB.getStringResource("Description.txt",loc);
String keywords = RB.getStringResource("Keywords.txt",loc);
String search = RB.getStringResource("Search.txt",loc);
String type = RB.getStringResource("Type.txt",loc);
String storedprocess = RB.getStringResource("StoredProcess.txt",loc);
String report = RB.getStringResource("Report.txt",loc);
String reset = RB.getStringResource("Reset.txt",loc);
String columns = RB.getStringResource("Display.txt",loc);
String creationDate = RB.getStringResource("CreationDate.txt",loc);
String modifiedDate = RB.getStringResource("ModifiedDate.txt",loc);
String deschelp = RB.getStringResource("DescriptionHelp.txt",loc);
String keyhelp = RB.getStringResource("KeywordsHelp.txt",loc);
String createhelp = RB.getStringResource("CreateDateHelp.txt",loc);
String modhelp = RB.getStringResource("LastModifiedHelp.txt",loc);
String matchhelp = RB.getStringResource("MatchHelp.txt",loc);
String searchhelp = RB.getStringResource("SearchHelp.txt",loc);
String resethelp = RB.getStringResource("ResetHelp.txt",loc);
String fieldhelp = RB.getStringResource("FieldHelp.txt",loc);
String typehelp = RB.getStringResource("TypeHelp.txt",loc);


String URI = (String)session.getAttribute("SASStoredProcessURI") != null?
             (String)session.getAttribute("SASStoredProcessURI"):
             request.getContextPath()+"/do";

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html><head> 

<script type="text/javascript">/*<![CDATA[*/
  window.enableContextMenu = true;
  
  function fieldChange() {
    var c2 = document.getElementById("c2");
    var c3 = document.getElementById("c3");
    var fieldname = document.getElementById("fieldname");
    if (fieldname.value == "description")   c2.checked=true;
    else if (fieldname.value == "keywords") c3.checked=true;
  }  
/*]]>*/</script>
<sas-uis:Timeout frames="true" /> 
 
 
<%
// Style Sheets    
String css = ""; 
Theme theme = (Theme)request.getAttribute(CommonKeys.DISPLAY_THEME_OBJECT);
if (theme == null) {
  theme = (Theme) session.getAttribute("Banner_Theme");
  request.setAttribute(CommonKeys.DISPLAY_THEME_OBJECT, theme);
}
if (theme != null) {
  BrowserType browserType = ClientHelper.getBrowserType(request);
  Collection coll = theme.getStyleSheets(MediaType.SCREEN, browserType.getKey());
  Iterator it = coll.iterator();
  while( it.hasNext() ) {
    String style = (String)it.next();
    if (style.indexOf("sasComponents") >= 0 || style.indexOf("sasStyle") >= 0 || 
        style.indexOf("custom") >= 0 )
      out.println("<link type=\"text/css\" href=\"" + style + "\" rel=\"stylesheet\" />\n");
  }
}  


out.println("</head><body class=\"workarea\"><center><br />");  
out.println("<form id=\"searchform\" action=\"" + URI + "\" method=get target=\"_stpSearchTable\" >" + find + ":&nbsp;&nbsp;&nbsp; &nbsp;");  
out.println("  <input class=\"textEntry\" name=\"_match\" + style=\"width: 284px; height: 21px\" size=38 title=\"" + matchhelp + "\">&nbsp; " + in + "&nbsp;");  
out.println("  <select name=\"_field\" id=\"fieldname\" onChange=\"fieldChange()\" title=\"" + fieldhelp + "\">");    
out.println("    <option value=\"name\" selected>" + name + "</option>");    
out.println("    <option value=\"description\">" + description + "</option>");    
out.println("    <option value=\"keywords\">" + keywords + "</option>");  
out.println("  </select>&nbsp;&nbsp;");
out.println(   type + "&nbsp;&nbsp;");
out.println("  <select name=\"_type\" id=\"type\"  title=\"" + typehelp + "\">"); 
out.println("    <option value=\"\"></option>"); 
out.println("    <option value=\"storedprocess\">" + storedprocess + "</option>");    
out.println("    <option value=\"report\">" + report + "</option>");  
out.println("  </select>&nbsp;&nbsp;"); 
out.println("  <input type=submit class=\"button\" title=\"" + searchhelp + "\" value=\"" + search + "\">&nbsp;&nbsp;&nbsp;");  
out.println("  <input type=reset  class=\"button\" title=\"" + resethelp + "\" value=\"" + reset + "\"><br /><br />" + columns + ":&nbsp; &nbsp");
out.println("  <input type=\"checkbox\" id=\"c2\" name=\"_columns\" title=\"" + deschelp + "\" value=\"description\" checked=\"yes\">" +  description + "&nbsp;"); 
out.println("  <input type=\"checkbox\" id=\"c3\" name=\"_columns\" title=\"" + keyhelp + "\" value=\"keywords\">" +  keywords + "&nbsp;");
out.println("  <input type=\"checkbox\" id=\"c4\" name=\"_columns\" title=\"" + createhelp + "\" value=\"createDate\">" + creationDate + "&nbsp;");
out.println("  <input type=\"checkbox\" id=\"c5\" name=\"_columns\" title=\"" + modhelp + "\" value=\"modDate\">" + modifiedDate);

char[] specialChars = {'&', '<', '>', '"', '\r', '\n'};
String[] escapeSequences = {" ", " ", " ", " ", " ", " "};
String action = request.getParameter("_action");
if (action != null) {
  action = com.sas.util.Strings.replace(action, specialChars, escapeSequences);
  out.println("  <input type=\"hidden\" name=\"_action\" value=\"" + action + "\">");
}
else
  out.println("  <input type=\"hidden\" name=\"_action\" value=\"search,form,properties,execute,newwindow,nobanner\">");
String filter = request.getParameter("_path");

if (filter != null) {
  filter = com.sas.util.Strings.replace(filter, specialChars, escapeSequences);
  out.println("  <input type=\"hidden\" name=\"_path\" value=\"" + filter + "\">");
}  
out.println("</form></center></body></html>");

%>