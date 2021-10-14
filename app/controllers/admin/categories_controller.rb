class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.joins("LEFT JOIN products ON products.category_id = categories.id")
    .select('categories.name, Count(products.*)').group('categories.id')
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end


end