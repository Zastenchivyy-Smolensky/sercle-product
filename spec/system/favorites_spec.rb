require 'rails_helper'
RSpec.describe 'Favorites', type: :system do
    before do
        @user = FactoryBot.create(:user)
        @product = FactoryBot.create(:product)
    end

    describe '#create, #describe', js: true do
       context "いいねをクリックしたとき" do
           it "いいねできる" do
            sign_in(@user)
            visit products_path
           end
       end
    end
end
