FactoryBot.define do
  factory :score do
    player
    time { "2020/12/01" }
    sequence(:score) {|n| n }
  end
end