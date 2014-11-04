def wordSorting(sentence)
	puts "Frase original:  #{sentence}"
	sentence.gsub!(/[^0-9a-z' '']/i, '')
	tokens = sentence.split(" ")

	tokens.sort!{|a,b|a.upcase <=> b.upcase}
end

puts wordSorting("¡Primera clase de orientacion a Objetos!")