require 'rubygems'
require 'vendor/sinatra/lib/sinatra.rb'

Sinatra::Application.set :run, false
Sinatra::Application.set :environment, :production

require 'epoxys.rb'
run Sinatra::Application