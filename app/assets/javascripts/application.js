// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// require jquery
//= require js/1-jquery-2.2.3.min.js
//= require jquery_ujs
//= require turbolinks
//= require js/2-bootstrap.min.js
//= require js/3-tether.min.js
//= require js/4-mdb.pro.min.js

//= require_tree .

$(document).ready(function() {
	$('.wrap-select').wrap('<div class="select_wrapper">');

	$('#close-notice').click(function(){
		$('#notice').animate({
			height: 0,
			opacity:0
		},300,function(){
			$('#notice').hide();
		});
	});

	// $('.file-path').change(function(){
		
 //    	var allowed = ['','GIF','PNG','JPG','BMP'];

 //    	if(allowed.indexOf( $(this).val().split('.').pop().toUpperCase() ) < 0){
 //    		alert('Debe subir un archivo de tipo imagen');
 //    		$('button[type="submit"]').prop( "disabled", true );
 //    	}else{
 //    		$('button[type="submit"]').prop( "disabled", false );
 //    	}

	// });
	// $('.datepicker').pickadate({
	// 	monthsFull: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
	// 	monthsShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
	//   	weekdaysShort: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
	//   	weekdaysFull: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
	//   	format: 'd mmmm, yyyy',
	// 	formatSubmit: 'yyyy-mm-dd',
	// 	hiddenPrefix: undefined,
	// 	min: new Date(1920,1,1),
 //  		max: -18*365,
 //  		today: '',
	// 	clear: 'Limpiar selección',
	// 	close: 'Cancelar'

	// });
});
