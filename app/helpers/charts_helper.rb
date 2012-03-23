module ChartsHelper
  def chart_wagegap
    data = {:Men => Random.rand(200), :Women => Random.rand(200) }
  end

  private 
  
  def getwagegap
  	# This is a Ruby program that shows the computations required by the
	# Pay Gap Application.
	# This program was based on conversations with Professor Linda Babcock.
	# At the bottom of this program is the email message from Professor 
	# Babcock.

	# Some variable values are got from the US Bureau of Labor Statistics 
	# (BLS)
	# and others are retrieved from Salary.com.
	# In this program, all variables got from BLS are prefixed with bls. Those
	# retrieved from salary.com are prefixed with sc. Those values that are 
	# computed
	# have no prefix.
	# The constant values in this code are simply for testing.

	# From BLS we need the following values:
	bls_nf   =  100     # number of females
	bls_nm = 120     # number of male workers
	bls_wf  = 1000   # wage of women (median salary)
	bls_wm = 1200 # wage of men (median salary)

	# compute percent female
	pf = bls_nf.to_f / (bls_nm+bls_nf).to_f

	# compute the gap
	g = bls_wf.to_f / bls_wm.to_f
	# From Salary.com we have the median wage
	sc_w = 1100

	# we want to estimate the wage for females and wage for male
	wm = sc_w.to_f / (pf * g + 1 - pf).to_f
	wf   = g.to_f * wm.to_f
	  	
	end
end
