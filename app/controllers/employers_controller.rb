class EmployersController < ApplicationController
    
    def index
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
        @employer = Employer.find(params[:id])
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

    def employer_params
        params.require(:employer).permit(:name, :username, :email, :password, :bio, :company)
    end
end