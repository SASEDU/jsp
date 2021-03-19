<!--
 /*****************************************************************/
 /*           S A S   S A M P L E   L I B R A R Y                 */
 /*                                                               */
 /*    NAME: SIMPLE                                               */
 /*   TITLE: Stored Process simple example                        */
 /* PRODUCT: SAS Integration Technologies - Stored Process        */
 /*  SYSTEM: ALL                                                  */
 /*    KEYS:                                                      */
 /*   PROCS:                                                      */
 /*    DATA:  Parameters hardwired                                */
 /*                                                               */
 /*  NOTES:  Only handles streamed text stored processes.         */
 /*                                                               */
 /* SUPPORT: Web Tools Group             UPDATE: 15Feb2008        */
 /*****************************************************************/
-->
<%@page language="java"%> 
<%@page import="java.util.*, java.io.*"%> 
<%@page import="com.sas.services.information.InformationServiceInterface"%>
<%@page import="com.sas.services.information.metadata.PathUrl"%>
<%@page import="com.sas.services.information.RepositoryInterface"%>
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
String PROGRAM = "/Products/SAS Intelligence Platform/Samples/Sample: Hello World";
 
 
// Get information service
InformationServiceInterface informationService = ServicesFacade.getInformationService();


// Get user service  
UserServiceInterface userService = ServicesFacade.getUserService();


// Get user context
UserContextInterface userContext;
try {
  userContext = userService.newUser(null, USERNAME, PASSWORD, DOMAIN);
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

 
// Construct pathUrl
PathUrl path = new PathUrl("sbip://METASERVER" + PROGRAM + "(StoredProcess)");


// Find program  
com.sas.services.storedprocess.metadata.StoredProcessInterface metadata = null;
Object obj = informationService.getObjectByPath(userContext, path);
if (obj != null) { 
  metadata = (com.sas.services.storedprocess.metadata.StoredProcessInterface)obj;
}
if (metadata == null) {
  out.println("<html><body>Program not found: " + PROGRAM + "</body></html>");
  return;
}  
 
 
// Make stored process object
com.sas.services.storedprocess.StoredProcess2Interface storedProcess =  
  (com.sas.services.storedprocess.StoredProcess2Interface)metadata.newServiceObject(); 
storedProcess.setParameterValue ("_result", "STREAM");

  
 
// Run stored process  
Execution2Interface spExecution;
try {
  spExecution = storedProcess.execute(false, null, false, null);
}
catch (Exception e) {
  out.println("<html><body>Error executing stored process: " + e.getLocalizedMessage() + "</body></html>");
  return;
} 
 

// Handle results
 
// Set up reader
String encoding = null;
BufferedReader spStream;
com.sas.io.InputStreamHeaderInterface header = spExecution.getInputStreamHeader("_WEBOUT"); 
if (header != null) encoding = header.getCharacterEncoding();
if (encoding != null) {
  spStream = new BufferedReader(new InputStreamReader(spExecution.getInputStream("_WEBOUT"), encoding));
}
else {
  spStream = new BufferedReader(new InputStreamReader(spExecution.getInputStream("_WEBOUT")));
}


// Headers
Map headerlines = header.getHeaders();
if (headerlines != null) {
  Iterator itt = headerlines.keySet().iterator();
  String key;
  while (itt.hasNext()) {
    key = itt.next().toString();
    if (key != null) response.addHeader(key, (String)headerlines.get(key));
  }
}

// Get data
String line;
while ((line = spStream.readLine()) != null) {
  out.println(line);
}  


// Wait for completion
int returnCode = spExecution.waitForCompletion();
 
 
// See if execute had an error
if (returnCode == ExecutionBaseInterface.STATUS_EXCEPTION_OCCURRED ||
    returnCode == ExecutionBaseInterface.STATUS_SAS_EXCEPTION_OCCURRED) {
  ExecutionException[] errors = spExecution.getExceptions();  
  out.println("<html><body>Error executing stored process. ");
  for (int i=0; i < errors.length; i++) {
    out.println("<br>" + errors[i].getLocalizedMessage());
  }
  out.println("</body></html>");
  return;  
}


// Get return code
int sasrc = spExecution.getSASConditionCode();
if (sasrc != 0 && sasrc != 4) {
  out.println("<html><body>Error in SAS program. Return code:" + sasrc + "</body></html>");
}


// Get log 
String log = spExecution.readSASLog(ExecutionBaseInterface.LOG_FORMAT_HTML,
                                    ExecutionBaseInterface.LOG_ALL_LINES);
out.println("<br>" + log);

spExecution.destroy();
%>
