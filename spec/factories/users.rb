FactoryBot.define do
    factory :user do
        username {"test"}
        sequence(:email) {|n| "TEST#{n}@example.com"}
        password {"testuser"}
        password_confirmation {"testuser"}
    end
end