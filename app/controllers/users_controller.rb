class UsersController < ApplicationController
  def edit
  end

  def show
  end

  def logout
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

  def sign_up
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render action: "registration_base"
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, profile_attributes:[:id, :first_name, :family_name, :first_name_kana, :family_name_kana])
  end

  def confirmation
  end

end
