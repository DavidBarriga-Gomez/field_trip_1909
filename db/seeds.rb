# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Airline.destroy_all
Flight.destroy_all
Passenger.destroy_all
PassengerFlight.destroy_all

@airline_1 = Airline.create!(name: 'airline_1')

@flight_1 = @airline_1.flights.create!(number: '1', date: 'today', time: 'right now', departure_city: 'denver', arrival_city: 'los angeles')
@flight_2 = @airline_1.flights.create!(number: '2', date: 'today', time: 'right now', departure_city: 'denver', arrival_city: 'los angeles')
@flight_3 = @airline_1.flights.create!(number: '3', date: 'today', time: 'right now', departure_city: 'denver', arrival_city: 'los angeles')

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
