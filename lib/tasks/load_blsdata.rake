
#fill in rest
require 'csv'

namespace :load_blsdata do
  task :doitnow => :environment do
    CSV.foreach('bls_jobs_database.csv') { |row| Blsjob.create!(:bls_job_code => row[0], :occupation1 => row[1], :occupation2 => row[2], :occupation3 => row[3], :occupation4 => row[4], :workers_all => row[5], :earnings_all => row[6], :workers_men => row[7], :earnings_men => row[8], :workers_women => row[9], :earnings_women => row[10]) }
  end
end

