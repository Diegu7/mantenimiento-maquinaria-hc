class SessionsController < ApplicationController
    layout 'session'
    skip_before_action :authenticate, except: :destroy

    def new
        if current_user
            redirect_to root_path
        end
    end

    def create
        @user = User.find_by_username(session_params[:username])

        if @user && @user.authenticate(session_params[:password])
            login(@user)
        else
            flash.now[:notice] = "Usuario o contraseña incorrecta"
            render :new
        end
    end

    def destroy
        logout
    end

    protected
        def session_params
            params.require(:session).permit(:username, :password)
        end
end
