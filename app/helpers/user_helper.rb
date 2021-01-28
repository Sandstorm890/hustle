module UserHelper

    def current_user
        if session[:employer_id]
            @employer = Employer.find_by(id: session[:employer_id])
        else
            @user = User.find_by(id: session[:user_id])
        end
    end

    def worker?
        !!session[:user_id]
    end 

    def user_full_name(user)
        "#{user.first_name} #{user.last_name}"
    end

    # def worker_full_name(user)
    #     "#{user.first_name} #{user.last_name}"
    # end
end