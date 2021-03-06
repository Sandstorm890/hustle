module JobHelper

    def current_job
        if params[:employer_id]
            @job = Job.find_by(id: params[:employer_id])
        else
            @job = Job.find_by(id: params[:id])
        end
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

    def start_date(job)
        job.start_date.strftime("%A, %b %e, at %l:%M %p")
    end

    def end_date(job)
        job.end_date.strftime("%A, %b %e, at %l:%M %p")
    end

    # def employer_of_current_job(job)
    #     @employer = Employer.find_by(id: job.employer_id)
    # end

end