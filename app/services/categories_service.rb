class CategoriesService
  # Fetches and parses entries from all feeds of the user and returns them
  def self.create params
    Category.create params[:category]
  end

  def self.update params
    Category.update params[:id], params[:category]
  end

  def self.destroy params
    Category.destroy params[:id]
  rescue Exception => e
    category = Category.find params[:id]
    category.errors.add(:category, e.message)
    category
  end
end