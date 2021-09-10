class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  def index
    @bookmarks = Bookmark.all
  end

  def show
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def edit
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end


  def update
    if @bookmark.update(bookmark_params)
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end


        #            Prefix Verb   URI Pattern                                                                              Controller#Action
        #    list_bookmarks POST   /lists/:list_id/bookmarks(.:format)                                                      bookmarks#create
        # new_list_bookmark GET    /lists/:list_id/bookmarks/new(.:format)                                                  bookmarks#new
        #             lists GET    /lists(.:format)                                                                         lists#index
        #                   POST   /lists(.:format)                                                                         lists#create
        #          new_list GET    /lists/new(.:format)                                                                     lists#new
        #         edit_list GET    /lists/:id/edit(.:format)                                                                lists#edit
        #              list GET    /lists/:id(.:format)                                                                     lists#show
        #                   PATCH  /lists/:id(.:format)                                                                     lists#update
        #                   PUT    /lists/:id(.:format)                                                                     lists#update
        #                   DELETE /lists/:id(.:format)                                                                     lists#destroy
        #          bookmark DELETE /bookmarks/:id(.:format)                                                                 bookmarks#destroy
