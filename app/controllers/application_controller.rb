class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def index
    end

    def current_user
        if session[:employer_id]
            @employer = Employer.find_by(id: session[:employer_id])
        else
            @user = User.find_by(id: session[:user_id])
        end
    end

    def current_tool
        @tool = Tool.find_by(id: params[:id])
    end


    
end
