class EmployersController < ApplicationController
    layout :resolve_layout
    
    def index
        render :show
    end

    def new
        @employer = Employer.new
    end

    def create
        @employer = Employer.new(employer_params)
        if @employer.valid?
            @employer.save
            session[:employer_id] = @employer.id
            redirect_to employer_path(@employer)
        else
            render :new
        end
    end

    def show
        if params[:id].to_i != session[:employer_id]
            redirect_to jobs_path
        else
            employer = Employer.find_by(id: params[:id])
            @job = employer.jobs.find_by(id: params[:id])
            render :show
        end
    end

    def update
    end

    def logout
        session.clear[:Employer_id]
        redirect :index
    end

    def destroy
    end

    private

    def resolve_layout
        case action_name
        when "new", "create"
            "sessions"
        else
            "application"
        end
    end

    def employer_params
        params.require(:employer).permit(:first_name, :last_name, :username, :email, :password, :bio, :company)
    end
end