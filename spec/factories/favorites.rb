FactoryBot.define do
    factory :facorite do
        association :user
        association :product
    end
end