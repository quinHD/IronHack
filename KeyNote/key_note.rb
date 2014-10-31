require 'terminfo'
require './FileReader'
require './ScreenController'
require './SliderController'

class ConsoleKeynote
	def initialize  file_reader, slider_controller, screen_controller
		@file_reader = file_reader
		@slider_controller = slider_controller
		@screen_controller = screen_controller
		@auto = false
		@slides = []
	end

	def start file_input
		@file_input = file_input
		@slides = read()
		play()
	end

	def read
		slides = @file_reader.read_file @file_input
		slides.delete("----\r\n")
		return slides
	end

	def play 
		pos = 0

		while pos >= 0 && pos< @slides.size do
			@screen_controller.show_centered @slides[pos]
			if(isAuto?)
				sleep(3)
				pos += 1
			else
				showConsole()
				pos += getDirection().to_i
			end
		end
		puts "FIN"
	end

	def getDirection
		command = @file_reader.getCommand()
		@slider_controller.getInstruction command
	end


	def showConsole
		print "> "

	end

	def isAuto?
		@auto
	end

end

ck = ConsoleKeynote.new(FileReader.new, SliderController.new, ScreenController.new)
ck.start "ppt.txt"
