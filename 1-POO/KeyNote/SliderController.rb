class SliderController

	NEXT = 1
	PREVIOUS = -1
	AUTO = 9

	def getInstruction instruction
		return NEXT if isNext? instruction		
		return PREVIOUS if isPrevious? instruction
		return AUTO if isAuto? instruction
	end

	def isNext? instruction
		instruction.upcase == "N"
	end

	def isPrevious? instruction
		instruction.upcase == "P"
	end

	def isAuto? instruction
		instruction.upcase == "AUTO"
	end
end