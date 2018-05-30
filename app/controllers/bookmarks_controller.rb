class BookmarksController < ApplicationController
  before_action :set_inquiry, only: [:show, :edit, :update, :destroy]
  before_action :set_kindergarden, only: [:new, :create, :destroy]
  before_action :set_user, only: [:bookmark_params]

  def new
    @bookmark = Bookmark.new()
    redirect_to kindergarden_bookmarks_path(@kindergarden), method:'post'
  end

  def create
    @bookmark = Bookmark.new(kindergarden_id: params[:kindergarden_id])
    @bookmark.user_id = current_user.id
    # @bookmark.kindergarden_id = params[:kindergarden_id]
    @bookmark.save
    redirect_to kindergardens_path
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path
  end

  private
  def set_user
    @user = current_user
  end

  def bookmark_params
    params.require(:bookmark).permit(:kindergarden_id)
  end

  def set_kindergarden
    @kindergarden = Kindergarden.find(params[:kindergarden_id])
  end

end
