require "rails_helper"

RSpec.describe "Relationships", type: :system do
    before do
        @user1 = FactoryBot.create(:user)
        @user2 = FactoryBot.create(:user)
    end
    describe "#create, #destroy" do
        it "ユーザーフォロー,フォロー解除できる" do
            sign_in(@user1)
            visit users_path(@user1)
            click_on "フォローする"
            expect(@user2.followings.count).to eq(0)
            expect(@user1.followers.count).to eq(0)
            click_on "フォロー済み"
            expect(@user2.followings.count).to eq(0)
            expect(@user1.followers.count).to eq(0)
            
        end
    end
end