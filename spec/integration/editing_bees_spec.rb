require 'spec_helper'

feature "Editing Honeybees" do

  before do
    Factory(:honeybee, name: "Bumble bee")
    visit "/"
    click_link "Bumble bee"
    click_link "Edit Honeybee"
  end

  scenario "Updating a honeybee" do
    fill_in "Name", :with => "Wasp"
    click_button "Update Honeybee"
    page.should have_content("Honeybee has been updated.")
  end
  scenario "Updating a honeybee with invalid attributes is bad" do
    fill_in "Name", :with => ""
    click_button "Update Honeybee"
    page.should have_content("Honeybee has not been updated.")
  end
end
