class JobsUsersController < ApplicationController


    def update
        if current_user?(params)
            @jobs_user = JobsUser.find_by(job_id: params[:job_id])
            @jobs_user.rate = params[:jobs_user][:rate]
            if @jobs_user.save
                redirect_to user_job_path(params[:user_id], @jobs_user.job_id)
            else
                redirect_to jobs_path, alert: "There was a problem. Job was not able to be updated."
            end
        else
            redirect_to jobs_path, alert: "There was a problem. Job was not able to be updated."
        end
    end
end