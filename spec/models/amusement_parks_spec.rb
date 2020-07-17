require 'rails_helper'

RSpec.describe AmusementPark do
  describe 'relationships' do
    it {should have_many :rides}
  end

  describe 'methods' do
    before :each do
      @amusement_park = AmusementPark.create!(name: "Elich Gardens", admission_price: 45)
      @tower_of_doom = @amusement_park.rides.create!(name: "Tower of Doom", thrill_rating: 8)
      @brain_drain = @amusement_park.rides.create!(name: "Brain Drain", thrill_rating: 6)
      @teacups = @amusement_park.rides.create!(name: "Tea Cups", thrill_rating: 2)
    end

    it '#alphabetical_rides' do
      expect(@amusement_park.alphabetical_rides).to eq(["Brain Drain", "Tea Cups", "Tower of Doom"])
    end

    it "#average_thrill" do
      expect(@amusement_park.average_thrill.round(1)).to eq(5.3)
    end
  end
end
