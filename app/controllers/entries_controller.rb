class EntriesController < ApplicationController
	respond_to :html

  def index
    @entries = EntriesService.current_entries current_user, 10
    @entries = EntryDecorator.decorate_collection @entries
    respond_with @entries
  end

  def show
    @entry = Entry.find params[:id]
  end

  def update
  	@entry = EntriesService.update current_user, params
  	respond_to do |format|
  		if @entry.errors.empty?
  			format.html { 
  				@entries = EntriesService.current_entries current_user, 10
    			@entries = EntryDecorator.decorate_collection @entries
  				render 'index' }
	      format.json { render json: @entry, status: :ok }
  		else
  			format.html { 
  				@entries = EntriesService.current_entries current_user, 10
    			@entries = EntryDecorator.decorate_collection @entries
  				render 'index' }
  			format.json { render json: @entry.errors.full_messages, status: :unprocessable_entity }
    	end
  	end
  end
end
