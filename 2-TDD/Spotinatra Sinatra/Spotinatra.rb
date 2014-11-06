require 'sinatra'
require 'sinatra/reloader' if development?

set :port,3000
set :bind, '0.0.0.0'

get '/' do
	erb :index
end

post '/songs/new' do
	erb :index
end