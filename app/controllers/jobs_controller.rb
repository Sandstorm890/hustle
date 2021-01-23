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
        
        @job.employer = current_user
        
        @job.employer_id = current_user.id # this is probably redundant
        
        if @job.save
            redirect_to employer_job_path(current_user, @job)
        else
            render :show
        end
    end

    def sign_up_for_job
        job = Job.find_by(id: params[:job_id])
        job.users << current_user
        job.save
        current_user.save
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
        if params[:employer_id]  
            @job = Job.find_by(employer_id: params[:id])
        else
            @job = Job.find_by(id: params[:id])
        end
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
        if current_job.employer == current_user
            current_job.delete
            redirect_to jobs_path
        end
        redirect_to jobs_path
    end

    private

    def jobs_params
        params.require(:job).permit(:category, :start_date, :end_date, :rate, :requirements, :user_id, :employer_id, :address)
    end

    
end