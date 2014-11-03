class StringCalculator

	def add str 
		chars = str.split(',')
		chars.inject(0) { |sum, n| 
			puts n
			puts sum
			sum + n
		 }  

	end

end
StringCalculator.new.add("2,3,4")
=begin
RSpec.describe "String Calculator" do
	it "zero digits" do
		expect(StringCalculator.new.add("")).to eq(0)
	end

	it "one digit" do
		expect(StringCalculator.new.add("5")).to eq(5)
	end

	it "two digits" do
		expect(StringCalculator.new.add("3,2")).to eq(5)
	end

	it "three digits" do
		expect(StringCalculator.new.add("1,2,3")).to eq(6)
	end

	it "slash n" do
		expect(StringCalculator.new.add("1,2\n3")).to eq(6)
	end

	it "slash n" do
		expect(StringCalculator.new.add("\n1,2,3")).to eq(6)
	end

	it "delimiter" do
		expect(StringCalculator.new.add("//;\n1;2;3")).to eq(6)
	end

	it "long delimiter" do
		expect(StringCalculator.new.add("//pollo\n1pollo2pollo3")).to eq(6)
	end

	it "negatives" do
		expect(StringCalculator.new.add("1;-2;3")).to eq(4)
	end
end

=end