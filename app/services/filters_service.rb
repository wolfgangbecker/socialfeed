class FiltersService
  # Fetches and parses entries from all feeds of the user and returns them
  def self.create params
    Filter.create params[:filter]
  end

  def self.update params
    Filter.update params[:id], params[:filter]
  end

  def self.edit params
    Filter.find params[:id]
  end

  def self.destroy params
    Filter.destroy params[:id]
  rescue Exception => e
    filter = Filter.find params[:id]
    filter.errors.add(:filter, e.message)
    filter
  end
end