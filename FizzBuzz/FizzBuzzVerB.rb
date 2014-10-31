=begin
	Name: FizzBuzz
	Description:  program that prints the numbers from 1 to 100. But for multiples of three print "Fizz" 
		instead of the number and for the multiples of five print "Buzz". For numbers which are multiples of both three and five print "FizzBuzz".
	Created by: Joaquín Rodríguez
	Date: 23/10/2014
=end

class FizzBuzz
	def initialize
		start = Time.now
		for i in 1..100
			if(i%3 == 0)
				print "Fizz"
			end
			if(i%5 == 0)
				print "Buzz"
			end

			if(i%3 != 0  && i%5 !=0)
				print i
			end
			print ("\n")

		end

		finish = Time.now

		puts finish-start

	end
end

FizzBuzz.new