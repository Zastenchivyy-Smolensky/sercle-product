require "rails_helper"
RSpec.describe "コメント", type: :system do
    let(:user) {FactoryBot.create(:user)}
    let(:product) {FactoryBot.create(:product)}
    before do
        sign_in user
        visit new_product_path
        post products_path(product)
        get product_path(product)
    end

    it "コメントをすること" do
        
    end
end