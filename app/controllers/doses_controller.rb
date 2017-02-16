class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all
  end

  def create
    @dose = Dose.new(params_dose)
    cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = cocktail
    if @dose.save
      redirect_to cocktail_path(cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(cocktail)
  end

  private
  def params_dose
    params.require(:dose).permit(:description, :ingredient_id)

  end
end
