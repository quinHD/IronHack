
class EmployeePayRoll
	
	def initialize namefile, input, output
		@name = namefile
		@input = input
		@output = output
	end

	def calculate_rolls
		var = @input.read(@name)
		var.each do |ln|
			tokens = ln.split(" ")
			tokens.size == 3 ? (e = BaseEmployee.new tokens[1], tokens[2]) : false
			tokens.size == 4 ? (e = HourEmployee.new tokens[1], tokens[2], tokens[3]) : false
			tokens.size == 5 ? (e = BasePlusHourEmployee.new tokens[1], tokens[2], tokens[3], tokens[4]) : false
		
			@output.write("#{e.name} -> #{e.calculate_roll}")
		end
	end

end

class BaseEmployee
	attr_accessor :name, :salary
	def initialize name, salary
		@name = name
		@salary = salary
	end

	def calculate_roll 
		@salary
	end
end

class HourEmployee
	attr_accessor :name, :hours, :rate
	def initialize name, hours, rate
		@name = name
		@hours = hours
		@rate = rate
	end

	def calculate_roll 
		@hours.to_i * @rate.to_i
		
	end
end

class BasePlusHourEmployee
	attr_accessor :name, :salary, :hours, :rate
	def initialize name, salary, hours, rate
		@name = name
		@salary = salary
		@hours = hours
		@rate = rate
	end

	def calculate_roll 
		@salary.to_i + @hours.to_i * @rate.to_i
		
	end
end

class PayrollInput

	def read input
		array = []
		File.open(input, "r") do |f|
			f.each_line do |ln|
				array << ln 
			end
		end
		array
	end
end

class PayrollOutput

	def write str
		puts str
	end
end



ep = EmployeePayRoll.new("employees.txt", PayrollInput.new, PayrollOutput.new)
ep.calculate_rolls
