require 'net/http'
require 'rexml/document'
require 'digest/sha1'

class PagesController < ApplicationController
	include ChartsHelper
  def home
    # @title = "home"
  end
  
  def showmemoney

	  if not params[:jobcode].nil?
	  	
	  	salarycomjob = SalaryComJob.where(:code => params[:jobcode]).limit(1)

	  	if salarycomjob.count > 0

	  		blsjob = Blsjob.where(:bls_job_code => salarycomjob.first.bls_job_code).limit(1)

		  	bls_nf   = blsjob.first.workers_women     # number of females
			bls_nm = blsjob.first.workers_men     # number of male workers
			bls_wf  = blsjob.first.earnings_women   # wage of women (median salary)
			bls_wm = blsjob.first.earnings_men # wage of men (median salary)

			# compute percent female
			pf = bls_nf.to_f / (bls_nm+bls_nf).to_f

			# compute the gap
			g = bls_wf.to_f / bls_wm.to_f
			
			paychktype = params[:paychk_radio].to_f
			# From Salary.com we have the median wage
			sc_w = 1100   # getsalarywebservicedata(salarycomjob.first.code)

			# we want to estimate the wage for females and wage for male
			
			wm = (sc_w.to_f / (pf * g + 1 - pf).to_f)
			wf   = (g.to_f * wm.to_f)
			
			wm = (wm * paychktype).round(2)
			wf = (wf * paychktype).round(2)

			years = [0,5,10,15,20,25,30]
			inflation = 0.03
			

			@highchartdata = {:Men => wm, :Women => wf }
	  		@wagegaptrend = {:Men => years.map {|y| (wm*(1 + inflation)**y).round(2)}, :Women => years.map {|y| ( wf*(1 + inflation)**y).round(2)} }
	  	end
	  	

	  end
  	
  end

  private

  def getsalarywebservicedata(jobcode)
  	# Compute UTC Time

  	debugger
       t = Time.now.utc
       
       mon = t.month
       dd = t.day
       yyyy = t.year
       hh = t.hour
       min = t.min
       sec = t.sec

       # Build a time stamp
        utctimeStamp = mon.to_s+'%2F'+dd.to_s+'%2F'+yyyy.to_s+'+'+hh.to_s+'%3A'+min.to_s + '%3A'+ sec.to_s + t.strftime("%p")
       # they may want +PM or +AM at the end of the timestamp?
       

       # Use security key provided
       securityKey = 'SalaryHR'

       # Use an exmple job code
       jobCode = 'CM02000003'    #Job Code of senior technical writer

       # use a Pittsburgh zip code
       zip = '15216'     #complete with 5 digit postal code

       # Use provided partner code
       partnerCode = 'EQUIPAY4094055567106'   #API-Key or partner code
       

       # build a hash code

       # create string to be hashed
       stringToBeHashed = securityKey+'-'+partnerCode+'-'+utctimeStamp

       stringToBeHashed.strip!

       
       #convert to UTF-8

       stringToBeHashed.force_encoding("UTF-8")
       stringToBeHashed = stringToBeHashed.encode("UTF-8")

       #compute hash using SHA1
       hashCode = Digest::SHA1.new << stringToBeHashed

       # Build URL
       mainURL =
       'http://api.salary.com/salarywizard/layoutscripts/Compdata.asp?'
       jobCodeURL = 'jobcode='+jobCode
       zipCodeURL = '&zip=' + zip
       partnerCodeURL = '&partnercode=' + partnerCode
       utctimestampurl = '&utctime=' + utctimeStamp
       hashKeyURL = '&hashkey=' + hashCode.to_s.upcase
       url = mainURL+jobCodeURL+ zipCodeURL+ partnerCodeURL+ utctimestampurl+hashKeyURL
       

       # get the XML data as a string
       xml_data = Net::HTTP.get_response(URI.parse(url)).body
       mediansalary = xml_data['BenefitBaseSalary50th_M']
  end
  
end
