class JobsController < ApplicationController

    def index
        @jobs = Job.order(:category)
    end

    def new
        if params[:employer_id] && !Employer.exists?(params[:employer_id])
            redirect_to jobs_path, alert: "Employer not found."
        else
            @job = Job.new(employer_id: params[:employer_id])
            render :new
        end
    end

    def create
        @job = Job.new(jobs_params)
        @job.employer = current_user
        if @job.valid?
            @job.save
            redirect_to employer_job_path(current_user, @job)
        else
            render :new
        end
    end

    def edit
        if user_posted?
            @job = Job.find_by(id: params[:id])
            render :edit
        else
            redirect_to user_path(current_user)
        end
    end

    def add_or_remove_from_job
        job = Job.find_by(id: params[:job_id])
        
        if job.users.include?(current_user)
            job.users.each do |user|
                if user == current_user
                    job.users.delete(current_user)
                end
            end
            job.save            
            redirect_to job_path(job)

        elsif !job.users.include?(current_user)
            job.users << current_user
            job.save
            current_user.save
            redirect_to user_job_path(current_user, job)
        end
                    

    end

    def show
        if params[:employer_id]
            employer = Employer.find_by(id: params[:employer_id])
            if employer.nil? || employer != current_user || current_job.nil?
                redirect_to employer_path(current_user)
            else
                @job = employer.jobs.find_by(id: params[:id])
                redirect_to employer_jobs_path(employer) if @job.nil?
            end
        elsif
            @job = Job.find_by(id: params[:id])
        end
    end

    def sort_by_rate
        @jobs = Job.order_by_rate
        render :index
    end

    def update
        @job = Job.find(params[:id])
        if @job.valid?
            @job.update(jobs_params)
            redirect_to employer_path(current_user)
        else
            render :edit 
        end
    end

    def destroy
        if current_job.employer == current_user
            current_job.delete
        end
        redirect_to jobs_path
    end

    private

    def current_job
        # if params[:employer_id]
        #     @job = Job.find_by(id: params[:employer_id])
        # else
            @job = Job.find_by(id: params[:id])
        # end
    end

    def jobs_params
        params.require(:job).permit(:category, :start_date, :end_date, :rate, :requirements, :user_id, :employer_id, :address)
    end

    
end