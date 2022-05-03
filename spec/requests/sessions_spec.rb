require "rails_helper"
RSpec.describe "sessions", type: :request do
    describe "GET /login" do
        it "returns http success" do
            get new_user_session_path
            expect(response).to have_http_status :success
        end
    end
end