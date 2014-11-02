class FileReader

	def initialize file
		@file = file
	end

	def read_file file = @file
		array = IO.readlines(file)
	end

	def getCommand
		gets.chomp
	end
end