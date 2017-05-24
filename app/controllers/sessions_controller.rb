class SessionsController < ApplicationController
    layout 'session'

    def new
    end

    def create
        @user = User.find_by_username(session_params[:username])

        if @user && @user.authenticate(session_params[:password])
            redirect_to root_path
        else
            flash.now[:notice] = "Usuario o contraseña incorrecta"
            render :new
        end
    end

    def destroy
    end

    protected
        def session_params
            params.require(:session).permit(:username, :password)
        end
end
