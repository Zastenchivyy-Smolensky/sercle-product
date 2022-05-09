require 'rails_helper'
RSpec.describe 'Favorites', type: :system do
    before do
        @user = FactoryBot.create(:user)
        @product = FactoryBot.create(:product)
    end

    describe '#create, #describe', js: true do
        let!(:user) {FactoryBot.create(:user)}
        let!(:product) {FactoryBot.create(:product)}
       context "いいねをクリックしたとき" do
           it "いいねできる" do
            sign_in(user)
            visit root_path
            
           end
       end
    end
end
