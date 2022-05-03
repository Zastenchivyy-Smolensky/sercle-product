require "rails_helper"
RSpec.describe "USserAuthentications", type: :request do
    let(:user) {create(:user)}
    let(:user_params) { attributes_for(:user) }
    let(:invalid_user_params) { attributes_for(:user, username: "") }

    describe "POST #create" do
        before do
            ActionMailer::Base.deliveries.clear
        end
        context "パラメータが妥当な場合" do
            it "リクエストが成功すること" do
                post user_registration_path, params: {user: user_params}
                expect(response.status).to eq 302
            end
            it "createが成功すること" do
                expect do
                    post user_registration_path, params: { user: user_params }
                end.to change(User, :count).by 1
            end
            it "リダイレクトされること" do
                post user_registration_path, params: {user: user_params}
                expect(response).to redirect_to root_url
            end

            it "ログイン状態であること" do
                post user_session_path, params: user_params
                expect(login_in?).to be_truthy
            end
        end
        context "パラメータが妥当ではないこと" do
            it "リクエストが成功すること" do
                post user_registration_path, params: {user: invalid_user_params}
                expect(response.status).to eq 200
            end
            it "createが失敗すること" do
                expect do
                    post user_registration_path, params: {user: invalid_user_params}
                end.to_not change(User, :count)
            end
        end
    end

    describe "ログアウトのテスト" do
        it "ログアウトできること" do
            user = FactoryBot.create(:user)
            post new_user_session_path, params:{session: {email: user.email, password: user.password}}
            expect(login_in?).to be_truthy
            delete destroy_user_session_path
            expect(login_in?).to_not be_truthy
        end
    end
end