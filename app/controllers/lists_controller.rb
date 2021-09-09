class ListsController < ApplicationController

  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def edit
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to lists_path, notice: 'List was successfully created.'
    else
      render :new
    end
  end


  def update
    if @list.update(list_params)
      redirect_to @list
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
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
