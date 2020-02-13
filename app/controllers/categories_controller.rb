class CategoriesController < ApplicationController
  def index
    @categories = Category.all  
  end
  def show
    @category = Category.friendly.find(params[:id])

  end
  def new
    @category = Category.new
  end
  def edit
    @category = Category.find(params[:id])
  end
  def create
    @category = Category.new(set_param)
    #@category.name = params["category"]["name"]
    #@category.description = params["category"]["description"]
    
      if @category.save
        redirect_to category_path(@category)
      else
        redirect_to new_category_path
      end
 end

  def update
   @category = Category.find(params[:id])
   @category.name = params["category"]["name"]
   @category.description = params["category"]["description"]
   if @category.save
     redirect_to category_path(@category.id)
   else
     render action: 'edit'
   end
 end
 
 def destroy
  @category = Category.find(params[:id])
  @category.destroy
  redirect_to categories_path
 end  
 
 private

   def set_param
    params.require(:category).permit(:name, :description) 
  end  
end

