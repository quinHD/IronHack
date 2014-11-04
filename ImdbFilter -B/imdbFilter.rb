require 'imdb'



class ImdbFilter

	def initialize
		@bad_words = ["fuck", "bitch", "slut", "whore", "asshole"]
		@good_words = ["f**k", "b***h", "s**t", "w***e", "a*****e"]
	end

	def filter film

		search = Imdb::Search.new(film)

		if(film != "")
			movies = search.movies
			puts movies.first.title
			plot = movies.first.plot

			@bad_words.each_with_index do |b_word, i|
				plot.gsub!(b_word, @good_words[i])

			end

		end

		return  movies.first.plot

	end

end


RSpec.describe "Check Spell Out" do
	before :each do
		@imdb = ImdbFilter.new()
	end

	it " no film" do
		expect(@imdb.filter("")).to eq("")
	end

	it "Ruby Sparks" do
		expect(@imdb.filter("Ruby Sparks")).to eq("A novelist struggling with writer's block finds romance in a most unusual way: by creating a female character he thinks will love him, then willing her into existence.")
	end


end