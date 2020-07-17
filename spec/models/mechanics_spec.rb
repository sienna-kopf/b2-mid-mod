require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many(:rides).through(:mechanic_rides)}
  end

  describe 'methods' do
    before :each do
      @amusement_park = AmusementPark.create!(name: "Elich Gardens", admission_price: 45)
      @tower_of_doom = @amusement_park.rides.create!(name: "Tower of Doom", thrill_rating: 8)
      @brain_drain = @amusement_park.rides.create!(name: "Brain Drain", thrill_rating: 6)
      @teacups = @amusement_park.rides.create!(name: "Tea Cups", thrill_rating: 2)

      @mechanic = Mechanic.create!(name: "Lady L.", years_of_experience: 18)

    end
    it '#add_ride' do
      @mechanic.add_ride(@brain_drain)
      @mechanic.add_ride(@teacups)

      expect(@mechanic.rides).to eq([@brain_drain, @teacups])
    end
  end
end
