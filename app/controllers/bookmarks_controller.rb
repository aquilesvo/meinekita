class BookmarksController < ApplicationController
  before_action :set_inquiry, only: [:show, :edit, :update]
  before_action :set_kindergarden, only: [:new, :create, :destroy]
  before_action :set_user, only: [:index, :bookmark_params]
  before_action :set_bookmark, only: [:destroy]


  def index
    @bookmarks = Bookmark.where(:user_id == current_user.id)
  end

  def new
    @bookmark = Bookmark.new()
    redirect_to kindergarden_bookmarks_path(@kindergarden), method:'post'
  end

  def create
    @bookmark = Bookmark.new(kindergarden_id: params[:kindergarden_id])
    @bookmark.user_id = current_user.id
    # @bookmark.kindergarden_id = params[:kindergarden_id]
    @bookmark.save

    if @bookmark.save
      respond_to do |format|

        format.html { render 'kindergardens/index' }
        format.js

      end
    else
      respond_to do |format|

        format.html { render 'kindergardens/show' }
        format.js

      end
    end


  end

  def destroy
    @bookmark.destroy

    respond_to do |format|

      format.html { render 'kindergardens/index' }
      format.js


    end
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

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
