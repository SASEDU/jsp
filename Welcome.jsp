<%@page language="java" contentType="text/html;charset=utf-8"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.*"%>
<%@page import="com.sas.services.user.UserContext"%>
<%
	String logoff = "/SASStoredProcess/do/?_ACTION=logoff";
	UserContext context = (UserContext)session.getValue("sasUserContext_s");
	String user = context.getPerson().getDisplayName();
	String department = "brak grupy";
	try {
		department = (String)context.getGroups().get(0);
	} catch(IndexOutOfBoundsException e) {}
	Integer year = Calendar.getInstance().get(Calendar.YEAR);
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="shortcut icon" href="/favicon.ico">

		<title>Centrum Szkoleniowe SAS</title>
		
		<!-- Bootstrap core CSS -->
		<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
		
		<!-- Bootstrap DateTimePicker -->
		<link rel="stylesheet" type="text/css" href="/css/bootstrap-datetimepicker.css" media="screen" /> 
		<link rel="stylesheet" type="text/css" href="/css/bootstrap-select.min.css" media="screen" />
		
		<link rel="stylesheet" type="text/css" href="/css/typeahead.js-bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="/css/bootstrap-typeahead-update.css" />
		
		<!-- Load jquery.navgoco plugin css file -->
		<link rel="stylesheet" type="text/css" href="/css/jquery.navgoco.css" media="screen" />
		
		<!-- Just for debugging purposes. Don't actually copy this line! -->
		<!--[if lt IE 9]><script src="/js/ie8-responsive-file-warning.js"></script><![endif]-->

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->

		<link rel="stylesheet" type="text/css" href="/css/modal.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="/css/form.css" media="screen" />
	</head>
	
	<body>
		<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="">SAS Centrum Szkoleniowe</a>
				</div>
				<div class="navbar-collapse collapse">
					<div class="navbar-form navbar-right">
						<a href="/SASStoredProcess/do/?_ACTION=logoff"><button type="submit" class="btn btn-success">Wyloguj: <%=user%></button></a>
					</div>
				</div><!--/.navbar-collapse -->
			</div>
		</div>

		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div style="height: 70px;">
		</div>
		<div class="container">
			<!-- Example row of columns -->
			<div class="row">
				<div class="col-md-3">
					<ul id="links" class="nav">
<% if (context.isInGroup("EDU") == true || context.isInGroup("EDUSPL") == true) { %>
						<li><a href="#">Systemy</a>
							<ul>
								<li><a href="https://edu.escloud.sas.com/iris/">IRIS</a></li>
								<li><a href="http://lweops.na.sas.com/vlabGlobal/calendars/glwCalendar#loaded">Global Live Web Calendar</a></li>
								<li><a href="http://edueit01.na.sas.com/geco/pl">GECO</a></li>
								<li><a href="javascript:void(0)" onclick="load('feedback_view');">Ankiety</a></li>
								<li><a href="http://splurve/urve/site/login.html?lang=pl">URVE</a></li>
								<li><a href="http://www.spl.sas.com/intranet_new/rezerwacje/day.php">Rezerwacja laptopów</a></li>
							</ul>
						</li>
						<li><a href="http://splendid/SASVisualAnalyticsViewer/VisualAnalyticsViewer.jsp">VA Raporty</a>
							<ul>
								<li><a href="http://splendid/SASVisualAnalyticsViewer/?reportSBIP=SBIP%3A%2F%2FMETASERVER%2FShared%20Data%2FEDU%2FVA%2FShared%20Data%2FRaporty%2FSzkolenia(Report)&page=vi8848">Statystyki szkoleń w VA</a></li>
							</ul>
						</li>
						<li><a href="#">Materiały</a>
							<ul>
								<li><a href="#">Książki</a>
									<ul>
										<li><a href="file://edutcs/e$/MATERIAŁY/">polskie</a></li>
										<li><a href="http://edueit01.na.sas.com/prime/home/search/materials">amerykańskie</a></li>
									</ul>
								</li>
								<li><a href="#">Dane</a>
									<ul>
										<li><a href="http://edu.na.sas.com/platform/eip93/Image9.4/SitePages/Home.aspx">Do obrazów</a></li>
									</ul>
								</li>
								<li><a href="#">Inne</a>
									<ul>
										<li><a href="http://sww.sas.com/pub/pub_solutions/bizdev/solutions_doc/index.php">Security Sensitive Documentation</a></li>
										<li><a href="http://sww.sas.com/vle">SAS Virtual Learning</a></li>
										<li><a href="http://sww.sas.com/dataflux/training/Training_Materials_DMP.htm">DataFlux DMP</a></li>
										<li><a href="http://sww.sas.com/pub/pub_solutions/bizdev/solutions_doc/index.php">Dokumentacja</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<li><a href="#">Obrazy</a>
							<ul>
								<li><a href="http://race.na.sas.com/">Race</a></li>
								<li><a href="http://edueit01.na.sas.com/ecrs/">ECRS</a></li>
							</ul>
						</li>
						<li><a href="#">Inne</a>
							<ul>
								<li><a href="http://esurveys.na.sas.com/TESSA/main/index2.jsp">TESSA</a></li>
								<li><a href="https://support.sas.com/planapp/login.jsp">Plan Instalacji</a></li>
								<li><a href="http://splhotline5.spl.sas.com">Hotline</a></li>
								<li><a href="http://www.spl.sas.com/intranet_new/index.php?page=abc-adresy-i-telefony">Kontakty</a></li>
								<li><a href="http://sww.sas.com/wwm/pricing/privatepackaging/final_overviews.php">Packaging</a></li>
							</ul>
							<li><a href="#">Materiały marketingowe</a>
									<ul>
										<li><a href="https://brand.sas.com/en/home.html">Czcionki, szablony itp</a></li>
										<li><a href="https://unsplash.com/">Grafiki do użycia</a></li>										
									</ul>
								</li>
							<li><a href="#">Egzaminy</a>
							<ul>
								<li><a href="https://www.certmetrics.com/sas/" target="_new">SAS Certification Manager</a></li>
								<li><a href="https://www.certmetrics.com/SAS/public/candidate_directory_search.aspx" target="_new">Certificant Registry</a></li>
								<li><a href="http://sww.sas.com/edu/cert/mobile.shtml#s1=1" target="_new">Zamawianie egzaminów</a></li>
							</ul>
						</li>
						</li>
						<li><a href="http://172.28.64.228/hp/device/this.LCDispatcher">Drukarka HP 9050</a></li>
						
<% } %>
<% if (context.isInGroup("EDU") == true || context.isInGroup("EDUSPL") == true || context.isInGroup("SAS") == true) { %>
						<li><a href="http://europe.emea.sas.com/spl/mkt/edu/default.aspx" target="_new">Portal Edukacji</a></li>
<% } %>
<% if (context.isInGroup("EDU") == true || context.isInGroup("EDUSPL") == true || context.isInGroup("IT2") == true) { %>	
						<li><a href="https://splendid.emea.sas.com/SASStoredProcess/do?_action=form,properties,execute,nobanner,newwindow&_program=%2FShared+Data%2FIT%2FUrve%2FStored+Processes%2FUrve_daily_update" target="_new">Odśwież URVE</a></li>
<% } %>
						<li><a href="https://www.sas.com/content/dam/SAS/documents/technical/training/pl/pl_pl-learn-sas-catalog.pdf" target="_new">Katalog szkoleń</a></li>
						<li><a href="https://www.sas.com/content/dam/SAS/documents/technical/training/pl/pl_pl-calendar.pdf" target="_new">Kalendarz szkoleń</a></li>						
					</ul>
				</div>
				<div class="col-md-9" id="container">
					<div class="col-md-12" id="container_inner">
					</div>
