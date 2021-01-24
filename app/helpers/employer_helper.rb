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

    def employer_full_name(employer)
        "#{employer.first_name} #{employer.last_name}"
    end

end