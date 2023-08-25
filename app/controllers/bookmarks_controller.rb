class BookmarksController < ApplicationController
  def index
    @list = List.find(params[:list_id])
    @bookmarks = @list.bookmarks
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build(bookmark_params)
    if @bookmark.save
      redirect_to list_bookmarks_path(@list), notice: 'Bookmark was successfully added.'
    else
      render :new
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
