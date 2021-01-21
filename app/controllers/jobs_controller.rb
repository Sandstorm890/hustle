class JobsController < ApplicationController
    def index
        @jobs = Job.all
    end

    def new
        @job = Job.new
        @employer = Employer.find_by(id: session[:employer_id])
    end

    def create
        @job = Job.new(jobs_params)
        @job.employer_id = session[:employer_id]
        if @job.save
            redirect_to job_path(@job)
        else
            render :show
        end
    end

    def sign_up_for_job
        job = Job.find_by(id: params[:job_id])
        job.users << current_user
        job.save
        redirect_to job_path(job)
    end

    def remove_from_job
        job = Job.find_by(id: params[:job_id])
        if job.users.include?(current_user)
            job.users.each do |user|
                if user == current_user
                    job.users.delete(current_user)
                end
            end
            job.save
        end
        redirect_to job_path(job)
    end

    def show
        @job = Job.find_by(id: params[:id])
    end

    def update
        @job = Job.find(params[:id])
        @job.update(jobs_params)
        if @job.valid?
            redirect_to jobs_path 
        else
            render :edit 
        end
    end

    def destroy
    end

    private

    def jobs_params
        params.require(:job).permit(:category, :start_date, :end_date, :rate, :requirements, :user_id, :employer_id)
    end

    def current_user
        if session[:employer_id]
            @employer = Employer.find_by(id: session[:employer_id])
        else
            @user = User.find_by(id: session[:user_id])
        end
    end
end