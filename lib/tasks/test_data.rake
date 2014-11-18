namespace :demo do
  desc <<-DESC
    Load testing data.
    Run using the command 'rake demo:load_data'
  DESC

  task :reset => [:environment] do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
  end

  task :load_all => [:environment] do
    puts "Loading All"
    Rake::Task["demo:create_users"].execute
    Rake::Task["demo:create_categories"].execute
    Rake::Task["demo:create_feeds"].execute
  end

  task :create_users => [:environment] do
    puts "Creating Users"
    User.create!(name: 'pepe', email: 'pepe@pepe.com', password: 'pepepepe') unless User.exists? email: 'pepe@pepe.com'
    User.create!(name: 'jose', email: 'jose@jose.com', password: 'josejose') unless User.exists? email: 'jose@jose.com'
    User.create!(name: 'raul', email: 'raul@raul.com', password: 'raulraul') unless User.exists? email: 'raul@raul.com'
    User.create!(name: 'manuel', email: 'manuel@manuel.com', password: 'manuelmanuel') unless User.exists? email: 'manuel@manuel.com'
  end

  task :create_categories => [:environment] do
    puts "Creating Categories"
    Category.create!(name: 'News', description: 'Politics, Economy and Entertainment', user_id: User.where(name: 'jose').first.id) unless Category.exists? name: 'News', user_id: User.where(name: 'jose').first.id
    Category.create!(name: 'Sports', description: 'Football, Volleyball and Basketball', user_id: User.where(name: 'pepe').first.id) unless Category.exists? name: 'Sports', user_id: User.where(name: 'pepe').first.id
    Category.create!(name: 'Technology', description: 'Games, Mobile and Web applications news', user_id: User.where(name: 'pepe').first.id) unless Category.exists? name: 'Technology', user_id: User.where(name: 'pepe').first.id
  end

  task :create_feeds => [:environment] do
    puts "Creating Feeds"
    Feed.create! name: 'News', description: 'Politics, Economy and Entertainment', url: 'http://www.theguardian.com/uk/rss'
    Feed.create! name: 'Sports', description: 'Football, Volleyball and Basketball', url: 'https://sports.yahoo.com/blogs/rss.xml'
    Feed.create! name: 'Technology', description: 'Games, Mobile and Web applications news', url: 'someurl'
  end

  task :create_filters => [:environment] do
    # puts "Creating Filters"
    # Filter.create! title: 'News', description: 'Politics, Economy and Entertainment', url: 'someurl'
  end

  task :create_notifications => [:environment] do
    # puts "Creating Notifications"
    # Notification.create! title: 'News', description: 'Politics, Economy and Entertainment', url: 'someurl'
  end

end