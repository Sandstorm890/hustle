module ApplicationHelper

    def show_logged_in
        if logged_in?
            content_tag(:h2, "Hello #{current_user.name}")
        end
    end

    def current_user
        if session[:employer_id]
            @employer = Employer.find_by(id: session[:employer_id])
        else
            @user = User.find_by(id: session[:user_id])
        end
    end

    def employer?
        !!session[:employer_id]
    end

    def worker?
        !!session[:user_id]
    end 

    def logged_in?
        worker? || employer?
    end

end
