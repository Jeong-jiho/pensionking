<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
<!-- <canvas id="myChart" width="200px" height="200px"></canvas> -->
<div class="chart-wrapper">
	<span>9월 매출</span>
	<canvas id="myChart" width="50px" height="50px"></canvas>
</div>

<style type="text/css">
	.chart-wrapper{height:200px; width:900px;} 
</style>
<script type="text/javascript">
$(function(){
	var ctx = document.getElementById("myChart").getContext('2d');
	var myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: [1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30],
	        datasets: [{
	            label: '# of Votes',
	            data: [6,4,5,2,4,3,0,1,3,4,5,2],
	            backgroundColor: [
	            	'rgba(255, 99, 132, 0.2)',
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(255, 99, 132, 0.2)'
	            ],
	            borderColor: [
	            	'rgba(255,99,132,1)',
	                'rgba(255,99,132,1)',
	                'rgba(255,99,132,1)',
	                'rgba(255,99,132,1)',
	                'rgba(255,99,132,1)',
	                'rgba(255,99,132,1)',
	                'rgba(255,99,132,1)',
	                'rgba(255,99,132,1)',
	                'rgba(255,99,132,1)',
	                'rgba(255,99,132,1)',
	                'rgba(255,99,132,1)',
	                'rgba(255,99,132,1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true
	                }
	            }]
	        }
	    }
	});
});
</script>
