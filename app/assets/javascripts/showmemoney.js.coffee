currentQuestionIndex = 0
questionList = ["occupation", "gender", "location", "paycheck"]

 


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
	
	
	

initCurrentMenuItem= (currentLink) -> 
	$('#userform > div').hide()
	$('#verticalnavbar > ul > li').removeClass('currentMenuItem')
	$(currentLink).parent().addClass('currentMenuItem')



