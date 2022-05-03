require "rails_helper"
RSpec.describe "Sessions", type: :system do
    before do
        driven_by(:rack_test)
    end
    describe "#new" do
        context "無効な値の場合" do
            it "メッセージが表示される" do
                visit new_user_session_path
                fill_in "email", with: ""
                fill_in "Password", with: ""
                click_button "Log in"
                expect(page).to have_selector 'div.notification.is-danger'
                visit root_path
                expect(page).to_not have_selector "div.notification.is-danger"
            end
        end
        context "有効な値の場合" do
            let(:user) {FactoryBot.create(:user)}
            it "ログインユーザ用のページが表示されること" do
                visit new_user_session_path
                fill_in "email", with: user.email
                fill_in "Password", with: user.password
                click_button "Log in"
                expect(page).to have_selector "a[href=\"#{destroy_user_session_path}\"]"
                expect(page).to have_selector "a[href=\"#{root_path(user)}\"]"
            end
        end
    end
end