
class ScreenController

	def getWidth
		TermInfo.screen_size[1]
	end

	def getHeigth
		TermInfo.screen_size[0]
	end

	def show_centered line
		middle = getMiddle()
		center = getCenter line

		doReturn middle
		line = " " * center + line
		print line
		doReturn middle

	end

	def getMiddle
		(getHeigth-1) /2
	end

	def getCenter line
		(getWidth - line.length)/2
	end

	def doReturn t
		t.times do print("\n") end
	end
end

