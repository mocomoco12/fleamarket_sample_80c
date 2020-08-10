class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.where(user_id: current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:email, :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_date)
  end

end
