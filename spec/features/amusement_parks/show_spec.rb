require 'rails_helper'

RSpec.describe "show page" do
  describe "for an amusement_park" do
    it "can display name, admission price, rides, and average thrill rating" do
      @amusement_park = AmusementPark.create!(name: "Elich Gardens", admission_price: 45)
      @tower_of_doom = @amusement_park.rides.create!(name: "Tower of Doom", thrill_rating: 8)
      @brain_drain = @amusement_park.rides.create!(name: "Brain Drain", thrill_rating: 6)
      @teacups = @amusement_park.rides.create!(name: "Tea Cups", thrill_rating: 2)

      visit "/amusement_parks/#{@amusement_park.id}"

      expect(page).to have_content("Elich Gardens")
      expect(page).to have_content("Admission Price: $45.00")

      within(".amusement_park_rides") do
        expect(page.all('li')[0]).to have_content("Brain Drain")
        expect(page.all('li')[1]).to have_content("Tea Cups")
        expect(page.all('li')[2]).to have_content("Tower of Doom")
      end

      expect(page).to have_content("Average Thrill Rating: 5.3/10")
    end
  end
end
