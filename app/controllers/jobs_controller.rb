class JobsController < ApplicationController
    def index
        @jobs = Job.all
    end

    def new
        @job = Job.find_by(id: 1)
    end

    def create
    end

    def show
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
end