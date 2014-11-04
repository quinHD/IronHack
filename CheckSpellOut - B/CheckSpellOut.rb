class CheckSpellOut

	def initialize 
		@to_19_array=[
			"zero",
			"one",
			"two",
			"three",
			"four",
			"five",
			"six",
			"seven",
			"eight",
			"nine",
			"teen",
			"eleven",
			"twelve",
			"thirteen",
			"fourteen",
			"fifteen",
			"sixteen",
			"seventeen",
			"eigteen",
			"nineteen"
		]

		@to_tens_array= [
			"",
			"",
			"twenty",
			"thirty",
			"fourty",
			"fifty",
			"sixty",
			"seventy",
			"eighty",
			"ninety"
		]

		@amounts_array = [
			"",
			"thousand",
			"millions",
			"billions",
			"trillion"
		]
		@str_total = ""
	end

	def spell num
		start_spell num
	end

	def start_spell num
		if(num >0)
			if num <100
				to_tens num
			elsif num <999
				to_hundreds num
			else
				start_spell/1000
			end
		else
			return @str_total
		end

	end 

	def to_tens num 
		if(num<20)
			@str_total << @to_19_array[num].to_s
		elsif (num<100)
			if(num % 10 == 0)
				@str_total <<"#{@to_tens_array[num/10]}"
			else
				@str_total <<"#{@to_tens_array[num/10]} #{@to_19_array[num%10]}"
			end
		end

		return @str_total
	end

	def to_hundreds num
		if num>= 100 && num <999
			@str_total << "#{to_tens(num/100)} hundred "
			return @str_total
		end
		
	end
end


RSpec.describe "Check Spell Out" do
	before :each do
		@speller = CheckSpellOut.new()
	end

	it "print number 0" do
		expect(@speller.spell(0)).to eq("zero")
	end

	it "print number 1" do
		expect(@speller.spell(1)).to eq("one")
	end

	it "print number 3" do
		expect(@speller.spell(3)).to eq("three")
	end

	it "print number 6" do
		expect(@speller.spell(6)).to eq("six")
	end

	it "print number 9" do
		expect(@speller.spell(9)).to eq("nine")
	end

	it "print number 19" do
		expect(@speller.spell(19)).to eq("nineteen")
	end

	it "print number 23" do
		expect(@speller.spell(23)).to eq("twenty three")
	end

	it "print number 20" do
		expect(@speller.spell(20)).to eq("twenty")
	end

	it "print number 35" do
		expect(@speller.spell(35)).to eq("thirty five")
	end

	it "print number 99" do
		expect(@speller.spell(99)).to eq("ninety nine")
	end

	it "print number 255" do
		expect(@speller.spell(255)).to eq("two hundred fifty five")
	end

	it "print number 999" do
		expect(@speller.spell(999)).to eq("nine hundred ninety nine")
	end

	it "print number 2565" do
		expect(@speller.spell(2565)).to eq("two thousand five hundred sixty five")
	end

	it "print number 32565" do
		expect(@speller.spell(32565)).to eq("thirty two thousand five hundred sixty five")
	end

end