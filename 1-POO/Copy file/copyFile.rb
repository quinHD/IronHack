=begin
	Name: Copy File
	Description: Script that asks for two file names and copies the contents of one into the other.
	Created by: Joaquín Rodríguez
	Date: 22/10/2014
=end

puts "What is the source file?"
sourceFile = gets.chomp

if(File.exists?(sourceFile))
	puts "What is the destiny file?"
	destinyFile = gets.chomp

	if(File.exists?(destinyFile))
		puts "Overwriting file..."
	else
		puts "Creating file..."
	end

	IO.write(destinyFile,IO.read(sourceFile))
	puts "Done!"

else
	puts "#{sourceFile} not found"

end


