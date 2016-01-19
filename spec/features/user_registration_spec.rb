require 'spec_helper'

feature "User Registration" do

  context "when visiting new user path" do

    background do
      visit new_user_registration_path
    end

    context "registering with valid data" do

      given(:email) { "myemail@gmail.com" }

      background do
        fill_form_with_valid_data(email: email)
      end

      scenario "new user is created" do
        expect do
          register
        end #.to change(User, :count).by(1)
      end

      context "notifications" do

        background do
          register
        end

      end

    end

  end

end

def fill_form_with_valid_data(args={})
  email = args.fetch(:email, "myemail@gmail.com")
  fill_in "user_email", with: email
  fill_in "user_password", with: "secret"
  fill_in "user_password_confirmation", with: "secret"
end

def register
  click_button "Sign up"
end