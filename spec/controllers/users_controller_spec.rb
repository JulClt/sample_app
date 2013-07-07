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

  describe "GET 'show" do
    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it 'should be successful' do
      get :show, :id => @user
      response.should be_success
    end

    it 'should find the good user' do
      get :show, :id => @user
      assigns(:user).should == @user
    end

    it 'should have the good title' do
      get :show, :id => @user
      response.should have_selector("title", :content => @basic_title + " | #{@user.nom}")
    end

    it 'should have the user name in the main H1' do
      get :show, :id => @user
      response.should have_selector("h1", :content => @user.nom)
    end

    it'should have a gravatar' do
      get :show, :id => @user
      response.should have_selector("h1>img", :class => "gravatar")
    end
  end

end
