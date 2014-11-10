require './ImdbAdapter'

class ImdbQuizz 

	def initialize(movie_searcher=ImdbAdapter.new)
		@imdb_adapter = movie_searcher
	end

	def get_posters film
		@imdb_adapter.get_posters film

	end

	def get_winner size
		rand(size)+1

	end
end

class FilmStub
	attr_accessor :title, :poster, :year

	def initialize title, poster, year
		@title = title
		@poster = poster
		@year = year
	end
end

class ImdbAdapterStub 
	def get_posters film
		[
			{:film=>"Die Hard",:poster=>"http://ia.media-imdb.com/images/M/MV5BMTY4ODM0OTc2M15BMl5BanBnXkFtZTcwNzE0MTk3OA@@._V1_SX640_SY720_.jpg", :year=>1988},
			{:film=>"Hard Candy",:poster=>"http://ia.media-imdb.com/images/M/MV5BMTY4ODM0OTc2M15BMl5BanBnXkFtZTcwNzE0MTk3OA@@._V1_SX640_SY720_.jpg",:year=>2000}
		]
	end
end

