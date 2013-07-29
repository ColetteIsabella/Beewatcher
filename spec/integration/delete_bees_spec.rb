require 'spec_helper'

feature "Deleting honeybees" do
  scenario "Deleting a honeybee" do
    Factory(:honeybee, :name => "Bumble bee")
    visit "/"
    click_link "Bumble bee"
    click_link "Delete honeybee"
    page.should have_content("Honeybee has been deleted.")

    visit "/"
    page.should_not have_content("Bumblebee")
  end
end
