require "spec_helper"

feature "Viewing bees" do
  scenario "Listing all honeybees" do
    honeybee = Factory.create(:honeybee, name: "Bumble bee")
    visit "/"
    click_link "Bumble bee"
    page.current_url.should == honeybee_url(honeybee)
  end
end
