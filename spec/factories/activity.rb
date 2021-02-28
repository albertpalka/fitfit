FactoryBot.define do
  factory :activity do
    sequence(:original_location) { |n| "Bukowińska #{n}" }
    sequence(:destination_location) { |n| "Żabińskiego #{n}" }
    distance { rand(0.2..11.2).to_s }
  end
end
