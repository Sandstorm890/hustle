module ApplicationHelper

    def show_logged_in
        if session[:user_id]
            content_tag(:p, "Hello #{@user.name}")
        end
    end
end
