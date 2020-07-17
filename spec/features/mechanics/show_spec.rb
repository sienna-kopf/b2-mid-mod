require 'rails_helper'

RSpec.describe "show page" do
  describe "for a mechanic" do
    before :each do
      @amusement_park = AmusementPark.create!(name: "Elich Gardens", admission_price: 45)
      @tower_of_doom = @amusement_park.rides.create!(name: "Tower of Doom", thrill_rating: 8)
      @brain_drain = @amusement_park.rides.create!(name: "Brain Drain", thrill_rating: 6)
      @teacups = @amusement_park.rides.create!(name: "Tea Cups", thrill_rating: 2)

      @mechanic_1 = Mechanic.create!(name: "Monroe M.", years_of_experience: 12)
      @mechanic_2 = Mechanic.create!(name: "Lady L.", years_of_experience: 18)
      @mechanic_3 = Mechanic.create!(name: "Cara J.", years_of_experience: 9)

      @mechanic_2.add_ride(@brain_drain)
      @mechanic_2.add_ride(@teacups)
    end

    it "can display name, years of experience, and rides" do
      visit "/mechanics/#{@mechanic_2.id}"

      expect(page).to have_content("Lady L.")
      expect(page).to have_content("18 years of experience")

      within(".mechanic_rides") do
        expect(page).to have_content("Brain Drain")
        expect(page).to have_content("Tea Cups")
      end
    end

    it "can add a ride to the mechanics current rides" do
      visit "/mechanics/#{@mechanic_2.id}"

      within(".add_ride_form") do
        expect(page).to have_content("Add Ride")
        fill_in :ride_id, with: "#{@tower_of_doom.id}"
        click_on "Submit"
      end

      expect(current_path).to eq("/mechanics/#{@mechanic_2.id}")

      within(".mechanic_rides") do
        expect(page).to have_content("Brain Drain")
        expect(page).to have_content("Tea Cups")
        expect(page).to have_content("Tower of Doom")
      end
    end

    it "can handle incomplete form sad path" do
      visit "/mechanics/#{@mechanic_2.id}"

      within(".add_ride_form") do
        expect(page).to have_content("Add Ride")
        fill_in :ride_id, with: ""
        click_on "Submit"
      end

      expect(page).to have_content("Must enter valid ride id!!")
    end
  end
end
