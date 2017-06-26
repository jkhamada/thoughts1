class SessionsController < ApplicationController
  #login method
    def create
      @user = User.find_by_email(params[:email])
      if @user
        if @user.authenticate(params[:password])
           session[:user_id] = @user.id
           redirect_to "/users/#{@user.id}"
           #"/users/2"
        else
          flash[:errors] = ['Invalid email/password combination']
          redirect_to :back
        end
      else
        flash[:errors] = ['User not found. Please check you email, or register']
        redirect_to :back
      end
      end

#logout method
    def destroy
      reset_session
      redirect_to '/users/new'
    end
end
