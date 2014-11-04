require 'time'

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

	def getLine
		@file.gets()

	end
	def getBlock

		bloks = []
		
		file.each_line |line| do
			if isIdentification(line) id=line
			if isTime(line) time=line
			if isText(line) text << line
			if isEndOfBlock(line) 
				blocks << Block.new(line,time,text)
			end	
		end

		file.each_line |line| do
		
			if istime(line)
				shift
			else
				puts line
			end

		end

		num = getLine
		time = getLine.split(" --> ")
		text =[]

		while((aux = getLine) != "\r\n") do
			text.push(aux.gsub("\r\n",""))				
		end

		{
			"num" => num.gsub("\r\n",""),
			"time_show" => time[0].gsub("\r\n",""),
			"time_hide" => time[1].gsub("\r\n",""),
			"text" => text
		}
	end

end

class StrWriter
	def initialize(file)
		@nameFile = file
		@file
	end

	def openFile
		@file = File.open(@nameFile, "w")
	end

	def setBlock(block)
		@file.puts block.num
		@file.print block.time_show
		@file.print " --> "
		@file.puts block.time_hide
		@file.puts block.text
		@file.print "\r\n"
		
	end

	def setTypo(typos)
		typos.each{|key, value|
			@file.print "#{key}:"
			@file.print "#{value} ; "
		}
		@file.print "\n"

	end
end

class Block
	attr_accessor :num, :time_show, :time_hide, :text
	def initialize(hBlock)
		@num = hBlock["num"]
		@time_show = hBlock["time_show"]
		@time_hide = hBlock["time_hide"]
		@text = hBlock["text"]
	end

	def addTime(delay)
		@time_show.gsub("\r\n","")
		c = Converter.new()

		aux = c.toMilliSeconds(@time_show)
		aux += delay
		@time_show = c.toString(aux)

		@time_hide.gsub("\r\n","")
		aux = c.toMilliSeconds(@time_hide)
		aux += delay
		@time_hide = c.toString(aux)
	end

	def findTypos(word)

		typos = ""
		tokens = @text.to_s.gsub(/[^0-9a-zA-Z' '']/i, '').split(" ")
		tokens.each{|tok|
			if tok.chomp == word.chomp
				typos = tok.to_s
			end
		}

		typos

	end
end

class Converter
	def toMilliSeconds(timeStr)
		t = Time.parse(timeStr).to_f*1000	
	end

	def toString(timeMs)
		t = (Time.at(timeMs/1000).strftime("%H:%M:%S").to_s)
		t.concat(",%03d" % (timeMs%1000))
		t
	end
end

class SRTTimeShift

	def initialize (in_file, out_file)
		@srtSource = SrtReader.new(in_file)
		@srtSource.openFile
		@srtDestiny = StrWriter.new(out_file)
		@srtDestiny.openFile

		#typos = StrWriter.new("potential_typos.txt")
		#typos.openFile
	end

	def shift(ms)
		hashTypos = {}

		while blc = Block.new(@srtSource.getBlock) do
			if(blc.num!= nil)
				blc.addTime(ms)
				@srtDestiny.setBlock(blc)

		#		dictionary.reset
		#		repetitions=[]
		#		while(dic = dictionary.getLine) do
		#			possibleTypo = blc.findTypos(dic)
		#			if(possibleTypo.length >0)
		#				repetitions.push(blc.time_show)
		#			end
		#		end
		#		hashTypos[possibleTypo] = repetitions
			end
			
		end
		typos.setTypo(hashTypos)

	end
end

srt = SRTTimeShift.new("sub.srt", "salida.srt")
srt.shift(2000)





	




