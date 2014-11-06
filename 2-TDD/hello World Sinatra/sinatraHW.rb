require 'sinatra'
require "sinatra/reloader" if development?
require 'date'


set	:port, 3000
set :bind, '0.0.0.0'

get '/' do
	puts "hola"
	erb :index
end
