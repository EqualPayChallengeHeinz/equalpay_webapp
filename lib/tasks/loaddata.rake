
#fill in rest

require 'faster_csv'

namespace :loaddata do
  task :bls => :environment do
    #CSV.foreach('bls_jobs_database.csv') { |row| Blsjob.create!(:bls_job_code => row[0], :occupation1 => row[1], :occupation2 => row[2], :occupation3 => row[3], :occupation4 => row[4], :workers_all => row[5], :earnings_all => row[6], :workers_men => row[7], :earnings_men => row[8], :workers_women => row[9], :earnings_women => row[10]) }
    FasterCSV.foreach('bls_jobs_database.csv', :quote_char => '"', :col_sep =>',', :row_sep =>:auto) { |row| Blsjob.create!(:bls_job_code => row[0], :occupation1 => row[1], :occupation2 => row[2], :occupation3 => row[3], :occupation4 => row[4], :workers_all => row[5], :earnings_all => row[6], :workers_men => row[7], :earnings_men => row[8], :workers_women => row[9], :earnings_women => row[10]) }
  end

  task :salary => :environment do
    FasterCSV.foreach('salary_jobs_database.csv', :quote_char => '"', :col_sep =>',', :row_sep =>:auto) { |row| SalaryComJob.create!(:title => row[0], :code => row[1], :bls_job_code => row[2] ) }
  end
  
  task :zip => :environment do
    FasterCSV.foreach('zipcode_database.csv', :quote_char => '"', :col_sep =>',', :row_sep =>:auto) { |row| Zip.create!(:zipcode => row[0], :city => row[1], :state => row[2], :locationtext => row[3] ) }
  end
end

