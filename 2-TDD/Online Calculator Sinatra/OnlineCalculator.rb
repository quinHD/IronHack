require 'sinatra'
require 'sinatra/reloader' if development?
require './Calculator'

set :port,3000
set :bind, '0.0.0.0'

get '/' do
	erb :index
end

get '/counting' do
	@str = (1..200).to_a
	erb :counting
end

post '/result' do
	calculator = Calculator.new

	numA = params["operatorA"].to_i
	numB = params["operatorB"].to_i
	operation = params["do_operation"]
	
	@result =calculator.add(numA,numB) if operation == "add" 
	@result =calculator.subtract(numA,numB) if operation == "minus" 		
	@result =calculator.times(numA,numB) if operation == "times" 
	@result =calculator.divide(numA,numB) if operation == "divide"


	erb :result
end