<% if (context.isInGroup("EDU") == true || context.isInGroup("EDUSPL") == true) { %>
	<jsp:include page="/jsp/edu.jsp" />
<% } else if (context.isInGroup("SAS") == true) { %>
	<jsp:include page="/jsp/sas.jsp" />
<% } else if (context.isInGroup("Clients") == true) { %>
	<jsp:include page="/jsp/framework.jsp" />
<% } %>
				</div>
			</div>

			<hr>

			<footer>
				<p>&copy; Centrum Szkoleniowe SAS 2020</p>
			</footer>
		</div> <!-- /container -->
		
		<div class="modal_loading" id="modal_loading"></div>

		<!-- Bootstrap core JavaScript
		================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script type="text/javascript" src="/js/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="/js/jquery.mask.min.js"></script>
		<script type="text/javascript" src="/js/moment.min.js"></script>
		<script type="text/javascript" src="/js/bootstrap.min.js"></script>		
		<script type="text/javascript" src="/js/bootstrap-select.min.js"></script>
		<!-- Load jquery.cookie plugin (optional) -->
		<script type="text/javascript" src="/js/jquery.cookie.min.js"></script>
		<!-- Load jquery.navgoco plugin js file -->
		<script type="text/javascript" src="/js/jquery.navgoco.min.js"></script>
		
		<script type="text/javascript" src="/js/bootstrap-datetimepicker.min.js"></script>
		<script type="text/javascript" src="/js/bootstrap-datetimepicker.pl.js"></script>
		<script type="text/javascript" src="/js/typeahead.min.js"></script>
		
		<script type="text/javascript" src="/SASStoredProcess/js/welcome.js"></script>
		
<% if (context.isInGroup("EDU") == true || context.isInGroup("EDUSPL") == true) { %>
		<script type="text/javascript" src="/SASStoredProcess/js/edu.js"></script>
<% } if (context.isInGroup("SAS") == true) { %>
		<script type="text/javascript" src="/SASStoredProcess/js/szzns.js"></script>
		<!--<script type="text/javascript" src="/SASStoredProcess/js/szzns_form.js"></script>-->
<% } else if (context.isInGroup("Clients") == true) { %>
		<script type="text/javascript" src="/js/feedback.json"></script>
		<script type="text/javascript" src="/SASStoredProcess/js/feedback.js"></script>
<% } %>
	</body>
</html>

