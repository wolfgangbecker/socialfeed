class CategoriesService
  # Fetches and parses entries from all feeds of the user and returns them
  def self.create user, params
    Category.create params[:category]
  end
end