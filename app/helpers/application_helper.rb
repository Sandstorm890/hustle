module ApplicationHelper

    def show_logged_in
        if session[:employer_id] || session[:user_id]
            content_tag(:h2, "Hello #{current_user.name}")
        end
    end

    def current_user
        if session[:employer_id]
            @user = Employer.find_by(id: session[:employer_id])
        else
            @user = User.find_by(id: session[:user_id])
        end
    end

    def employer?
        !!session[:employer_id]
    end

end
