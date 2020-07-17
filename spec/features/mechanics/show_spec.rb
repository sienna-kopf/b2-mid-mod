require 'rails_helper'

RSpec.describe "show page" do
  describe "for a mechanic" do
    it "can display name, years of experience, and rides" do
      @amusement_park = AmusementPark.create!(name: "Elich Gardens", admission_price: 45)
      @tower_of_doom = @amusement_park.rides.create!(name: "Tower of Doom", thrill_rating: 8)
      @brain_drain = @amusement_park.rides.create!(name: "Brain Drain", thrill_rating: 6)
      @teacups = @amusement_park.rides.create!(name: "Tea Cups", thrill_rating: 2)

      @mechanic_1 = Mechanic.create!(name: "Monroe M.", years_of_experience: 12)
      @mechanic_2 = Mechanic.create!(name: "Lady L.", years_of_experience: 18)
      @mechanic_3 = Mechanic.create!(name: "Cara J.", years_of_experience: 9)

      @mechanic_2.add_ride(@brain_drain)
      @mechanic_2.add_ride(@teacups)

      visit "/mechanics/#{@mechanic_2.id}"

      expect(page).to have_content("Lady L.")
      expect(page).to have_content("18 years of experience")

      within(".mechanic_rides") do
        expect(page).to have_content("Brain Drain")
        expect(page).to have_content("Tea Cups")
      end

      expect(page).to have_link("Add Ride")
    end
  end
end
