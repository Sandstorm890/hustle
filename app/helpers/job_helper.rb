module JobHelper

    def current_job
        if params[:employer_id]
            @job = Job.find_by(id: params[:employer_id])
        else
            @job = Job.find_by(id: params[:id])
        end
    end

    def current_user?(params)
        current_user.id == params[:user_id].to_i
    end

    def render_poster
        if user_posted?
            content_tag(:h2, "You posted this job")
        end
    end

    def render_sign_up_button
        if current_job.user_id == nil
            content_tag(:p, "Sign Up")
        elsif current_job.user_id == current_user.id
            content_tag(:p, "Signed Up")
        end
    end

    def all_jobs
        @jobs = Job.all
    end

    def date_format(date)
        date.strftime("%A, %b %e, at %l:%M %p")
    end
    
    def job_user?
        !!params[:user_id]
    end

    def job_bid_by_worker(worker)
        worker.jobs_users.find_by(job_id: params[:id]).rate.to_i
    end

    def job_bid
        if worker?
            if current_user.jobs_users.find_by(job_id: params[:id]).nil?
                nil
            else
                current_user.jobs_users.find_by(job_id: params[:id]).rate
            end
        end
    end

    def render_job_bid
        if job_bid
            content_tag(:p, "Your Bid: $#{job_bid}.00/hr")
        else
            nil
        end
    end

    # def job_user_by_current_user(job)
    #     job.jobs_users.users.find_by(id: params[:user_id])
    # end

    # def employer_of_current_job(job)
    #     @employer = Employer.find_by(id: job.employer_id)
    # end

end