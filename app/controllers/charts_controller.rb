class ChartsController < ApplicationController
  def index
    chartdata = [100]
    render json: chartdata
  end


  def getwagedata
  	data = {:Men => Random.rand(200), :Women => Random.rand(200) }
  	render json: data
  end

end
