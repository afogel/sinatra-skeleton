# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)
require 'rack/protection'

set :app_file, __FILE__
set :session_secret, 'asdfa2342923422f1adc05c837fa234230e3594b93824b00e930ab0fb94b'

#Enable sinatra sessions
use Rack::Session::Cookie, :key => '_rack_session',
                           :path => '/',
                           :expire_after => 2592000, # In seconds
                           :secret => settings.session_secret
use Rack::Protection
run Sinatra::Application
