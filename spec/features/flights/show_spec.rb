require 'rails_helper'

RSpec.describe 'As A Visitor', type: :feature do
  before(:each) do
    @airline_1 = Airline.create!(name: 'airline_1')

    @flight_1 = @airline_1.flights.create!(number: '1', date: 'today', time: 'right now', departure_city: 'denver', arrival_city: 'los angeles')

    @david = Passenger.create!(name: 'David', age: 26)
    @scott = Passenger.create!(name: 'Scott', age: 27)

    @foxy = Passenger.create!(name: 'Foxy', age: 6)
    @goblin = Passenger.create!(name: 'Goblin', age: 7)
    @bear = Passenger.create!(name: 'Bear', age: 8)

    passenger_flight_1 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @david.id)
    passenger_flight_2 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @scott.id)
    passenger_flight_3 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @foxy.id)
    passenger_flight_4 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @goblin.id)
    passenger_flight_5 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @beare.id)
  end

  it 'Visit a show page /flights/:id I see all flight information, airline name and passenger names' do
    visit("/flights/#{@flight_1.id}")

    expect(page).to have_content(@flight_1.number)
    expect(page).to have_content(@flight_1.date)
    expect(page).to have_content(@flight_1.time)
    expect(page).to have_content(@flight_1.departure_city)
    expect(page).to have_content(@flight_1.arrival_city)
    expect(page).to have_content(@airline_1.name)
    expect(page).to have_content(@david.name)
    expect(page).to have_content(@scott.name)
    expect(page).to have_content(@foxy.name)
    expect(page).to have_content(@bear.name)
    expect(page).to have_content(@goblin.name)
  end
end
