require 'spec_helper'

describe "LayoutLinks" do
  it "should havea Home page at '/'" do 
    get '/'
    response.should have_title("home")
  end
end
