module  SessionsSupport
    def login_in?
        !session[:user_id]
    end
end
RSpec.configure do |config|
    config.include SessionsSupport
end