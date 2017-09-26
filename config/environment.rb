require 'rubygems'
require 'bundler/setup'

require 'active_support/all'

# Load Sinatra Framework (with AR)
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/contrib/all' # Requires cookies, among other things

# Load environment variables
require 'dotenv'
Dotenv.load

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

# Global Sinatra configuration

  configure do
    set :root, APP_ROOT.to_path
    set :server, :puma
    set :session_secret, ENV['SESSION_KEY'] || 'sinatra_skeleton_secret'
    set :views, File.join(Sinatra::Application.root, "app", "views")
  end

  # Development and Test Sinatra Configuration
  configure :development, :test do
    require 'pry-byebug'
  end

  # Production Sinatra Configuration
  configure :production do
    # NOOP
  end

  # Set up the database and models
  configure :development do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end
  configure do
    # Load all models from app/models, using autoload instead of require
    # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
    Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
      filename = File.basename(model_file).gsub('.rb', '')
      autoload ActiveSupport::Inflector.camelize(filename), model_file
    end
  end

  # Load the routes / actions
  require APP_ROOT.join('app', 'actions')
  puts Dir[APP_ROOT.join('app', 'routes', '**')]
  Dir[APP_ROOT.join('app', 'routes', '**')].each do |route|
    require route
  end
