# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
    first_name "MyString"
    last_name "MyString"
    middle_name "MyString"
    gender "MyString"
    classification "MyString"
  end
end
