class Admin::CategoriesController < ApplicationController
  before_action :set_admin_category, only: [:show, :edit, :update, :destroy]

  # GET /admin/categories
  def index
    @admin_categories = Admin::Category.all
  end

  # GET /admin/categories/new
  def new
    @admin_category = Admin::Category.new
  end

  # POST /admin/categories
  def create
    @admin_category = Admin::Category.new(admin_category_params)
    
    if @admin_category.save
      redirect_to @admin_category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end
  

  # DELETE /admin/categories/1
  def destroy
    @admin_category.destroy
    redirect_to admin_categories_url, notice: 'Category was successfully destroyed.' 
  end

  private
    
  def category_params
    params.require(:category).permit(:index)
  end
end
