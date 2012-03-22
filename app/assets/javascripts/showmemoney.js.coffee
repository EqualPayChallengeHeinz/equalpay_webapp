currentQuestionIndex = 0
questionList = ["occupation", "gender", "location", "paycheck"]
@testBarChart
@testAreaChart
 


$ ->
	$('#OccupationList').change (e) -> alert e.currentTarget
		
	$('#userform > div').hide()
	$('#occup_link').click ->
		initCurrentMenuItem('#occup_link')		
		$('#occupation').show()
	$('#occup_link').hover ->
		initCurrentMenuItem('#occup_link')
		$('#occupation').show()
	$('#loc_link').click ->
		initCurrentMenuItem('#loc_link')
		$('#location').show()
	
	$('#loc_link').hover ->
		initCurrentMenuItem('#loc_link')
		$('#location').show()
	$('#gend_link').click ->
		initCurrentMenuItem('#gend_link')
		$('#gender').show()

	$('#gend_link').hover ->
		initCurrentMenuItem('#gend_link')
		$('#gender').show()

	$('#gend_link').hover ->
		initCurrentMenuItem('#gend_link')
		$('#gender').show()

		
	$('#paychk_link').click ->
		initCurrentMenuItem('#paychk_link')
		$('#paycheck').show()

	$('#paychk_link').hover ->
		initCurrentMenuItem('#paychk_link')
		$('#paycheck').show()
	$('#nextlink1').click ->
		$('#loc_link').trigger('click')
	$('#nextlink2').click ->
		$('#gend_link').trigger('click')
	$('#nextlink3').click ->
		$('#paychk_link').trigger('click')
		
	$('#jobtitle').autocomplete
		source: '/SalaryComJobs'
		
	$('#showmemoney').click ->
		$('#userform > div').hide()
		$('#chartscontainer').show()
		$('#chartscontainer2').show()
		
	
	testBarChart =  new Highcharts.Chart {
	         chart: 
	            renderTo: 'chartscontainer',
	            type: 'bar'
	         
	         title: 
	            text: 'Wage Gap'
	
	         subtitle:
	            text: 'Source Salary.com, Bureau of Labor Statistics'
	         
	         xAxis:
	            categories: ['Wages']
	         
	         yAxis:
	            title: 
	               text: 'Average Annual Earnings' 
	            labels:
	               formatter: ->
	                     return "$" + this.value + "K"
	         
	         series:[{name: 'Men', data:[$('#mydatadiv').data('chartdata').Men] },
	             {name:'Women', data:[$('#mydatadiv').data('chartdata').Women]}]
		    }
		
			testAreaChart =  new Highcharts.Chart {
			         chart: 
			            renderTo: 'chartscontainer2',
			            type: 'areaspline'

			         title: 
			            text: 'Wage Gap Trend'

			         subtitle:
			            text: 'Source Salary.com, Bureau of Labor Statistics'

			         xAxis:
			            categories: [2012, 2022, 2032, 2042, 2052]

			         yAxis:
			            title: 
			               text: 'Average Annual Earnings' 
			            labels:
			               formatter: ->
			                     return "$" + this.value + "K"  
			         plotOptions:
			            areaspline:
			               fillOpacity: 0.5
			         series:[{name: 'Men', data:[100,150, 190, 200, 250] },
			             {name:'Women', data:[80, 120, 140, 155, 175]}]

				    }
	
	
		
	
		
	
	      
	
	
	

initCurrentMenuItem= (currentLink) -> 
	$('#userform > div').hide()
	$('#verticalnavbar > ul > li').removeClass('currentMenuItem')
	$(currentLink).parent().addClass('currentMenuItem')



