

FactoryGirl.define do
  factory :user do
    email                 "mbrown@yahoo.com"
    password              "foobar1234"
    password_confirmation "foobar1234"
  end 
end