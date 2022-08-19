class ListsController < ApplicationController
  before_action :find_list, only: [:show, :destroy]

  # Un utilisateur peut voir toutes les listes
  # GET "lists"
  def index
    @lists = List.all
  end

  # Un utilisateur peut voir les détails d’une liste donnée et son nom
  # GET "lists/42"
  def show
    # @list = List.find(params[:id])

    # @bookmark = Bookmark.new QUID ??
    # @review = Review.new(list: @list) QUID ??
  end

  # Un utilisateur peut créer une nouvelle liste
  # GET "lists/new"
  # POST "lists"
  def new
    @list = List.new
  end

  # rediriger vers la show /list
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def find_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
