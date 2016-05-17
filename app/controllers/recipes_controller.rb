class RecipesController < ApplicationController

def index
  @recipes = Recipe.all
end
def show
    @recipe = Recipe.find(params[:id])
end
def new
  @recipe = Recipe.new
end 
def create 
  @recipe = Recipe.new(recipe_params)
  @recipe.chef = Chef.find(2)  #after parivate create this type
  
  if @recipe.save
    flash[:success] = "your recipe was cretaed successfully"
    redirect_to recipes_path
  else
    render :new
  end
end

def edit
  @recipe = Recipe.find(params[:id])
end

def update
  @recipe = Recipe.find(params[:id])
  if @recipe.update(recipe_params)
    flash[:success] = "your recipe was updated successfully"
    redirect_to recipes_path(@recipe)
    
  else
    render :edit
  end
  

end





private 
def recipe_params
  params.require(:recipe).permit(:name, :summery, :description, :picture)
end
end

