class CategoriesController < ApplicationController

  def index
    @categories = Category.order('name desc').all
    @category = Category.new
  end

  def show
    @categories = [Category.find(params[:id])]
    @category = Category.new
    respond_to do |format|
      format.html { render 'index', status: :ok }
    end
  end

  def new
    @category = Category.new
    respond_to do |format|
      format.js { render 'refresh_form', status: :ok }
    end
  end

  def edit
    @category = CategoriesService.edit params
    respond_to do |format|
      if @category.errors.empty?
        format.js { render 'refresh_form', status: :ok }
      else
        @error = @category.errors.full_messages.first
        format.js { render 'error', status: :ok }
      end
    end
  end

  def update
    @category = CategoriesService.update params
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
        @error = category.errors.full_messages.first
        format.js { render 'error', status: :unprocessable_entity }
      end
    end
  end
end
