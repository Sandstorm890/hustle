module ApplicationHelper

    def show_logged_in
        if logged_in?
            if current_user.first_name && current_user.last_name
                "#{current_user.first_name + " " + current_user.last_name}"
            else
                "#{current_user.username}"
            end
        end
    end

    def logged_in?
        worker? || employer?
    end

    

end
