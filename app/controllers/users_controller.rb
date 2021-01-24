class UsersController < ApplicationController

    def index
        render :show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user.nil?
            redirect_to "/"
        else
            render :show
        end
    end

    def update
    end

    def logout
        session.clear[:user_id]
        redirect :index
    end

    def destroy
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :bio, :uid)
    end
end