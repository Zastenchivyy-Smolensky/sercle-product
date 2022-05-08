FactoryBot.define do
    factory :comment do
        association :user
        association :product
        comment {"aaaa"}
    end
end