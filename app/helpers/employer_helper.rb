module EmployerHelper

    def current_employer
        @employer = Employer.find_by(id: session[:employer_id])
    end

    

end