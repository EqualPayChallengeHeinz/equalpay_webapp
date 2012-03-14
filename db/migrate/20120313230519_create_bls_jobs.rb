class CreateBlsJobs < ActiveRecord::Migration
  def up
    create_table 'blsjobs' do |t|
      t.string 'bls_job_code'
      t.string 'occupation1'
      t.string 'occupation2'
      t.string 'occupation3'
      t.string 'occupation4'
      t.integer 'workers_all'
      t.integer 'earnings_all'
      t.integer 'workers_men'
      t.integer 'earnings_men'
      t.integer 'workers_women'
      t.integer 'earnings_women'
    end
  end

  def down
    drop_table 'blsjobs'
  end
end
