require "spec_helper"

feature "Creating Bee Reports" do
  before do
    user = Factory(:confirmed_user, :email => "user@beefan.com")
    define_permission!(user, "view", honeybee)
    define_permission!(user, "Create Honeybee", honeybee)
    sign_in_as!(user)

    visit "/"
    click_link "New Bee"
  end
  scenario "can create a bee report" do
    fill_in "Name", :with => "Melissa"
    fill_in "Description", :with => "Fuzzy"
    fill_in "Location", :with => "Colorado"
    click_button "Create Honeybee"
    page.should have_content("Bee has been reported.")
    within("#honeybee #author") do
    page.should have_content("Reported by user@beefan.com")
    end

    honeybee = Honeybee.find_by_name("Bumble bee")
    page.current_url.should == honeybee_url(honeybee)
    title = "Bumblebee - Honeybee - Beewatcher"
    find("title").should have_content(title)
  end

  scenario "can not report a bee without a name" do
    click_button 'Create Honeybee'
    page.should have_content("Bee Report has not been created.")
    page.should have_content("Name can't be blank")
  end
end

