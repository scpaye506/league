# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dg_league do
    address1 "MyString"
    address2 "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    name "MyString"
    description "MyText"
    par 1
  end
end
