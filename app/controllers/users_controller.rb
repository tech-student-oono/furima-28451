class UsersController < ApplicationController
  def index
    @users = User.all
    end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end

  def show
    @nickname = current_user.nickname
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :encrypted_password, :first_name, :family_name, :first_name_FURIGANA, :family_name_FURIGANA, :birth_date)
  end
end
