class SessionsController < ApplicationController
    def new
    end
  
    def create
        @user = User.find_by(name: params[:user][:name])
  
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
    end
    
    def authenticate(password)
      salt = password_digest[0..28]
      hashed = BCrypt::Engine::hash_secret(password, salt)
      return nil unless (salt + hashed) == self.password_digest
    end

    def password=(new_password)
      salt = BCrypt::Engine::generate_salt
      hashed = BCrypt::Engine::hash_secret(new_password, salt)
      self.password_digest = salt + hashed
    end
end
