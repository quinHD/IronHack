require 'matrix'
require './ImdbAdapter'
require './FileReader'

class AsciiRating

	def initialize imdb_conection, file_reader
		@imdb = imdb_conection
		@file_reader = file_reader
		@rating_matrix = Matrix[]

	end

	def show_ratings
		film_list = get_films()
		

		film_list.each do |film| 
			add_rating_to_matrix @imdb.get_rating(film).ceil
		end
		
		draw_graph

		film_list.each_with_index do |title, i|
			puts "#{i+1}. #{title}"
		end

	end

	def get_films
		@file_reader.read_file
	end

	def draw_graph
		rating_matrix_t = @rating_matrix.transpose

		(0..rating_matrix_t.row_count()-1).each do | i|
			row =  rating_matrix_t.row(i)
			
			(0..row.size()-1).each do |j|

				if rating_matrix_t.element(i,j) == 0
					print " "
				else
					print "#"
				end
			end
				print("\n")
						
		end

	end

	def add_rating_to_matrix rating
		row = []
		(0..9).each do |i|
			
			if i< rating
				row << 1
			else
				row.insert(0,0)
			end
		end

		@rating_matrix = Matrix.rows(@rating_matrix.to_a << row)

	end

end

(AsciiRating.new ImdbAdapter.new ,(FileReader.new "films.txt")).show_ratings