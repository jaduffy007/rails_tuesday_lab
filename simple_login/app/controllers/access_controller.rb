class AccessController < ApplicationController
  before_action :prevent_home, only: [:home]
  before_action :prevent_login_signup, only: [:login, :signup]

  def signup
    @user = User.new
  end

  def login
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(username: params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
        session[:user_id] = authorized_user.id
        redirect_to home_path, alert: "You are now logged in as " + authorized_user.username
      else
        redirect_to signup_path, alert: "Invalid login"
      end
    else
      redirect_to signup_path, alert: "Please enter a username and password"
    end
  end


  def home
    @user = User.find(session[:user_id])
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path, flash: {success: "You have logged out"}
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path,  flash: {success: "Congratulations, you have successfully signed up"}
    else
      render :signup
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_digest)
  end
  def prevent_home
    if !session[:user_id]
      redirect_to login_path, alert: "Please log in first"
    end
  end
  def prevent_login_signup
    if session[:user_id]
      redirect_to home_path, alert: "DUDE YOU ARE ALREADY LOGGED IN IDIOT"
    end
  end

end