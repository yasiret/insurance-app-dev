
require 'spec_helper'
require 'rspec/rails'
require 'devise'

require 'support/devise'
require 'support/controller_macros'


describe User::SessionsController do
  include Devise::TestHelpers
  fixtures :all
  render_views

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end


   describe "#create" do
    context "with valid credentials" do
      let :credentials do
        { :email => 'yasir@evolverstech.com', :password => '12345678', :password_confirmation => '12345678' }
      end

      let :user do
        FactoryGirl.create(:user, credentials)
      end

      before :each do
        redirect_to home_path(user.id) #, credentials
      end

      # it "creates a user session" do
      # 	puts "=====================================: #{user.inspect}"
      #   session[:user_id].should == user.id
      # end
    end

  end

	  describe "#destroy" do
	    context "when user logged in" do
	      before :each do
	        redirect_to destroy_user_session_path # delete "/destroy", {}, { :user_id => 1 } # the first hash is params, second is session
	      end

	      it "destroys user session" do
	        session[:user_id].should be_nil
	      end

	    end
	  end


end