require 'date'

class PrintableItem 

	def print_item array, string_to_print, deep

		array.each do |item|	
			p=""
			(item.is_a? Array) ? p = PrintableArray.new  : false
			(item.is_a? Date) ? p = PrintableDate.new : false
			(item.is_a? String) ? p = PrintableString.new : false
			(item.is_a? Integer) ? p = PrintableInteger.new : false
			p == "" ? p = NoPrintable.new : false
			p.pretty_print item, string_to_print, deep
		end

	end

end


class PrintableArray

	def pretty_print item, string_to_print, deep
		string_to_print << "\t"*deep
		string_to_print << "Array: \n"
		deep+=1
		print_item item, string_to_print, deep
		deep -=1

	end
end

class PrintableInteger

	def pretty_print item, string_to_print, deep
		string_to_print << "\t"*deep
		string_to_print << "#{item.to_s}"
		string_to_print << "\n"
		string_to_print
	end
end

class PrintableHash

	def pretty_print item, string_to_print, deep
		string_to_print << "\t"*deep
		string_to_print << "Hash: \n"
		item.each do |key, value|
			string_to_print << "\t"*(deep+1)
			string_to_print << "#{key} -> #{value}"
			string_to_print << "\n"
		end

	end
end

class NoPrintable

	def pretty_print item, string_to_print, deep
		string_to_print << "\t"*deep
		string_to_print << "An object I don't know how to print"
		string_to_print << "\n"

	end
end

class PrintableString

	def pretty_print item, string_to_print, deep
		string_to_print << "\t"*deep
		string_to_print << "#{item.to_s}"
		string_to_print << "\n"

	end
end

class PrintableDate

	def pretty_print item, string_to_print, deep
		string_to_print << "\t"*deep
		string_to_print << item.to_s
		string_to_print << "\n"

	end
end