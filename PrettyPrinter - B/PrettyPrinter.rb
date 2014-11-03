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
				string_to_print << "\t"*deep
				string_to_print << "Hash: \n"
				item.each do |key, value|
					string_to_print << "\t"*(deep+1)
					string_to_print << "#{key} -> #{value}"
					string_to_print << "\n"

				end
			
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




puts PrettyPrinter.new.print()


RSpec.describe "Pretty Printer" do
	before :each do
		@printer = PrettyPrinter.new
	end

	it "print empty string" do
		expect(@printer.print([])).to eq("Array:\n")
	end

	it "print one element" do
		expect(@printer.print([3])).to eq("Array:\n\t3\n")
	end

	it "print two elements" do
		expect(@printer.print([3, "hola"])).to eq("Array:\n\t3\n\thola\n")
	end

	it "print 5 element including hash, date, array" do
		a_hash = {key: "value", colors: ["red", "green", "white"]}
		a_date = Date.today
		expect(@printer.print(["My", 3,a_hash, a_date, ["Pied", "Piper"] ])).to eq("Array:\n\tMy\n\t3\n\tHash: \n\t\tkey -> value\n\t\tcolors -> [\"red\", \"green\", \"white\"]\n\t2014-11-03\n\tArray: \n\t\tPied\n\t\tPiper\n")
	end

	it "print many nested arrays" do
		a_hash = {key: "value", colors: ["red", "green", "white"]}
		a_date = Date.today
		expect(@printer.print([[[[["A","B"],"C"],"D"],"E"],"F"])).to eq("Array:\n\tArray: \n\t\tArray: \n\t\t\tArray: \n\t\t\t\tArray: \n\t\t\t\t\tA\n\t\t\t\t\tB\n\t\t\t\tC\n\t\t\tD\n\t\tE\n\tF\n")
	end


end
