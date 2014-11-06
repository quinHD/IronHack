require 'sinatra'
require "sinatra/reloader" if development?
require 'artii'


set	:port, 3000
set :bind, '0.0.0.0'


get '/' do
	"Qué hacés aquí"
end

get '/ascii/:item' do
	sentence = params[:item]
	
	@ascii_arti =  convert_string_to_ascii sentence

	erb :index
end


def convert_string_to_ascii str 

	@asc = "\n#{(Artii::Base.new).asciify(str)}"
end

