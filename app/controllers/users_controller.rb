class UsersController < ApplicationController
    def create
        if params[:password_digest] == params[:password_confirmation]
            @user = User.create(user_params)
            session[:user_id] = @user.id
            redirect_to(controller: 'users', action: 'new')
        else
            redirect_to(controller: 'users', action: 'create')
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end