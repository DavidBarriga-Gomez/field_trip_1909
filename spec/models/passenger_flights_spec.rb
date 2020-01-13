require 'rails_helper'

RSpec.describe PassengerFlight, type: :model do
  describe 'validations' do
    it { should validate_presence_of :flight_id}
    it { should validate_presence_of :passenger_id}
  end

  describe 'relationships' do
    it { should belong_to :flight}
    it { should belong_to :passenger}
  end
end









# \require 'rails_helper'
#
# describe ItemOrder, type: :model do
#   describe "validations" do
#     it { should validate_presence_of :order_id }
#     it { should validate_presence_of :item_id }
#     it { should validate_presence_of :price }
#     it { should validate_presence_of :quantity }
#     it { should validate_presence_of :status}
#   end
#
#   describe "relationships" do
#     it {should belong_to :item}
#     it {should belong_to :order}
#   end
