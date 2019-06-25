class UsersController < ApplicationController
  before_action :move_to_log_in, only: [:show]

  def sign_in
  end

  def create_sign_up
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to root_path
    else
      render action: "registration_base"
    end
  end

  def create_sign_in
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'sign_in'
    end
  end

  def edit
  end

  def show
  end

  def sign_up
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out_page
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end

  def registration_base
    @user = User.new
    @user.build_profile
  end

  def registration_phone
  end

  def registration_address
  end

  def registration_payment
  end

  def registration_completion
  end

  def confirmation
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, profile_attributes:[:id, :first_name, :family_name, :first_name_kana, :family_name_kana])
  end

  def move_to_log_in
    redirect_to controller: "sessions", action: "sign_in" unless logged_in?
  end
end
