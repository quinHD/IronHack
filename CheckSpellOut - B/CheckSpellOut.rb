class CheckSpellOut

	def initialize 
		@array_units_tens_number_to_letter=[
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

		@hash_tens_prefix = {
			"2" => "twenty",
			"3" => "thirty",
			"4" => "fourty",
			"5" => "fifty",
			"6" => "sixty",
			"7" => "seventy",
			"8" => "eighty",
			"9" => "ninety"
		}
	end

	def spell num
		if num< 20
			return @array_units_tens_number_to_letter[num]
		else
			str = ""
			str << @hash_tens_prefix[(num / 10).to_s]
			
			if( num % 10 >0)
				str << "-"
				str << @array_units_tens_number_to_letter[num % 10]
			end
			return str
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
		expect(@speller.spell(23)).to eq("twenty-three")
	end

	it "print number 20" do
		expect(@speller.spell(20)).to eq("twenty")
	end

	it "print number 35" do
		expect(@speller.spell(35)).to eq("thirty-five")
	end

end