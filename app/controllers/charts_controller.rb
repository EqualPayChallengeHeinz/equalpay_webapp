class ChartsController < ApplicationController
  def index
    chartdata = [100]
    render json: chartdata
  end
end
