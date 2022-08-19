class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy
  before_action :find_list, only: %i[new create]

  # Un utilisateur peut voir tous les bookmarks liés à une list id
  # POST "lists/42/bookmarks"


  # Un utilisateur peut voir les détails d’un bookmark (le comment)
  # GET "lists/42"

  # Un utilisateur peut créer un nouveau bookmark lié à une liste
  # GET "lists/42/bookmarks/new"
  def new
    # @bookmark = Bookmark.find(params[:bookmark_id])
    @bookmark = Bookmark.new
  end

  # rediriger vers la show /list
  def create
    @bookmark = Bookmark.new(bookmark_params)
    # @bookmark = Bookmark.find(params[:bookmark_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end
  # redirect to la SHOW : on et @list le arobase car on n'est pas dans un itération donc faut appeler le @

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end
  # il n'y a pas de SHOW de bookmark. C'est la même SHOW que pour list.

  private

  def find_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
  # on passe le paramètre :movie_id

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
