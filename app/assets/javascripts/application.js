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

	$('#boton-buscar').click(function(){
		var frase = $('#frase-buscar').val();
		var ciudad = $('#ciudad-buscar').val();
		var url ='/';
		var delimiters = ['?','&','&'];
		if(frase){
			url = url + delimiters.shift() + 'frase=' + frase; 
		}
		if(ciudad != '*'){
			url = url + delimiters.shift() + 'ciudad=' + ciudad;
		}
		window.location.href = url;
	});

	$('#close-notice').click(function(){
		$('#notice').animate({
			height: 0,
			opacity:0
		},300,function(){
			$('#notice').hide();
		});
	});
});
