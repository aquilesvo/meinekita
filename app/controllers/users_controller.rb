class UsersController < ApplicationController
before_action :set_user, only: [:show, :update, :remove_photo]

  def show
    @inquiries_own = Inquiry.where(user_id: current_user)
    @bookmarks_own = Bookmark.where(user_id: current_user)
    @user = current_user
  end

  def update
    @user = current_user
    current_user.update(current_user_params)
    redirect_to user_path(@user)
  end

  def destroy
  end

  def remove_photo
    @user = current_user
    @user.remove_photo!
    @user.save
    redirect_to user_path(@user)
  end

  private

  def current_user_params
    params.require(:user).permit(:email, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
