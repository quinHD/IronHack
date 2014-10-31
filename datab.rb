require 'imdb'
i = Imdb::Movie.new("0095016")
puts i.title

puts i.cast_members
