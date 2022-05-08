require "rails_helper"
RSpec.describe Comment, type: :model do
    before do
        user = FactoryBot.create(:user)
        product = FactoryBot.create(:product)
        @comment = FactoryBot.build(:comment, user_id: user.id, product_id: product.id)
        sleep 0.2
    end

    describe "コメント機能" do
        context "コメントを保存できる場合" do
           it "コメント文を入力済みであれば保存できる" do
               expect(@comment).to be_valid
           end
        end
        context "コメントが保存できない" do
            it "コメントがからでは投稿ができない" do
                @comment.comment = ""
                @comment.valid?
                expect(@comment.errors.full_messages).to include "Comment can't be blank"
            end
        end
    end
end