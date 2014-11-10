require 'sinatra'
require 'sinatra/reloader' if development?
also_reload './*.rb'
require './ImdbQuizz'
require 'imdb'

set	:port, 3000
set :bind, '0.0.0.0'


get '/' do
	erb :index

end

post '/play' do
	searching_criteria = params[:word]

	imdb_quizz = ImdbQuizz.new

	@posters = imdb_quizz.get_posters searching_criteria
	puts @poster
	winner_position = imdb_quizz.get_winner @posters.size
	winner_film = @posters[winner_position]

	@winner_year = winner_film[:year]


	erb :play	
end



