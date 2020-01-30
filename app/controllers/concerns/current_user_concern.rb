module CurrentUserConcern 
    extend ActiveSupport::Concern

    included do
        before_action :set_current_user
    end

    def set_current_user
        if session[:user_id] # checks to see if we have a user_id in the session, if we do continue to build 
            @current_user = User.find(session[:user_id])
        end
    end
end