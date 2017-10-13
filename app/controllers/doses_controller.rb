class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]

  def new
    # @dose = Dose.new
    # @array_ingredients = []
    # @ingredients = Ingredient.all
    # @ingredients.each do |ingredient|
    #   @array_ingredients << ingredient
    # end
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.build
    # .build is method for active record.
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end
end
