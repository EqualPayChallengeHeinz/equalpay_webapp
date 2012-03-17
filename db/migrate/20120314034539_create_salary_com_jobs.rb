class CreateSalaryComJobs < ActiveRecord::Migration
  def change
    create_table :salary_com_jobs do |t|
      t.string :title
      t.string :code
      t.string :bls_job_code
      t.timestamps
    end
  end
end
