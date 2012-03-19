currentQuestionIndex = 0
questionList = ["occupation", "gender", "location", "paycheck"]
@testBarChart
@testPieChart
 


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
		
	
	testBarChart =  new Highcharts.Chart {
	         chart: 
	            renderTo: 'chartscontainer',
	            type: 'bar'
	         
	         title: 
	            text: 'Wage Gap'
	         
	         xAxis:
	            categories: ['Wages']
	         
	         yAxis:
	            title: 
	               text: 'Average Annual Earnings'   
	         
	         series: [{name: 'Men', data: [100]}, {name: 'Women', data: [80]}]
		}
	
	
		
	
		
	
	      
	
	
	

initCurrentMenuItem= (currentLink) -> 
	$('#userform > div').hide()
	$('#verticalnavbar > ul > li').removeClass('currentMenuItem')
	$(currentLink).parent().addClass('currentMenuItem')



