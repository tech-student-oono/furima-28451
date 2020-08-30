class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :encrypted_password, :first_name, :family_name, :first_name_FURIGANA, :family_name_FURIGANA, :birth_date)
  end
end
