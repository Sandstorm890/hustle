module JobHelper

    def current_job
        @job = Job.find_by(id: params[:id])
    end

    def user_posted?
        current_job.employer_id == session[:employer_id]
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

end