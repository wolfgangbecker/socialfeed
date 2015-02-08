class EntriesService
	# Fetches and parses entries from all feeds of the user and returns them
  def self.latest_entries user, quantity
    feeds = Feed.all
    begin
    	feeds.each(&:update_entries)
    rescue Exception => e
    end
    entries = feeds.map{ |feed| feed.get_latest_entries(quantity) }
    entries.flatten.sort.slice 0, quantity
  end

  def self.update user, params
    Entry.update params[:id], params[:entry]
  end

  # Returns the database stored entries of all feeds from the user
  def self.current_entries quantity, search_params = nil
    q = search_params ? search_params[:q] : nil
    search = Entry.ransack(q)
    if search_params && search_params[:q].blank? && !search_params[:category].blank?
      categories = Category.find search_params[:category]
      entries = categories.map{|category| category.feeds.map {|feed| feed.entries }}
      entries.flatten!
      entries = entries.sort.slice(0..quantity)
    else
      entries = search.result(distinct: true).order('published_at desc').first(quantity)
    end
    [entries, search]
  end
end