module EmployerHelper

    def current_employer
        @employer = Employer.find_by(id: session[:employer_id])
    end

    def employer?
        !!session[:employer_id]
    end

    def user_created_job?(job)
        job.employer.id == session[:employer_id]
    end

end