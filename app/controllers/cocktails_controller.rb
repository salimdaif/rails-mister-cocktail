class CocktailsController < ApplicationController
  def index
    if params[:search]
      @cocktails = Cocktail.where("lower(name) LIKE ?", "%#{params[:search].downcase}%")
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  private
  def params_cocktail
    params.require(:cocktail).permit(:name, :photo, :photo_cache)
  end
end
