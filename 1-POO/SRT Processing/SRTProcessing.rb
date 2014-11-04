require 'time'

class StrWriter
	def initialize(file)
		@nameFile = file
		@file
	end

	def openFile
		@file = File.open(@nameFile, "w")
	end

	def writeLine(line)
		@file.puts line
		
	end
end

class SrtReader
	def initialize(file)
		@nameFile = file
		@file
	end

	def reset
		@file.rewind
	end

	def openFile
		@file = File.open(@nameFile, "r")
	end

	def getLines
		line_num=0
		array = []
		text=@file.read
		text.gsub!(/\r\n?/, "\n")
		text.each_line do |line|

			array << Line.new(line.gsub("\r\n",""))
		end
		array
	end
end

class Line
	attr_accessor :line
	def initialize(line)
		@line = line
	end

	def isTime?
		@line.include?('-->')
	end

	def isId?()
		(@line.length) > 1 && (@line.length) < 5 && (@line.to_i.is_a? Numeric)
	end

	def isText?()
		if line.length>1&& !isTime? && !isId?
			true
		else
			false
		end
	end

end

class SRTTimeShift

	def initialize (in_file, out_file)
		@srtSource = SrtReader.new(in_file)
		@srtSource.openFile
		@srtDestiny = StrWriter.new(out_file)
		@srtDestiny.openFile
	end

	def shift(ms)

		lineList = @srtSource.getLines
		lineList.each{|ln|
			if ln.isTime? == true
				tms = ln.line.split(" --> ")
				Converter.toMilliSeconds()
			else
				@srtDestiny.writeLine(ln.line)
			end
		}
	end

	def method_name
		
	end

end

class Converter
	def self.toMilliSeconds(timeStr)
		t = Time.parse(timeStr).to_f*1000	
	end

	def self.toString(timeMs)
		t = (Time.at(timeMs/1000).strftime("%H:%M:%S").to_s)
		t.concat(",%03d" % (timeMs%1000))
		t
	end
end

srt = SRTTimeShift.new("sub.srt", "salida.srt")
srt.shift(2000)