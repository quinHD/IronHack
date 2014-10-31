class Cesar

	def initialize(sentence, shift)
    	@sentence = sentence
    	if shift == "" || shift.to_i.to_s != shift
    		@shift = 3
    	else
    		@shift = shift
    	end
  	end

  	def self.new_bis(sentencia)
  		Cesar.new(sentencia, 3)

  	end

  	def codifica
		snt = ""
		@sentence.each_char do |c|

			if(c.ord+@shift.to_i > 122)
				sh = c.ord + (@shift.to_i) -122 + 96
				snt.concat(sh.chr)
			else
				if (c.ord+@shift.to_i < 97)
					sh = c.ord + (@shift.to_i) +123 - 97
					snt.concat(sh.chr)
					
				else
					snt.concat((c.ord+@shift.to_i).chr)
				end

			end
		end
		snt
	end

	def decodifica
		@shift = 25-@shift.to_i
		codifica
		
	end
end

puts "\nInsert sentence: "	
sentence = gets.chomp.downcase

puts "\nInsert shift: "	
shift = gets.chomp

c = Cesar.new(sentence, shift)
#c = Cesar.new_bis(sentence)

puts "Cadena codificada:  #{c.decodifica}"