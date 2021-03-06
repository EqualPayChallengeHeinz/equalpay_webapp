class SalaryComJobsController < ApplicationController
  def index
    @salarycomjobs = SalaryComJob.order(:title).where("title like ?", "%#{params[:term]}%").limit(15).uniq()
    render json: @salarycomjobs.map{|job| {label: job.title, value: job.code}}
  end
end
