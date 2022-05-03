require "rails_helper"
RSpec.describe "UserAuthetications", type: :request do
    let(:user) { create(:user) }
    let(:user_params) { attributes_for(:user) }
    let(:invalid_user_params) { attributes_for(:user, username: "") }
    describe "GET #edit" do
        subject { edit_user_registration_path }
        context "ログインしている場合" do
            before do
                sign_in user
            end
            it "リクエストが成功すること" do
                is_expected.to eq "/users/edit"
            end
        end
    end
end