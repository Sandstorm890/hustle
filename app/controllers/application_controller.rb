class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def current_user
        if session[:employer_id]
            @employer = Employer.find_by(id: session[:employer_id])
        else
            @user = User.find_by(id: session[:user_id])
        end
    end

    def current_user?(params)
        current_user.id == params[:user_id].to_i
    end

    def user_posted?
        current_job.employer == current_user
    end

    

end
