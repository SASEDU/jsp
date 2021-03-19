<!--
 /*****************************************************************/
 /*           S A S   S A M P L E   L I B R A R Y                 */
 /*                                                               */
 /*    NAME: SIMPLE                                               */
 /*   TITLE: Stored Process list example                          */
 /* PRODUCT: SAS Integration Technologies - Stored Process        */
 /*  SYSTEM: ALL                                                  */
 /*    KEYS:                                                      */
 /*   PROCS:                                                      */
 /*    DATA:  Parameters hardwired                                */
 /*                                                               */
 /*  NOTES:                                                       */
 /*                                                               */
 /* SUPPORT: Web Tools Group             UPDATE: 15Feb2008        */
 /*****************************************************************/
-->
<%@page language="java"%>
<%@page import="java.util.*, java.io.*"%>
<%@page import="com.sas.services.information.InformationServiceInterface"%>
<%@page import="com.sas.services.information.metadata.PathUrl"%>
<%@page import="com.sas.services.session.SessionContextInterface"%>
<%@page import="com.sas.services.session.SessionServiceInterface"%>
<%@page import="com.sas.services.user.UserContextInterface"%>
<%@page import="com.sas.services.user.UserServiceInterface"%>
<%@page import="com.sas.services.webapp.ServicesFacade"%>
<%@page import="com.sas.midtier.components.container.util.impl.ComponentsUtil"%>
<%@page import="com.sas.services.storedprocess.*"%>

<%
 
// Static values
String DOMAIN = "DefaultAuth";                                    // login domain
String USERNAME = "sasdemo";                                      // username
String PASSWORD = "{sas002}F6A0213C16A8E7C1480C260B5B334B09";     // password

 
// Get information service
InformationServiceInterface informationService = ServicesFacade.getInformationService();


// Get user service  
UserServiceInterface userService = ServicesFacade.getUserService();


// Get user context
UserContextInterface userContext;
try {
  userContext = userService.newUser (null, USERNAME, PASSWORD, DOMAIN);
}
catch (com.sas.services.user.UserInitializationException e) {
  userContext = e.getUser();
}
catch (Exception e) {
  out.println("<html><body>Error creating user context: " + e.getLocalizedMessage() + "</body></html>");
  return;
} 


// Get session service
SessionServiceInterface sessionService = ServicesFacade.getSessionService();
SessionContextInterface sessionContext = sessionService.newSessionContext(userContext);

 
// Set up search 
com.sas.services.storedprocess.StoredProcessInterface storedProcess = null;
com.sas.services.storedprocess.metadata.StoredProcessInterface metadata = null;
out.println("<html><body>");
out.println("<br><table border=\"1\" cellpadding=\"1\" bgcolor=\"#EFEDDE\">" );
out.println("<caption><b>Stored Processes For Domain " + DOMAIN + "<b></caption>");
out.println("<tr><th>Name</th><th>Path</th></tr>"); 
 
try {
  String template = "<Templates><ClassifierMap><Trees/>" +
                    "</ClassifierMap><Tree><ParentTree/></Tree></Templates>";
  com.sas.services.information.FilterInterface filter =
                   new com.sas.services.storedprocess.metadata.StoredProcessFilter();
  filter.setOMRFlags(com.sas.services.information.util.ISDefs.OMI_DEPENDENCY_USES);
  filter.setOMRTemplate(template);
  Iterator it = informationService.search(userContext, filter).iterator();
  while (it.hasNext()) {
    Object o = it.next();
    if ( o instanceof com.sas.services.storedprocess.metadata.StoredProcessInterface) {
      metadata = (com.sas.services.storedprocess.metadata.StoredProcessInterface)o;
      if (metadata != null) {
        PathUrl upath = metadata.getPathUrl();
        String path = (upath != null) ? upath.toString() : "Not available";
        out.println("<tr><td align=left>" + metadata.getName() + "<td align=left>" +  path);
      }  
    }
  } 
}  
catch (Exception e) {
  out.println ("Error searching for stored processes: " + e.getLocalizedMessage());
}
 
out.println("</table></body></html>");
 
 
%>
