require './FileReader'

class Anagrams


	def initialize dictionary_reader="", file_reader= FileReader.new
		@dictionary_reader = dictionary_reader
		@file_reader = file_reader
	end


	def calculate_anagrams str
		
		permutations_preprocesed = str.split("").permutation.to_a

		permutations_preprocesed.map do |per|
			 (per.join(",")).gsub(",","")
		end
	end

	def validate_anagrams 
		list_of_inputs = @file_reader.read_file "input_anagrams.txt"
		
		dictionary = @dictionary_reader.get_dictionary
		hash_final = Hash.new
	

		list_of_inputs.each do|input|
			final=[]
			permutations = calculate_anagrams input
			permutations.each do|element|
				dictionary.select do |elem| element == elem end
				end
			end
			puts 
		end		

		#print_hash hash_final

	end

	def print_hash hash_final
		string = ""

		hash_final.each_with_index do |(key,value),i|
			string << "#{i+1} #{value}" 
			string << "\n"

		end

		string



	end
end



