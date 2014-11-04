class FileReader

	def read_file file
		array = IO.readlines(file)
	end

	def getCommand
		gets.chomp
	end
end