module  SessionsSupport

module System
    def log_in(user)
        visit new_user_session_path
        fill_in "user[email]", with: user.email
        fill_in "user[password]", with: user.password
        click_button "Log in"
    end
end
module Request 
    def log_in(user)
        post new_user_session_path, params: {session: {email: user.email, password: user.password}}
    end
    def login_in?
        !session[:user_id]
    end
end
end
RSpec.configure do |config|
    config.include SessionsSupport::System, type: :system
    config.include SessionsSupport::Request, type: :request
end