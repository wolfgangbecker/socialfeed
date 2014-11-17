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

  task :create_users => [:environment] do
    puts "Creating Users"
    User.create! name: 'pepe', email: 'pepe@pepe.com', password: 'pepepepe'
    User.create! name: 'jose', email: 'jose@jose.com', password: 'josejose'
    User.create! name: 'raul', email: 'raul@raul.com', password: 'raulraul'
    User.create! name: 'manuel', email: 'manuel@manuel.com', password: 'manuelmanuel'
  end

  task :create_categories => [:environment] do
    puts "Creating Categories"
    Category.create! name: 'News', description: 'Politics, Economy and Entertainment', user_id: User.where(name: 'jose').first.id
    Category.create! name: 'Sports', description: 'Football, Volleyball and Basketball', user_id: User.where(name: 'pepe').first.id
    Category.create! name: 'Technology', description: 'Games, Mobile and Web applications news', user_id: User.where(name: 'pepe').first.id
  end

  task :create_channels => [:environment] do
    puts "Creating Channels"
    Channel.create! title: 'News', description: 'Politics, Economy and Entertainment', url: 'http://www.theguardian.com/uk/rss'
    Channel.create! title: 'Sports', description: 'Football, Volleyball and Basketball', url: 'https://sports.yahoo.com/blogs/rss.xml'
    Channel.create! title: 'Technology', description: 'Games, Mobile and Web applications news', url: 'someurl'
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