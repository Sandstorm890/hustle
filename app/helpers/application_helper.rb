module ApplicationHelper

    def show_logged_in
        if session[:user_id]
            content_tag(:h2, "Hello #{current_user.name}")
        end
    end

    def current_user
        @user = User.find_by(id: session[:user_id])
    end

    def current_user_is_employer?
        # byebug
        if current_user == nil
            false
        else
            current_user.employer
        end
    end
end
