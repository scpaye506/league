# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :score do
    value 1
    player_id 1
    game_id 1
  end
end
