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
	$('.datepicker.postulacion').pickadate({
		monthsFull: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
		monthsShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
	  	weekdaysShort: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
	  	weekdaysFull: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
	  	format: 'd mmmm, yyyy',
		formatSubmit: 'yyyy-mm-dd',
		hiddenName: true,
		min: true,
  		max: 365*2,
  		today: '',
		clear: 'Limpiar selección',
		close: 'Cancelar'
	});
	$(function () {

		if($('#line-chart').length){

			var data_line = {
				labels: $('#line-chart').attr('data-labels').split(','),
			    datasets: [
			        {
			            label: $('#line-chart').attr('data-title'),
			            fillColor: "rgba(220,220,220,0.2)",
			            strokeColor: "rgba(220,220,220,1)",
			            pointColor: "rgba(220,220,220,1)",
			            pointStrokeColor: "#fff",
			            pointHighlightFill: "#fff",
			            pointHighlightStroke: "rgba(220,220,220,1)",
			            data: $('#line-chart').attr('data-values').split(',')
			        }
			    ]
			};
		    // Get the context of the canvas element we want to select
		    var ctx = document.getElementById("line-chart").getContext('2d');
		    var myLineChart = new Chart(ctx).Line(data_line,{responsive: true}); //'Line' defines type of the chart.
		}
		if($('#pie-chart').length){
			var data_pie = [
			    {
			        value: $('#pie-chart').attr('data-no-concretada'),
			        color:"#F7464A",
			        highlight: "#FF5A5E",
			        label: "No concretada"
			    },
			    {
			        value: $('#pie-chart').attr('data-concretada'),
			        color: "#46BFBD",
			        highlight: "#5AD3D1",
			        label: "Concretada"
			    },
			    {
			        value: $('#pie-chart').attr('data-en-curso'),
			        color: "#FDB45C",
			        highlight: "#FFC870",
			        label: "En Curso"
			    }
			];
		    var ctx2 = document.getElementById("pie-chart").getContext('2d');
			var myDoughnutChart = new Chart(ctx2).Doughnut(data_pie,{responsive: true});

		}

		if($('#radar-chart').length){
			var data_radar = {
			    labels: ["0", "1", "2", "3", "4", "5", "+5"],
			    datasets: [
			        {
			            label: "Postulaciones por gauchada",
			            fillColor: "rgba(220,220,220,0.2)",
			            strokeColor: "rgba(220,220,220,1)",
			            pointColor: "rgba(220,220,220,1)",
			            pointStrokeColor: "#fff",
			            pointHighlightFill: "#fff",
			            pointHighlightStroke: "rgba(220,220,220,1)",
			            data: $('#radar-chart').attr('data-postulantes').split(',')
			        }
			    ]
			};
			var ctx3 = document.getElementById("radar-chart").getContext('2d');
			var myRadarChart = new Chart(ctx3).Radar(data_radar, {responsive: true});

		}

	});

});
