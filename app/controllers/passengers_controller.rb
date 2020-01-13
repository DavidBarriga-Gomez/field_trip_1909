class PassengersController < ApplicationController

  def show
    @passenger = Passenger.find(params[:id])
  end

  def update
    @passenger = Passenger.find(params[:id])
    flight_number = params[:flight_number]
    flight = Flight.where(number:[flight_number])
    PassengerFlight.create(flight_id: flight.last.id, passenger_id: @passenger.id)
    redirect_to "/passengers/#{@passenger.id}"
  end

  private
  def passenger_params
    params.permit(:number)
  end
end
