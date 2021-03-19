<%@page import="java.net.*"%>
<%
	String ipaddress = request.getHeader("X-FORWARDED-FOR");
	String hostname = java.net.InetAddress.getByName(ipaddress).getHostName();
%>

<style>
label {
	margin-top: 10px;
}
</style>

<h2>Ankieta Centrum Szkoleniowego SAS Institute</h2>
<p>Ankieta podsumowująca szkolenie przeprowadzone przez Centrum Szkoleniowe SAS Institute.
</br>W razie jakichkolwiek problemów z funkcjonowaniem ankiety, prosimy o poinformowanie prowadzącego szkolenie.</p>
<div class="alert alert-danger" id="validate_alert" style="display:none;">
	<strong>Uwaga!</strong> Należy wypełnić wymagane pola.
</div>
<form id="feedback">
	<input type="hidden" id="_program" name="_program" value="/Shared Data/Clients/Feedback/Stored Processes/feedback">
	<input type="hidden" id="ipAddress" name="ipAddress" value="<%=ipaddress%>">
	<input type="hidden" id="hostname" name="hostname" value="<%=hostname%>">
	<input type="hidden" id="courseID" name="courseID" value="">
	<input type="hidden" id="offerID" name="offerID" value="">
	<input type="hidden" id="startDate" name="startDate" value="">
	<input type="hidden" id="endDate" name="endDate" value="">
	<div class="form-group well well-sm">
		<label class="control-label" for="courseCode">Nazwa szkolenia<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="courseCode" name="courseCode">
		</select>
		
		<div id="instructor" style="display:none;">
			<label class="control-label" for="instructorName">Prowadzący<em style="color:red">*</em></label>
			<select class="form-control selectpicker required" id="instructorName" name="instructorName">
			</select>
		</div>
	</div>
	
	<div class="form-group well well-sm">
		<h2>Uczestnik</h2>
		
		<div>
			<div class="btn-group btn-group-justified" data-toggle="buttons">
				<label class="btn btn-default active">
					<input type="radio" name="studentType" value="C" autocomplete="off" checked>Klient
				</label>
				<label class="btn btn-default">
					<input type="radio" name="studentType" value="U" autocomplete="off">Uczelnia
				</label>
				<label class="btn btn-default">
					<input type="radio" name="studentType" value="P" autocomplete="off">Partner
				</label>
				<label class="btn btn-default">
					<input type="radio" name="studentType" value="E" autocomplete="off">Pracownik
				</label>
			</div>
		</div>
		
		<label class="control-label" for="studentFirstName">Imię</label>
		<input type="text" class="form-control" id="studentFirstName" name="studentFirstName" maxlength="50" />
		
		<label class="control-label" for="studentLastName">Nazwisko</label>
		<input type="text" class="form-control" id="studentLastName" name="studentLastName" maxlength="50" />
	
		<label class="control-label" for="studentEmail">Adres e-mail</label>
		<input type="text" class="form-control" id="studentEmail" name="studentEmail" maxlength="50" />
		
		<label class="control-label" for="studentPhone">Numer telefonu</label>
		<input type="text" class="form-control" id="studentPhone" name="studentPhone" value="+48 " />
		
		<label class="control-label" for="studentContact">Czy możemy skontaktować się z Panią/Panem w sprawie ankiety?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="studentContact" name="studentContact">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="Y">Tak</option>
			<option value="N">Nie</option>
		</select>
		
		<label class="control-label" for="studentHowLong">Jak długo pracuje Pani/Pan z narzędziami/produktami/rozwiązaniami SAS?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="studentHowLong" name="studentHowLong">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="0">Po raz pierwszy stykam się z produktami firmy SAS</option>
			<option value="<0.5">Mniej niż 6 miesięcy</option>
			<option value="0.5-1.5">0,5 - 1,5 roku</option>
			<option value="1.5-3">1,5 - 3 lat</option>
			<option value="3-5">3 - 5 lat</option>
			<option value=">5">Powyżej 5 lat</option>
		</select>
	</div>
	
	<div class="form-group well well-sm">
		<h2>Szkolenie</h2>
		<label class="control-label" for="courseContent">Jak ocenia Pani/Pan zawartość oraz układ szkolenia?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="courseContent" name="courseContent">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Bardzo dobrze</option>
			<option value="4">Dobrze</option>
			<option value="3">Przeciętnie</option>
			<option value="2">Słabo</option>
			<option value="1">Bardzo słabo</option>
		</select>
		
		<label class="control-label" for="courseNotes">Jak ocenia Pani/Pan materiały szkoleniowe?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="courseNotes" name="courseNotes">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Bardzo dobrze</option>
			<option value="4">Dobrze</option>
			<option value="3">Przeciętnie</option>
			<option value="2">Słabo</option>
			<option value="1">Bardzo słabo</option>
			<option value="?">Nie korzystałam/em podczas szkolenia</option>
		</select>
		
		<label class="control-label" for="courseSpeed">Jak ocenia Pani/Pan tempo szkolenia?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="courseSpeed" name="courseSpeed">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Odpowiednie</option>
			<option value="3">Za szybkie</option>
			<option value="1">Za wolne</option>
		</select>
		
		<label class="control-label" for="courseExercises">Jak ocenia Pani/Pan liczbę ćwiczeń zawartych na szkoleniu?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="courseExercises" name="courseExercises">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Odpowiednia</option>
			<option value="3">Za dużo</option>
			<option value="1">Za mało</option>
			<option value="?">Nie robiłam/em</option>
		</select>
		
		<label class="control-label" for="courseDescription">Czy zapoznał(a) się Pani/Pan z opisem szkolenia przed jego rozpoczęciem?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="courseDescription" name="courseDescription">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="Y">Tak</option>
			<option value="N">Nie</option>
		</select>
		
		<label class="control-label" for="courseRecommendation">Czy polecił(a) by Pani/Pan to szkolenie innej osobie?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="courseRecommendation" name="courseRecommendation">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="Y">Tak</option>
			<option value="N">Nie</option>
		</select>
		
		<label class="control-label" for="courseComment">Dodatkowy komentarz</label>
		<textarea type="text" class="form-control" id="courseComment" name="courseComment" rows="2" maxlength="1024"></textarea>
	</div>
	
	<div class="form-group well well-sm">
		<h2>Prowadzący</h2>
		<label class="control-label" for="instructorKnowledge">Jak ocenia Pani/Pan kompetencje prowadzącego?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="instructorKnowledge" name="instructorKnowledge">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Bardzo dobrze</option>
			<option value="4">Dobrze</option>
			<option value="3">Przeciętnie</option>
			<option value="2">Słabo</option>
			<option value="1">Bardzo słabo</option>
		</select>
		
		<label class="control-label" for="instructorTransfer">Jak ocenia Pani/Pan umiejętność przekazywania informacji prowadzącego?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="instructorTransfer" name="instructorTransfer">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Bardzo dobrze</option>
			<option value="4">Dobrze</option>
			<option value="3">Przeciętnie</option>
			<option value="2">Słabo</option>
			<option value="1">Bardzo słabo</option>
		</select>
		
		<label class="control-label" for="instructorParticipation">Jak ocenia Pani/Pan umiejętność zachęcania do aktywnego uczestnictwa w szkoleniu?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="instructorParticipation" name="instructorParticipation">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Bardzo dobrze</option>
			<option value="4">Dobrze</option>
			<option value="3">Przeciętnie</option>
			<option value="2">Słabo</option>
			<option value="1">Bardzo słabo</option>
		</select>
		
		<label class="control-label" for="instructorRecommendation">Czy chciałaby/chciałby Pani/Pan uczestniczyć w szkoleniu prowadzonym przez tego prowadzącego?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="instructorRecommendation" name="instructorRecommendation">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="Y">Tak</option>
			<option value="N">Nie</option>
		</select>
		
		<label class="control-label" for="instructorComment">Dodatkowy komentarz</label>
		<textarea type="text" class="form-control" id="instructorComment" name="instructorComment" rows="2" maxlength="1024"></textarea>
	</div>
	
	<div class="form-group well well-sm">
		<h2>Organizacja</h2>
		<label class="control-label" for="information">Jak ocenia Pani/Pan informacje na naszej stronie internetowej (strona www, katalog, kalendarz)?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="information" name="information">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Bardzo dobrze</option>
			<option value="4">Dobrze</option>
			<option value="3">Przeciętnie</option>
			<option value="2">Słabo</option>
			<option value="1">Bardzo słabo</option>
			<option value="?">Nie korzystałam/em</option>
		</select>
		
		<label class="control-label" for="registration">Jak ocenia Pani/Pan proces rejestracji na szkolenie?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="registration" name="registration">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Bardzo dobrze</option>
			<option value="4">Dobrze</option>
			<option value="3">Przeciętnie</option>
			<option value="2">Słabo</option>
			<option value="1">Bardzo słabo</option>
			<option value="?">Nie rejestrowałam/em się osobiście</option>
		</select>
		
		<label class="control-label" for="organizationComment">Dodatkowy komentarz</label>
		<textarea type="text" class="form-control" id="organizationComment" name="organizationComment" rows="2" maxlength="1024"></textarea>
	</div>
	
	<div class="form-group well well-sm">
		<h2>Infrastruktura</h2>	
		<label class="control-label" for="class">Jak ocenia Pani/Pan poziom przygotowania sali szkoleniowej?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="class" name="class">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Bardzo dobrze</option>
			<option value="4">Dobrze</option>
			<option value="3">Przeciętnie</option>
			<option value="2">Słabo</option>
			<option value="1">Bardzo słabo</option>
		</select>
	
		<label class="control-label" for="lunch">Jak ocenia Pani/Pan posiłek serwowany w czasie długiej przerwy?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="lunch" name="lunch">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Bardzo dobrze</option>
			<option value="4">Dobrze</option>
			<option value="3">Przeciętnie</option>
			<option value="2">Słabo</option>
			<option value="1">Bardzo słabo</option>
			<option value="?">Nie korzystałam/em</option>
		</select>
		
		<label class="control-label" for="infrastructureComment">Dodatkowy komentarz</label>
		<textarea type="text" class="form-control" id="infrastructureComment" name="infrastructureComment" rows="2" maxlength="1024"></textarea>
	</div>
	
	<div class="form-group">
		<div class="btn-group btn-group-justified">
			<div class="btn-group">
				<button id="feedback_submit" class="btn btn-success">
					<span class="glyphicon glyphicon-envelope"></span> Wyślij 
				</button>
			</div>
		</div>
	</div>
</form>
