class MechanicRidesController < ApplicationController
  def create
    mechanic = Mechanic.find(params[:mechanic_id])
    if params[:ride_id].empty?
      flash[:errors] = "Must enter valid ride id!!"
      redirect_to "/mechanics/#{params[:mechanic_id]}"
    else
      ride = Ride.find(params[:ride_id])
      mechanic.add_ride(ride)
      redirect_to "/mechanics/#{params[:mechanic_id]}"
    end
  end
end
