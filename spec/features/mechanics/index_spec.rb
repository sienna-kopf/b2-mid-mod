require 'rails_helper'

RSpec.describe "index page" do
  describe "for all mechanics" do
    it "can display mechanics name and years of years of experience" do
      @mechanic_1 = Mechanic.create!(name: "Monroe M.", years_of_experience: 12)
      @mechanic_2 = Mechanic.create!(name: "Lady L.", years_of_experience: 18)
      @mechanic_3 = Mechanic.create!(name: "Cara J.", years_of_experience: 9)

      visit "/mechanics"

      within("header") do
        expect(page).to have_content("All Mechanics")
      end

      within(".mechanic-#{@mechanic_1}") do
        expect(page).to have_content("Monroe M.")
        expect(page).to have_content("12 years of experience")
      end

      within(".mechanic-#{@mechanic_2}") do
        expect(page).to have_content("Lady L.")
        expect(page).to have_content("18 years of experience")
      end

      within(".mechanic-#{@mechanic_3}") do
        expect(page).to have_content("Cara J.")
        expect(page).to have_content("9 years of experience")
      end 
    end
  end
end
