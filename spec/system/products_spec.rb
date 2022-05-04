require "rails_helper"
RSpec.describe "products", type: :system do
    before do
        driven_by(:rack_test)
    end
end
describe "#new" do
    context "無効な場合" do
        let!(:user) {FactoryBot.create(:user)}
        let!(:product) {FactoryBot.create(:product)}
        it "フラッシュメッセージが表示される" do
            sign_in(user)
            visit new_product_path
            fill_in "product[title]", with: ""
            fill_in "product[content]", with: product.content
            fill_in "product[tech]", with: product.tech
            fill_in "product[span]", with: product.span
            attach_file "product[image]", "#{Rails.root}/spec/fixtures/image.jpeg"
            fill_in "product[github]", with: product.github
            fill_in "product[link]", with: product.link
            fill_in "product[commitment]", with: product.commitment
            click_on "投稿"
            expect(page).to have_selector "div.notification.is-danger"
            expect(page).to have_selector "h1"
        end
    end
    context "有効な値の場合" do
        let!(:user) {FactoryBot.create(:user)}
        let!(:product) {FactoryBot.create(:product)}
        it "プロダクトを投稿" do
            sign_in(user)
            visit new_product_path
            fill_in "product[title]", with: product.title
            fill_in "product[content]", with: product.content
            fill_in "product[tech]", with: product.tech
            fill_in "product[span]", with: product.span
            attach_file "product[image]", "#{Rails.root}/spec/fixtures/image.jpeg"
            fill_in "product[github]", with: product.github
            fill_in "product[link]", with: product.link
            fill_in "product[commitment]", with: product.commitment
            click_on "投稿"
            expect(page).to have_selector "div.notification.is-info"
            expect(page).to have_selector "h1"
        end
    end
end