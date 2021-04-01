class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["username"], password: ENV["password"]

  # GET /admin/categories
  def index
    @categories = Category.order(id: :asc).all
  end

  # GET /admin/categories/new
  def new
    @category = Category.new
  end

  # POST /admin/categories
  def create
    @category = Category.new(category_params)
    
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category was successfully created.'
    else
      render :new
    end
  end
  
  # DELETE /admin/categories/1
  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to [:admin, :categories], notice: 'Category was successfully destroyed.' 
  end

  private
    
  def category_params
    params.require(:category).permit(
      :name,
      :category_id
    )
  end
end
