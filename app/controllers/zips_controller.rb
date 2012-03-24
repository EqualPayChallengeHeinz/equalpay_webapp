class ZipsController < ApplicationController
  # GET /zips
  # GET /zips.json
  def index
    @zips = Zip.order(:locationtext).where("zipcode like ? OR locationtext like ?", "#{params[:term]}%", "%#{params[:term]}%").limit(15)
    render json: @zips.map{|z| {label: z.locationtext + ' - ' + z.zipcode, value: z.zipcode}}

    
  end

 
end
