class PrettyPrinter

	def pretty_print array
		string_to_print = "Array:\n"
		deep = 1
		create_string_to_print array, string_to_print, deep
		string_to_print
	end

	def create_string_to_print array, string_to_print, deep
		array.each do |item|
			if item.is_a? Array
				string_to_print << "\t"*deep
				string_to_print << "Array: \n"
				deep+=1
				create_string_to_print item, string_to_print, deep
				deep -=1	

			else
				string_to_print << "\t"*deep
				string_to_print << "#{item.to_s}"
				string_to_print << "\n"
			end
				
		end
	end

end

#puts PrettyPrinter.new.pretty_print(["hola", 5,["nivel2", 34, "muy confidencial"], "hhh",[[8,7,8],7]])
#puts PrettyPrinter.new.pretty_print([[1,2],[[3,4],5],6])

RSpec.describe "Pretty Printer" do
	it "print empty string" do
		expect(PrettyPrinter.new.pretty_print([])).to eq("Array:\n")
	end
end

RSpec.describe "Pretty Printer" do
	it "print one element" do
		expect(PrettyPrinter.new.pretty_print([3])).to eq("Array:\n\t3\n")
	end
end

RSpec.describe "Pretty Printer" do
	it "print two elements" do
		expect(PrettyPrinter.new.pretty_print([3, "hola"])).to eq("Array:\n\t3\n\thola\n")
	end
end

RSpec.describe "Pretty Printer" do
	it "print two arrays" do
		expect(PrettyPrinter.new.pretty_print("")
	end
end