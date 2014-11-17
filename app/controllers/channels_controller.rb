class ChannelsController < ApplicationController
  respond_to :html

  def index
    @entries = ChannelsService.get_all_entries
    respond_with @entries
  end

end
