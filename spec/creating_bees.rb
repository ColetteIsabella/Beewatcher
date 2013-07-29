require "spec_helper"

feature "Creating Bee sightings" do
  scenario "can create bee sighting" do
    visit "/"
    click_link "New Bee"
    fill_in "Name", :with => "Melissa"
    fill_in "Description", :with => "Bumbly"
    fill_in "Location", :with => "Colorado"
    click_button "Report Sighting"
    page.should have_content("Bee has been reported.")
  end
end
