class BookmarksController < ApplicationController
  before_action :set_inquiry, only: [:show, :edit, :update, :destroy]
  before_action :set_kindergarden, only: [:new, :create, :destroy]

  def new
    @bookmark = Bookmark.new()
  end

  def create
    @bokmark = Bookmark.new(bookmark_params)
    @bookmark.user_id = current_user.id
    @bookmark.kindergarden_id = params[:kindergarden_id]
    @bookmark.save
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:kindergarden_id, :user_id)
  end

  def set_kindergarden
    @kindergarden = Kindergarden.find(params[:kindergarden_id])
  end

end
