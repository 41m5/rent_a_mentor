class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = curret_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Updated Successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :ed_level, :photo)
  end
end
