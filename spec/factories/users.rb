require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email 'a@a.com'
    password '12345678'
  end
end