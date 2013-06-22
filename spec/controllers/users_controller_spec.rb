require 'spec_helper'

describe UsersController do

  render_views

  before(:each) do
    @basic_title = "Mon tutoriel Ruby On Rails"
  end
  
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the good title" do
      get 'new'
   	  response.should have_selector("title", :content => @basic_title + " | Inscription")
    end
  end

end
