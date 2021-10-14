class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.joins("INNER JOIN products ON products.category_id = categories.id")
    .select('categories.name, Count(products.*)').group('categories.id')
  end
end