require 'date'
require './PrintableObjects'

class PrettyPrinter

	def initialize printable_item
		@printable_item = printable_item
	end

	def print array
		string_to_print = "Array:\n"
		deep = 1
		@printable_item.print_item array, string_to_print, deep	
		string_to_print
	end

end




puts PrettyPrinter.new(PrintableItem.new).print(["A"])


RSpec.describe "Pretty Printer" do
	before :each do
		@printer = PrettyPrinter.new(PrintableItem.new)
	end

	it "print empty string" do
		expect(@printer.print([])).to eq("Array:\n")
	end

	it "print one element" do
		class A
		end

		expect(@printer.print([3, A.new])).to eq("Array:\n\t3\n\tAn object I don't know how to print\n")
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
