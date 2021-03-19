<div class="col-md-12">
	<div class="well">
		<h2>Najbliższe szkolenia</h2>
		
		<div class="form-group">
			<iframe src="/doc/sas_ihub_kalendarz.pdf" width="600px" height="455px">
			</iframe>
		</div>
	</div>
	<div class="well">
		<h2>Kalendarz szkoleń (grafik) - test</h2>	
		<div class="form-group">
			<label class="control-label" for="calendar_date">Data</label>
			<div class="input-group" id="calendar_date" data-date-format="DDMMMYYYY">
				<input type="text" class="form-control" placeholder="Wybierz datę...">
				<span class="input-group-addon"><span class="glyphicon-calendar glyphicon"></span>
				</span>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label" for="calendar_format">Format</label>
			<div class="input-group" id="calendar_format">
				<label class="radio-inline">
					<input type="radio" name="calendar_format" id="calendar_format_pdf" value="PDF" checked> PDF
				</label>
				<label class="radio-inline">
					<input type="radio" name="calendar_format" id="calendar_format_rtf" value="RTF"> RTF
				</label>
			</div>
		</div>
		<div class="form-group">
			<div class="btn-group btn-group-justified">
				<div class="btn-group">
					<button type="button" class="btn btn-default" onclick="calendar_weekly()">
						<span class="glyphicon glyphicon-file"></span> Tygodniowy 
					</button>
				</div>
			</div>
		</div>
	</div>
	<div class="well">
		<h2>Zaproszenia na szkolenia</h2>
		<label class="control-label" for="invitation_format">Format</label>
		<div class="input-group" id="invitation_format">
			<label class="radio-inline">
				<input type="radio" name="invitation_format" id="invitation_LV" value="LW" checked> Live Web
			</label>
			<label class="radio-inline">
				<input type="radio" name="invitation_format" id="invitation_classroom" value="CLASSROOM"> Stacjonarne
			</label>
			<p></p>
		</br>
		</div>
		<div class="form-group">
			<label class="control-label" for="invitation_date">Data szkolenia</label>
			<div class="input-group" id="invitation_date" data-date-format="DDMMMYYYY">
				<input type="text" class="form-control" placeholder="Wybierz datę szkolenia...">
				<span class="input-group-addon"><span class="glyphicon-calendar glyphicon"></span>
				</span>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label" for="invitation_code">Kod szkolenia</label>
			<div class="input-group col-sm-12" id="invitation_code">
				<input type="text" class="form-control" placeholder="Wpisz kod szkolenia...">
			</div>
			<p class="help-block">Dozwolone użycie znaków _ oraz %</p>
		</div>
		<div class="form-group">
			<label class="control-label" for="activation_code">Kod aktywacyjny do materiałów szkoleniowych</label>
			<div class="input-group col-sm-12" id="activation_code">
				<input type="text" class="form-control" placeholder="Wpisz kod aktywacyjny do materiałów...">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label" for="zoom_address">Link do Zomma lub Webexa (jeśli inny niż z GLWC)</label>
			<div class="input-group col-sm-12" id="zoom_address">
				<input type="text" class="form-control" placeholder="Wpisz link do Zoom'a jeśli szkolenie zdalne...">
			</div>
		</div>
		<div class="btn-group btn-group-justified">
			<div class="btn-group">
				<button type="button" class="btn btn-default" id="invitation_preview">
					<span class="glyphicon glyphicon-eye-open"></span> Podgląd 
				</button>
			</div>
		</div>
	</div>
	<div class="well">
		<h2>Rozesłanie namiarów na obrazy szkoleniowe</h2>
		<div class="form-group">
			<label class="control-label" for="invitation_VM_date">Data szkolenia</label>
			<div class="input-group" id="invitation_VM_date" data-date-format="DDMMMYYYY">
				<input type="text" class="form-control" placeholder="Wybierz datę szkolenia...">
				<span class="input-group-addon"><span class="glyphicon-calendar glyphicon"></span>
				</span>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label" for="invitation_VM_code">Kod szkolenia (pole obowiązkowe)</label>
			<div class="input-group col-sm-12" id="invitation_VM_code">
				<input type="text" class="form-control" placeholder="Wpisz kod szkolenia...">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label" for="activation_VM_code">Kod aktywacyjny do materiałów szkoleniowych</label>
			<div class="input-group col-sm-12" id="activation_VM_code">
				<input type="text" class="form-control" placeholder="Wpisz kod aktywacyjny do materiałów...">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label" for="zoom_VM_address">Link do Webexa (jeśli inny niż z GLWC)</label>
			<div class="input-group col-sm-12" id="zoom_VM_address">
				<input type="text" class="form-control" placeholder="Wpisz link do Webexa jeśli niestandardowy. Pozostaw puste jeśli link taki jak w GLWC">
			</div>
		</div>
		<div class="btn-group btn-group-justified">
			<div class="btn-group">
				<button type="button" class="btn btn-default" onclick="invitation_VM_list_send();">
					<span class="glyphicon glyphicon-envelope"></span> Wyślij do uczestników
				</button>
			</div>
		</div>
	</div>
	<div class="well">
		<h2>Generowanie linku do ankiety</h2>
		<div class="form-group">
			<label class="control-label" for="survey_date">Data zakończenia szkolenia</label>
			<div class="input-group" id="survey_date" data-date-format="DDMMMYYYY">
				<input type="text" class="form-control" placeholder="Wybierz datę szkolenia...">
				<span class="input-group-addon"><span class="glyphicon-calendar glyphicon"></span>
				</span>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label" for="survey_code">Kod szkolenia</label>
			<div class="input-group col-sm-12" id="survey_code">
				<input type="text" class="form-control" placeholder="Wpisz kod szkolenia...">
			</div>
			<p class="help-block">Dozwolone użycie znaków _ oraz %</p>
		</div>
		<div class="btn-group btn-group-justified">
			<div class="btn-group">
				<button type="button" class="btn btn-default"  onclick="survey_link();">
					<span class="glyphicon glyphicon-file"></span> Wyświetl linki do ankiet
				</button>
			</div>
		</div>
	</div>
	<div class="well">
		<h2>E-Certyfikaty</h2>
		<div class="form-group">
			<label class="control-label" for="e_certificate_date">Data zakończenia szkolenia</label>
			<div class="input-group" id="e_certificate_date" data-date-format="DDMMMYYYY">
				<input type="text" class="form-control" placeholder="Wybierz datę szkolenia...">
				<span class="input-group-addon"><span class="glyphicon-calendar glyphicon"></span>
				</span>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label" for="e_certificate_code">Kod szkolenia</label>
			<div class="input-group col-sm-12" id="e_certificate_code">
				<input type="text" class="form-control" placeholder="Wpisz kod szkolenia...">
			</div>
			<p class="help-block">Dozwolone użycie znaków _ oraz %</p>
		</div>
		<div class="form-group">
			<label class="control-label" for="e_certificate_location">Lokalizacja szkolenia</label>
			<div class="input-group col-sm-12" id="e_certificate_location">
				<input type="text" class="form-control" value="Live Web, SAS Institute">
			</div>
		</div>
		<div class="btn-group btn-group-justified">
			<div class="btn-group">
				<button type="button" class="btn btn-default"  onclick="e_certificate();">
					<span class="glyphicon glyphicon-file"></span> Generuj PDF (podgląd certyfikatów)
				</button>
			</div>
			<div class="btn-group">
				<button type="button" class="btn btn-default" onclick="e_certificate_send();">
					<span class="glyphicon glyphicon-envelope"></span> Wyślij do uczestników
				</button>
			</div>
		</div>
	</div>
	<div class="well">
		<h2>Amerykańskie certyfikaty (test - nie działa dla polskich znaków)</h2>
		<div class="form-group">
			<label class="control-label" for="us_certificate_date">Data zakończenia szkolenia</label>
			<div class="input-group" id="us_certificate_date" data-date-format="DDMMMYYYY">
				<input type="text" class="form-control" placeholder="Wybierz datę szkolenia...">
				<span class="input-group-addon"><span class="glyphicon-calendar glyphicon"></span>
				</span>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label" for="us_certificate_code">Kod szkolenia</label>
			<div class="input-group col-sm-12" id="us_certificate_code">
				<input type="text" class="form-control" placeholder="Wpisz kod szkolenia...">
			</div>
			<p class="help-block">Dozwolone użycie znaków _ oraz %</p>
		</div>
		<div class="btn-group btn-group-justified">
			<div class="btn-group">
				<button type="button" class="btn btn-default"  onclick="us_certificate();">
					<span class="glyphicon glyphicon-file"></span> Podgląd certyfikatów
				</button>
			</div>
			<div class="btn-group">
				<button type="button" class="btn btn-default" onclick="us_certificate_send();">
					<span class="glyphicon glyphicon-envelope"></span> Wyślij do uczestników
				</button>
			</div>
		</div>
	</div>
	<div class="well">
		<h2>Lista obecności</h2>	
		<div class="form-group">
			<label class="control-label" for="attendance_list_date">Data szkolenia</label>
			<div class="input-group" id="attendance_list_date" data-date-format="DDMMMYYYY">
				<input type="text" class="form-control" placeholder="Wybierz datę szkolenia...">
				<span class="input-group-addon"><span class="glyphicon-calendar glyphicon"></span>
				</span>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label" for="attendance_list_code">Kod szkolenia</label>
			<div class="input-group col-sm-12" id="attendance_list_code">
				<input type="text" class="form-control" placeholder="Wpisz kod szkolenia...">
			</div>
			<p class="help-block">Dozwolone użycie znaków _ oraz %</p>
		</div>
		<div class="btn-group btn-group-justified">
			<div class="btn-group">
				<button type="button" class="btn btn-default" onclick="attendance_list();">
					<span class="glyphicon glyphicon-file"></span> Generuj 
				</button>
			</div>
		</div>
	</div>
	<div class="well">
		<h2>Kontakty (test)</h2>
		<p>Program umożliwia zapis kontaktów pracowników SAS do pliku CSV, który można zaimportować na telefon komórkowy.</p>
		<div class="btn-group btn-group-justified">
			<div class="btn-group" id="contact_refresh">
				<button type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-refresh"></span> Odśwież
				</button>
			</div>
			<div class="btn-group" id="contact_download" style="display: none;">
				<button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
					<span class="glyphicon glyphicon-file"></span> Pobierz <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
					<li><a href="#" onclick="contact_download('ANDROID')">Android</a></li>
					<li><a href="#" onclick="contact_download('SYMBIAN')">Symbian</a></li>
					<li><a href="#" onclick="contact_download('WP')">Windows Phone</a></li>
					<li><a href="#" onclick="contact_download('VCARD')">VCARD 2.1</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>