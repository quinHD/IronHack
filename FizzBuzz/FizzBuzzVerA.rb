=begin
	Name: FizzBuzz
	Description:  program that prints the numbers from 1 to 100. But for multiples of three print "Fizz" 
		instead of the number and for the multiples of five print "Buzz". For numbers which are multiples of both three and five print "FizzBuzz".
	Created by: Joaquín Rodríguez
	Date: 23/10/2014
=end

class FizzBuzz
	def initialize
		for i in 1..100
			var = "#{i}"
			if(i%3 == 0)
				var= "Fizz"
			end
			if(i%5 == 0)
				var= var.delete('^a-zA-Z') +"Buzz"
			end

			puts var
		end
	end
end

FizzBuzz.new