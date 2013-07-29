require "spec_helper"
describe HoneybeesController do
  it "displays an error for a missing honeybee" do
  get :show, :id => "not-here"
  response.should redirect_to(honeybees_path)
  message = "The honeybee you were looking for could not be found."
  flash[:alert].should == message
  end
end
