class SalaryComJobsController < ApplicationController
  def index
    @salarycomjobs = SalaryComJob.order(:title).where("title like ?", "%#{params[:term]}%")
    render json: @salarycomjobs.map(&:title)
  end
end
