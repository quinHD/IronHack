require 'imdb'

class ImdbAdapter

	def get_rating title
		film = Imdb::Search.new(title)
		film.movies[0].rating
	end
end