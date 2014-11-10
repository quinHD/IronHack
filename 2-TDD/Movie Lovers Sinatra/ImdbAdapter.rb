
class ImdbAdapter

	def search_films criteria
		(Imdb::Search.new criteria.to_s).movies

	end

	def get_posters film
		array_films = search_films film
		films_for_game = []
		
		i=0
		while films_for_game.length < 6 && i<array_films.size do
			film = array_films[i]

			if film.poster != ""
				film_data = {
					:film => film.title,
					:poster => film.poster,
					:year => film.year}
				films_for_game << film_data
			end
			i += 1
		end
		films_for_game
	end
end
