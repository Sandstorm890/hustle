class SessionsController < ApplicationController
    layout 'layouts/sessions'

    def welcome
        if session[:user_id]
            redirect_to '/users'
        elsif session[:employer_id]
            redirect_to '/employers'
        else
            render :welcome
        end
    end

    def new 
        @user = User.new
    end

    def create 
        if user = User.find_by(email: params[:email])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect_to user_path(user)
            end
        elsif employer = Employer.find_by_email(params[:email])
            if employer && employer.authenticate(params[:password])
                session[:employer_id] = employer.id
                redirect_to employer_path(employer)
            end
        else
            flash[:message] = "Invalid login. Please try again."
            redirect_to '/login'
        end
    end

    def destroy 
        session.delete(:user_id)
        session.delete(:employer_id)
        redirect_to '/'
    end

    def omniauth
        user = User.from_omniauth(request.env['omniauth.auth'])

        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to '/login'
        end
    end
end