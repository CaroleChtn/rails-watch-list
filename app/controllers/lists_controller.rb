class ListsController < ApplicationController
  # Un utilisateur peut voir toutes les listes
  # GET "lists"
  def index
    @lists = List.all
  end

  # Un utilisateur peut voir les détails d’une liste donnée et son nom
  # GET "lists/42"
  def show
    @list = List.find(params[:id])
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

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
