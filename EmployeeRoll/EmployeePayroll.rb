
class EmployeePayRoll
	
	def initialize namefile, input, output, senders
		@name = namefile
		@input = input
		@output = output
		@senders = senders
	end


	def calculate_rolls
		var = @input.readEmployees(@name)
		var.each do |emp|
			roll = emp.calculate_roll
			@output.write("#{emp.name} -> #{roll}")
			emp.sendSalary(roll)

			sender = senders.find_a_sender_for emp.direction
			sender.send

		end
	end

end



class BaseEmployee
	attr_accessor :name, :destSalary ,:salary
	def initialize name, destSalary, salary
		@name = name
		@salary = salary
		@destSalary = destSalary
	end

	def calculate_roll 
		@salary
	end

	def sendSalary
		@destSalary.send
	end
end

class HourEmployee
	attr_accessor :name,:destSalary, :hours, :rate
	def initialize name, destSalary, hours, rate
		@name = name
		@destSalary = destSalary
		@hours = hours
		@rate = rate
	end

	def calculate_roll 
		@hours.to_i * @rate.to_i
		
	end

	def sendSalary
		@destSalary.send
	end
end

class BasePlusHourEmployee
	attr_accessor :name,:destSalary, :salary, :hours, :rate
	def initialize name, destSalary, salary, hours, rate
		@name = name
		@destSalary = destSalary
		@salary = salary
		@hours = hours
		@rate = rate
	end

	def calculate_roll 
		@salary.to_i + @hours.to_i * @rate.to_i
		
	end

	def sendSalary
		@destSalary.send
	end	
end

class PayrollInput

	def readEmployees input
		array = []
		File.open(input, "r") do |f|
			f.each_line do |ln|
				tokens = ln.split(" ")
				tokens.size == 4 ? (e = BaseEmployee.new tokens[1], checkSender(tokens[2]), tokens[3]) : false
				tokens.size == 5 ? (e = HourEmployee.new tokens[1], checkSender(tokens[2]), tokens[3], tokens[4]) : false
				tokens.size == 6 ? (e = BasePlusHourEmployee.new tokens[1], checkSender(tokens[2]), tokens[3], tokens[4], tokens[5]) : false
				array<< e
			end
		end
		array
	end

	def checkSender(str)

		(str[1..-1].include? "@") ? (s = MailSender.new str) : false
		(str[0] == "@") ? (s = TwitterSender.new str) : false
		(str.include? "@") ? true : (s = SmsSender.new str)

		return s
	end
end

class MailSender 
	def initialize str
		@mail = str 
	end
	def send
		puts "Email Mandado a #{@mail}"
	end
end

class TwitterSender 

	def initialize str
		@twitter = str 
	end
	def send
		puts "Twitter publicado por #{@twitter}"
	end
end

class SmsSender 

	def initialize str
		@num = str 
	end

	def send
		puts "Sms enviado a #{@num}"
	end
end

class PayrollOutput

	def write str
		puts str
	end
end

ep = EmployeePayRoll.new("employeesBis.txt", PayrollInput.new, PayrollOutput.new)
ep.calculate_rolls
