require 'date'

class PrettyPrinter
	def print array
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

			elsif item.is_a? Date
				string_to_print << "\t"*deep
				string_to_print << item.to_s
				string_to_print << "\n"
			elsif item.is_a? (Hash)
				string_to_print << "\n"
			
			elsif
			   (item.is_a? Integer) || (item.is_a? String)
				string_to_print << "\t"*deep
				string_to_print << "#{item.to_s}"
				string_to_print << "\n"
			else
				string_to_print << "\t"*deep
				string_to_print << "An object I don't know how to print"
				string_to_print << "\n"
			end
				
		end
	end

end

#puts PrettyPrinter.new.print(["hola", 5,["nivel2", 34, "muy confidencial"], "hhh",[[8,7,8],7]])
#puts PrettyPrinter.new.print([1,2,3,["A","B"]])

a_hash = {key: "value", other_key: "other_value"}
a_date = Date.today


#puts PrettyPrinter.new.print(["My", 3, a_date, ["Pied", "Piper"] ])

RSpec.describe "Pretty Printer" do
	it "print empty string" do
		expect(PrettyPrinter.new.print([])).to eq("Array:\n")
	end
end

RSpec.describe "Pretty Printer" do
	it "print one element" do
		expect(PrettyPrinter.new.print([3])).to eq("Array:\n\t3\n")
	end
end

RSpec.describe "Pretty Printer" do
	it "print two elements" do
		expect(PrettyPrinter.new.print([3, "hola"])).to eq("Array:\n\t3\n\thola\n")
	end
end
