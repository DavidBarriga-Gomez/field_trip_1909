class PassengersController < ApplicationController

  def show
    @passenger = Passenger.find(params[:id])
  end

  def update
    @passenger = Passenger.find(params[:id])
    flight_number = params[:flight_number]
    # @passenger.flight_ids.push flight_number
    flight = Flight.find_flight(params[:flight_number])
    # binding.pry
    # PassengerFlight.create(flight_id: @flight_number, passenger_id: @passenger.id)
    redirect_to "/passengers/#{@passenger.id}"
  end

  private
  def passenger_params
    params.permit(:number)
  end
end
