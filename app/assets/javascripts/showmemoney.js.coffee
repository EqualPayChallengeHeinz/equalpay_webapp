currentQuestionIndex = 0
questionList = ["occupation", "gender", "location", "paycheck"]

$ ->
	$('#userform > div').hide()
	$('#occup_link').click ->
		$('#userform > div').hide() 
		$('#occupation').show()
	$('#loc_link').click ->
		$('#userform > div').hide() 
		$('#location').show()
	$('#gend_link').click ->
		$('#userform > div').hide() 
		$('#gender').show()
	$('#paychk_link').click ->
		$('#userform > div').hide() 
		$('#paycheck').show()
	
