require 'rails_helper'

RSpec.describe 'As A Visitor', type: :feature do
  before(:each) do
    @airline_1 = Airline.create!(name: 'airline_1')

    @flight_1 = @airline_1.flights.create!(number: '1', date: 'today', time: 'right now', departure_city: 'denver', arrival_city: 'los angeles')
    @flight_2 = @airline_1.flights.create!(number: '2', date: 'today', time: 'right now', departure_city: 'denver', arrival_city: 'los angeles')
    @flight_3 = @airline_1.flights.create!(number: '3', date: 'today', time: 'right now', departure_city: 'denver', arrival_city: 'los angeles')
    @flight_57 = @airline_1.flights.create!(number: '57', date: 'today', time: 'right now', departure_city: 'denver', arrival_city: 'los angeles')
    # binding.pry

    @david = Passenger.create!(name: 'David', age: 26)
    @scott = Passenger.create!(name: 'Scott', age: 27)

    @foxy = Passenger.create!(name: 'Foxy', age: 6)
    @goblin = Passenger.create!(name: 'Goblin', age: 7)
    @bear = Passenger.create!(name: 'Bear', age: 8)

    passenger_flight_1 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @david.id)
    passenger_flight_1 = PassengerFlight.create!(flight_id: @flight_2.id, passenger_id: @david.id)
    passenger_flight_1 = PassengerFlight.create!(flight_id: @flight_3.id, passenger_id: @david.id)

    passenger_flight_2 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @scott.id)
    passenger_flight_3 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @foxy.id)
    passenger_flight_4 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @goblin.id)
    passenger_flight_5 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @bear.id)
  end

  it 'When I visit a passenger show page /passengers/:id I see the passengers name, all flight numbers for that passenger and those numbers are links' do
    visit("/passengers/#{@david.id}")

    expect(page).to have_content(@david.name)
    expect(page).to have_link(@flight_1.number)
    expect(page).to have_link(@flight_2.number)
    expect(page).to have_link(@flight_3.number)
    click_on(@flight_1.number)
    expect(current_path).to eq("/flights/#{@flight_1.id}")
  end

  it 'Cann add a flight on a passengers show page' do
    visit("/passengers/#{@david.id}")
    fill_in :flight_number, with: '57'
    click_on('Submit')
    expect(current_path).to eq("/passengers/#{@david.id}")
    expect(page).to have_content('57')
  end
end
#   User Story 3, Assign a Passenger to a Flight
# As a visitor
# When I visit a passengers show page
# I see a form to add a flight
# When I fill in the form with a flight number (assuming these will always be unique)
# And click submit
# I'm taken back to the passengers show page
# And I can see the flight number of the flight I just added
