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
//= require js/3-tether.min.js
//= require js/2-bootstrap.min.js
//= require js/4-mdb.pro.min.js

//= require_tree .

$(document).ready(function() {
	$('.wrap-select').wrap('<div class="select_wrapper">');

	$('.mostrar').on('click',function(){
		var aux = $(this).attr('data-div');
		$('.listas').not(aux).hide(100);
		$(aux).toggle(300);
	});	

	$('#close-notice').click(function(){
		$('#notice').animate({
			height: 0,
			opacity:0
		},300,function(){
			$('#notice').hide();
		});
	});


	$('.datepicker.reporte').pickadate({
		monthsFull: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
		monthsShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
	  	weekdaysShort: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
	  	weekdaysFull: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
	  	format: 'd mmmm, yyyy',
		formatSubmit: 'yyyy-mm-dd',
		hiddenName: true,
		min: new Date(2016,1,1),
  		max: true,
  		today: '',
		clear: 'Limpiar selección',
		close: 'Cancelar'
	});
	$(function () {
	    var option = {
	    responsive: true,
	    };
	   	
		var data = {
			labels: $('#ingresos-chart').attr('data-labels').split(','),
		    datasets: [
		        {
		            label: "Ingresos",
		            fillColor: "rgba(220,220,220,0.2)",
		            strokeColor: "rgba(220,220,220,1)",
		            pointColor: "rgba(220,220,220,1)",
		            pointStrokeColor: "#fff",
		            pointHighlightFill: "#fff",
		            pointHighlightStroke: "rgba(220,220,220,1)",
		            data: $('#ingresos-chart').attr('data-values').split(',')
		        }
		    ]
		};

	    // Get the context of the canvas element we want to select
	    var ctx = document.getElementById("ingresos-chart").getContext('2d');
	    var myLineChart = new Chart(ctx).Line(data, option); //'Line' defines type of the chart.
	});

});
