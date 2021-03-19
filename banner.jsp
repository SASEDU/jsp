<%@page language="java" contentType="text/html;charset=utf-8" 
%><%@
page import="java.util.*, java.io.*"
%><%@
page import="com.sas.framework.themes.client.*"
%><%@
page import="com.sas.framework.webapp.helpers.ClientHelper"
%><%@
page import="com.sas.servlet.tbeans.html.Banner"
%><%@
page import="com.sas.common.components.SpringComponentFacade"
%><%@
page import="com.sas.web.keys.CommonKeys"
%><%
 /*****************************************************************/
 /*           S A S  L I B R A R Y                                */
 /*                                                               */
 /*    NAME: banner                                               */
 /*   TITLE: Stored Process banner                                */
 /* PRODUCT: SAS Integration Technologies - Stored Process        */
 /*  SYSTEM: ALL                                                  */
 /*    KEYS:                                                      */
 /*   PROCS:                                                      */
 /*    DATA: Parameters                                           */
 /*          _top_matter      true if include bod tags            */
 /*          _bottom_matter   true if include eod tags            */
 /*          _action          check for nobanner                  */
 /*                                                               */
 /*          Session values                                       */
 /*          Banner_Title               title                     */
 /*          Banner_LogoffURL           logoff link               */
 /*          Banner_BackLinkURL         back link url             */
 /*          Banner_BackLinkDescription desc                      */
 /*          Banner_BackLinkLabel       label                     */
 /*          Banner_BreadCrumb1         first label               */
 /*          Banner_BreadCrumb2         second label              */
 /*                                                               */
 /*  NOTES:  Used to generate banner in stored process web app    */
 /*                                                               */
 /* SUPPORT: Web Tools Group             UPDATE: 14Feb2008        */
 /*****************************************************************/
 
 request.setCharacterEncoding("utf-8");
 
 
// Look for pieces
boolean top = false;
boolean bottom = false;
boolean banner = true;
Enumeration params = request.getParameterNames();
while (params.hasMoreElements()) {
  String pName = (String) params.nextElement();
  if (pName.equalsIgnoreCase("_top_matter")) {
    String paramValues[] = (String[])request.getParameterValues(pName);
    top = paramValues[0].equalsIgnoreCase("true");
  }
  else if (pName.equalsIgnoreCase("_bottom_matter")) {
    String paramValues[] = (String[])request.getParameterValues(pName);
    bottom = paramValues[0].equalsIgnoreCase("true");
  } 
  else if (pName.equalsIgnoreCase("_action")) {
    String paramValues[] = (String[])request.getParameterValues(pName);
    banner = paramValues[0].toLowerCase().indexOf("nobanner") < 0; 
  }
}
  
// Session Values 
String title =         (String)session.getAttribute("Banner_Title");
String logoff =        (String)session.getAttribute("Banner_LogoffURL");
String backLinkURL =   (String)session.getAttribute("Banner_BackLinkURL");
String backLinkDesc =  (String)session.getAttribute("Banner_BackLinkDescription");
String backLinkLabel = (String)session.getAttribute("Banner_BackLinkLabel"); 
String bread1 =        (String)session.getAttribute("Banner_BreadCrumb1"); 
String bread2 =        (String)session.getAttribute("Banner_BreadCrumb2"); 
 
if (top) {
  out.println("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">");
  out.println("<html><head>");
  out.println("<title>" + title + "</title>");
}
 
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
out.println("<script language = Javascript>/*<![CDATA[*/");
out.println(" var enableContextMenu = true;");
out.println("/*]]>*/</script>");    
PrintWriter pw = new PrintWriter(out);
com.sas.servlet.util.Components.init(pw, request); 
 
// Function to clear screen and call logoff url
out.println("<script language = Javascript>/*<![CDATA[*/");
out.println("function clearFrame (url) {");
out.println("window.top.location.replace(url)");
out.println("}");
out.println("/*]]>*/</script>");
 
out.println("</head><body>");
 
// Get banner
if (banner) { 
  Banner helper = new Banner();   
  helper.setRequest(request);  
  if (title != null)helper.setTitle(title);
  if (logoff != null) helper.setLogOffURL("javascript: clearFrame(\"" + logoff + "\")");
  if (backLinkURL != null) helper.setBackLinkURL(backLinkURL);
  if (backLinkDesc != null) helper.setBackLinkDescription(backLinkDesc);
  if (backLinkLabel != null) helper.setBackLinkLabel(backLinkLabel);
  if (bread1 != null)helper.setBreadCrumb1(bread1);
  if (bread2 != null)helper.setBreadCrumb2(bread2);
  Locale loc = (Locale)session.getAttribute("Banner_Locale");
  if (loc != null)helper.setLocale(loc); 
  helper.write(pw);
}
  
if (bottom) out.println("</body></html>");
out.flush();
%>
