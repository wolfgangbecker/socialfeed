class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = CategoriesService.create params
    respond_to do |format|
      if @category.errors.empty?
        @categories = Category.all
        @category = Category.new
        format.js { render 'refresh_all', status: :ok }
      else
        format.js { render 'new', status: :ok }
      end
    end
  end

  def destroy
    category = CategoriesService.destroy params
    respond_to do |format|
      if category.errors.empty?
        @categories = Category.all
        format.js { render 'refresh_list', status: :ok }
      else
        format.js { render 'destroy_error', status: :unprocessable_entity }
      end
    end
  end
end
