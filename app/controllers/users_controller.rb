class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end
    
    def show
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(create_user_params)

        if @user.save
            redirect_to users_path
        else
            flash[:errors] = "No se pudo crear el usuario"
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])

        if @user.update_attributes(update_user_params)
            redirect_to users_path
        else
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end

    protected
        def create_user_params
            params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :middle_name, :last_name, :image, :email)
        end
        def update_user_params
            params.require(:user).permit(:first_name, :middle_name, :last_name, :image)
        end
     
end
