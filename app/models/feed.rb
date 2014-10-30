class Feed < ActiveRecord::Base

  fields do
  	url :string
  end
  attr_accessible :url

  def get_entries
  	Feedjira::Feed.fetch_and_parse(url).entries
  end

end
