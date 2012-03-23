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
		
	$('#salarycomjob_jobtitle').autocomplete
		source: '/SalaryComJobs'
		select: (event, ui) ->
			this.value = ui.item.label
			$('#jobcode').val(ui.item.value)
			return false
	
		
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
	            categories: [0,5, 10, 15, 20, 25]

	         yAxis:
	            title: 
	               text: 'Average Annual Earnings' 
	            labels:
	               formatter: ->
	                     return "$" + this.value + "K"  
	         plotOptions:
	            areaspline:
	               fillOpacity: 0.5
	         series:[{name: 'Men', data:[120, 138.4388936299378, 159.71106057901034, 184.25185439185137, 212.56352392726922, 245.22549232143305] },
	             {name:'Women', data:[100, 115.36574469161485, 133.0925504825086, 153.5432119932095, 177.136269939391, 204.35457693452753]}]

		    }
		
	
		
	
		
	
	      
	
	
	

initCurrentMenuItem= (currentLink) -> 
	$('#userform > div').hide()
	$('#verticalnavbar > ul > li').removeClass('currentMenuItem')
	$(currentLink).parent().addClass('currentMenuItem')



