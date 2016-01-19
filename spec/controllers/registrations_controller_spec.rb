

# require File.dirname(__FILE__) + '/../spec_helper'
require 'spec_helper'
require 'rspec/rails'
require 'devise'
require 'support/devise'
require 'support/controller_macros'


# describe RegistrationsController do
#   login_user

#   it "should have a current_user" do
#     # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
#     expect(subject.current_user).to_not eq(nil)
#   end

#   it "should get index" do
#     # Note, rails 3.x scaffolding may add lines like get :index, {}, valid_session
#     # the valid_session overrides the devise login. Remove the valid_session from your specs
#     get 'index' #, {}, valid_session
#     response.should be_success
#   end
# end


describe User::RegistrationsController do
  include Devise::TestHelpers
  fixtures :all
  render_views

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end


  	describe "POST 'create'" do
	    describe "success" do
	      before(:each) do
	        @attr = { :email => "user@example.com",
	                  :password => "foobar01", :password_confirmation => "foobar01" }
	      end
	      it "should create a user" do
	        lambda do
	          post :create, :user => @attr
	           # @user = FactoryGirl.create(:user)
	           # sign_in :user, @user
	          response.should redirect_to("/home/#{assigns(:user).id}")
	        end.should change(User, :count).by(1)
	      end

	    end
	end


	# describe "POST 'create'" do
	#     before(:each) do
	#     @user = FactoryGirl.create(:user)
	#     end
	#     puts "====================================: #{@user.inspect}"
	#     it "should be successful" do
	#       # get :show, :id => @user
	#       visit home_path(@user)
	#       response.should be_success
	#     end
 	#end

 

end