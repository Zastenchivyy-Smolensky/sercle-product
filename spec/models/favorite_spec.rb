require "rails_helper"
RSpec.describe Favorite, type: :model do
    before do
        user = FactoryBot.create(:user)
        product = FactoryBot.create(:product)
        @favorite = FactoryBot.create(:favorite, user_id: user.id, product_id: product.id)
    end

    describe "いいね機能" do
        context "いいねできる場合" do
            it "認証済みでプロダクトがあれば保存できる" do
                expect(@favorite).to be_valid
            end
            it "プロダクトが同じでも自分以外ならいいねができる" do
                other_favorite = FactoryBot.create(:favorite)
                expect(FactoryBot.create(:favorite, user_id: other_favorite.user_id)).to be_valid
            end
            it "自分が同じプロダクトを投稿してもいいねができる" do
                other_favorite = FactoryBot.create(:favorite)
                expect(FactoryBot.create(:favorite, product_id: other_favorite.product_id)).to be_valid
            end
        end
    end
end