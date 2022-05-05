FactoryBot.define do
    factory :user do
        username {"test"}
        sequence(:email) {|n| "TEST#{n}@example.com"}
        password {"testuser"}
        password_confirmation {"testuser"}
    end
    factory :other_user, class: User do
        username {"Archer"}
        sequence(:email) {"TEST1@example.com"}
        password {"foobar"}
        password_confirmation {"foobar"}
        activated {true}
    end
end