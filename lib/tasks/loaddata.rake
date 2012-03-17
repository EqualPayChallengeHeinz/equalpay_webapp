
#fill in rest
require 'csv'

namespace :loaddata do
  task :bls => :environment do
    CSV.foreach('bls_jobs_database.csv') { |row| Blsjob.create!(:bls_job_code => row[0], :occupation1 => row[1], :occupation2 => row[2], :occupation3 => row[3], :occupation4 => row[4], :workers_all => row[5], :earnings_all => row[6], :workers_men => row[7], :earnings_men => row[8], :workers_women => row[9], :earnings_women => row[10]) }
  end

  task :salary => :environment do
    CSV.foreach('salary_jobs_database.csv') { |row| SalaryComJob.create!(:title => row[0], :code => row[1], :bls_job_code => row[2] ) }
  end
end

