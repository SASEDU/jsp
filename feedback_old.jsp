<h2>Ankieta Centrum Szkoleniowego SAS Institute</h2> 
<p>Ankieta podsumowująca szkolenie przeprowadzone przez Centrum Szkoleniowe SAS Institute.
</br>W razie jakichkolwiek problemów z funkcjonowaniem ankiety, prosimy o poinformowanie prowadzącego szkolenie.</p>
<div class="alert alert-danger" id="validate_alert" style="display:none;">
	<strong>Uwaga!</strong> Należy wypełnić wszystkie pola.
</div>

<form id="feedback">
	<input type="hidden" id="_program" name="_program" value="/Shared Data/Clients/Feedback/Stored Processes/feedback">
	<input type="hidden" id="startDate" name="startDate" value="">
	<div class="form-group well well-sm">
		<label class="control-label" for="courseCode">Nazwa szkolenia<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="courseCode" name="courseCode">
		</select>
		
		<label class="control-label" for="instructorName">Prowadzący<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="instructorName" name="instructorName">
		</select>
		
		<label class="control-label" for="studentName">Uczestnik<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="studentName" name="studentName">
		</select>
		
		<div id="contact" style="display:none;">
			<label class="control-label" for="studentEmail">Adres e-mail</label>
			<input type="text" class="form-control" id="studentEmail" name="studentEmail" style="margin-bottom: 10px;"/>
			
			<label class="control-label" for="studentPhone">Numer telefonu</label>
			<input type="text" class="form-control" id="studentPhone" name="studentPhone" style="margin-bottom: 10px;"/>
			
			<label class="control-label" for="studentContact">Czy możemy skontaktować się z Panią/Panem w sprawie ankiety?<em style="color:red">*</em></label>
			<select class="form-control selectpicker" id="studentContact" name="studentContact">
				<option value="" disabled style="display:none;">Wybierz ...</option>
				<option value="Y">Tak</option>
				<option value="N" selected>Nie</option>
			</select>
		</div>
	</div>
	
	<div class="form-group well well-sm">
		<label class="control-label" for="howLong">Jak długo pracuje Pani/Pan z narzędziami/produktami/rozwiązaniami SAS?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="howLong" name="howLong">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="<0.5">Mniej niż 6 miesięcy</option>
			<option value="0.5-1.5">0,5 - 1,5 roku</option>
			<option value="1.5-3">1,5 - 3 lat</option>
			<option value="3-5">3 - 5 lat</option>
			<option value=">5">Powyżej 5 lat</option>
		</select>
	</div>

	<div class="form-group well well-sm">
		<label class="control-label" for="descriptionRead">Czy zapoznał(a) się Pani/Pan z opisem szkolenia przed jego rozpoczęciem?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="descriptionRead" name="descriptionRead">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="Y">Tak</option>
			<option value="N">Nie</option>
		</select>
	</div>
	
	<div class="form-group well well-sm">
		<label class="control-label" for="class">Jak ocenia Pani/Pan poziom przygotowania sali kursowej do szkolenia (infrastruktura, oprogramowanie, inne)?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="class" name="class">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Ponad potrzeby kursu</option>
			<option value="3">Wystarczająco na potrzeby kursu</option>
			<option value="1">Niewystarczający</option>
			<option value="?">Nie mam zdania</option>
		</select>
		<label class="control-label" for="classComment">Komentarz</label>
		<textarea type="text" class="form-control" id="classComment" name="classComment" rows="2" maxlength="256"></textarea>
	</div>
	
	<div class="form-group well well-sm">
		<label class="control-label" for="instructorCourseKnowledge">Jak ocenia Pani/Pan poziom kompetencji instruktora z tematyki obejmującej program szkolenia?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="instructorCourseKnowledge" name="instructorCourseKnowledge">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Ponad potrzeby kursu</option>
			<option value="3">Wystarczająco na potrzeby kursu</option>
			<option value="1">Niewystarczający</option>
			<option value="?">Nie mam zdania</option>
		</select>
		<label class="control-label" for="instructorCourseKnowledgeComment">Komentarz</label>
		<textarea type="text" class="form-control" id="instructorCourseKnowledgeComment" name="instructorCourseKnowledgeComment" rows="2" maxlength="256"></textarea>
	</div>
	
	<div class="form-group well well-sm">
		<label class="control-label" for="instructorKnowledge">Jak ocenia Pani/Pan poziom kompetencji instruktora z tematyki wykraczającej poza zakres szkolenia?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="instructorKnowledge" name="instructorKnowledge">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Ponad potrzeby kursu</option>
			<option value="3">Wystarczająco na potrzeby kursu</option>
			<option value="1">Niewystarczający</option>
			<option value="?">Nie mam zdania</option>
		</select>
		<label class="control-label" for="instructorKnowledgeComment">Komentarz</label>
		<textarea type="text" class="form-control" id="instructorKnowledgeComment" name="instructorKnowledgeComment" rows="2" maxlength="256"></textarea>
	</div>
	
	<div class="form-group well well-sm">
		<label class="control-label" for="exercise">Czy proponowane ćwiczenia były ciekawe i dostosowane do poruszanej tematyki?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="exercise" name="exercise">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Tak</option>
			<option value="3">Częściowo</option>
			<option value="1">Nie</option>
			<option value="?">Nie mam zdania</option>
		</select>
		<label class="control-label" for="exerciseComment">Komentarz</label>
		<textarea type="text" class="form-control" id="exerciseComment" name="exerciseComment" rows="2" maxlength="256"></textarea>
	</div>
	
	<div class="form-group well well-sm">
		<label class="control-label" for="usefulness">Czy wiedza przekazana podczas szkolenia będzie przydatna Pani/Panu w praktyce?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="usefulness" name="usefulness">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Tak</option>
			<option value="3">Częściowo</option>
			<option value="1">Nie</option>
			<option value="?">Nie mam zdania</option>
		</select>
		<label class="control-label" for="usefulnessComment">Komentarz</label>
		<textarea type="text" class="form-control" id="usefulnessComment" name="usefulnessComment" rows="2" maxlength="256"></textarea>
	</div>
	
	<div class="form-group well well-sm">
		<label class="control-label" for="expectation">Czy tematyka poruszana w trakcie szkolenia odpowiadała Pani/Pana oczekiwaniom?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="expectation" name="expectation">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Tak</option>
			<option value="3">Częściowo</option>
			<option value="1">Nie</option>
			<option value="?">Nie mam zdania</option>
		</select>
		<label class="control-label" for="expectationComment">Komentarz</label>
		<textarea type="text" class="form-control" id="expectationComment" name="expectationComment" rows="2" maxlength="256"></textarea>
	</div>
	
	<div class="form-group well well-sm">
		<label class="control-label" for="courseComment">Inne uwagi, komentarze i sugestie dotyczące szkolenia, w którym Pani/Pan uczestniczyła<em style="color:red">*</em></label>
		<textarea type="text" class="form-control" id="courseComment" name="courseComment" rows="2" maxlength="256"></textarea>
	</div>
	
	<div class="form-group well well-sm">
		<label class="control-label" for="courseNotes">Jak ocenia Pani/Pan informacje zawarte w materiałach szkoleniowych?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="courseNotes" name="courseNotes">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Odpowiadają zawartości szkolenia</option>
			<option value="3">Częściowo nie odpowiadają zawartości szkolenia</option>
			<option value="1">Nie odpowiadają zawartości szkolenia</option>
			<option value="">Brak materiałów</option>
		</select>
		<label class="control-label" for="courseNotesComment">Komentarz</label>
		<textarea type="text" class="form-control" id="courseNotesComment" name="courseNotesComment" rows="2" maxlength="256"></textarea>
	</div>
	
	<div class="form-group well well-sm">
		<label class="control-label" for="courseLength">Jak ocenia Pani/Pan długość szkolenia?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="courseLength" name="courseLength">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Odpowiednie do materiału</option>
			<option value="3">Zbyt krótkie</option>
			<option value="1">Zbyt długie</option>
		</select>
		<label class="control-label" for="courseLengthComment">Komentarz</label>
		<textarea type="text" class="form-control" id="courseLengthComment" name="courseLengthComment" rows="2" maxlength="256"></textarea>
	</div>
	
	<div class="form-group well well-sm">
		<label class="control-label" for="organization">Jak ocenia Pani/Pan organizację szkolenia (dostępność niezbędnych informacji, procedura rejestracji, itp.)?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="organization" name="organization">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Dobra</option>
			<option value="3">Przeciętna</option>
			<option value="1">Wystąpiły pewne braki</option>
		</select>
		<label class="control-label" for="organizationComment">Komentarz</label>
		<textarea type="text" class="form-control" id="organizationComment" name="organizationComment" rows="2" maxlength="256"></textarea>
	</div>
	
	<div class="form-group well well-sm">
		<label class="control-label" for="lunch">Jak ocenia Pani/Pan posiłek serwowany w czasie długiej przerwy?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="lunch" name="lunch">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Powyżej oczekiwań</option>
			<option value="3">Zgodny ze standardem</option>
			<option value="1">Poniżej oczekiwań</option>
			<option value="?">Nie mam zdania</option>
		</select>
		<label class="control-label" for="lunchComment">Komentarz</label>
		<textarea type="text" class="form-control" id="lunchComment" name="lunchComment" rows="2" maxlength="256"></textarea>
	</div>
	
	<div class="form-group well well-sm">
		<label class="control-label" for="website">Jak ocenia Pani/Pan informacje dostępne w serwisie internetowym Centrum Szkoleniowego SAS Institute?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="website" name="website">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="5">Wystarczające</option>
			<option value="1">Niewystarczające</option>
			<option value="">Nie korzystałam(em)</option>
		</select>
		<label class="control-label" for="websiteComment">Komentarz</label>
		<textarea type="text" class="form-control" id="websiteComment" name="websiteComment" rows="2" maxlength="256"></textarea>
	</div>
	
	<div class="form-group well well-sm">
		<label class="control-label" for="comment">Inne uwagi, komentarze i sugestie, które chciał(a)by Pani/Pan przekazać do Centrum Szkolenowego SAS Institute<em style="color:red">*</em></label>
		<textarea type="text" class="form-control" id="comment" name="comment" rows="2" maxlength="256"></textarea>
	</div>

	<div class="form-group well well-sm">
		<label class="control-label" for="recommendation">Czy polecił(a)by Pani/Pan to szkolenie innej osobie?<em style="color:red">*</em></label>
		<select class="form-control selectpicker required" id="recommendation" name="recommendation">
			<option value="" disabled selected style="display:none;">Wybierz ...</option>
			<option value="Y">Tak</option>
			<option value="N">Nie</option>
		</select>
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
