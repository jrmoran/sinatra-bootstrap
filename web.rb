require 'sinatra'
require 'haml'
require 'sass'
require 'compass'
require 'json'
require 'coffee-script'
require 'datamapper'

configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'views'
  end
  set :sass, Compass.sass_engine_options
end

# ## Datasource
# This will use SQLite in development and PostgreSQL under Heroku
#
#     DataMapper::setup(:default, 
#       ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/database.db")

# ## Models
#     class Model
#       include DataMapper::Resource
#       property :id,             Serial
#       property :name,           String
#     end

#     DataMapper.auto_upgrade! unless Model.storage_exists?

before do
  cache_control :public, :must_revalidate, :max_age => 60 * 60 * 24
end

# ## Actions

# ### Homepage
get '/' do
  @env_dev = false
  @obj = 'Hello There'
  haml :index
end

# ## Helpers
# These adds timestamps to js/coffeeScripts and css/sass
helpers do
  def css_v file
    "#{file}.css?" + File.mtime(File.join(
      Sinatra::Application.public, "#{file}.css")).to_i.to_s
  end

  def sass_v file
    "#{file}.css?" + File.mtime(File.join(
      Sinatra::Application.views, "#{file}.sass")).to_i.to_s
  end

  def js_v file
    "#{file}.js?" + File.mtime(File.join(
      Sinatra::Application.public, "#{file}.js")).to_i.to_s
  end

  def coffee_v file
    "#{file}.js?" + File.mtime(File.join(
      Sinatra::Application.views, "#{file}.coffee")).to_i.to_s
  end
end

# ## Assets
get '/style.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :style
end

get '/app.js' do
  coffee :app
end

# ## Errors
error do
  'something went terribly bad'
end

error 400..510 do
  redirect '/'
end
