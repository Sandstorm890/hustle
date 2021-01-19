class UsersController < ApplicationController

    def index
    end

    def new
        @user = User.new
    end

    def create
        # byebug
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
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
        params.require(:user).permit(:name, :username, :email, :password, :bio)
    end
end