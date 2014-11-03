class GameOfLife

	def initialize map
		@map = map
	end

	def calculate_next_gen 
		new_map = []
		for x in 0..@map.length-1
			row = []
			for y in 0..@map.length-1

				new_cell = :dead

				if isUnder_population? x,y 
					new_cell = :dead
				end

				if isPersisting_next_gen? x,y 
					new_cell = :alive
				end

				if isOvercrowding? x,y 
					new_cell = :dead
				end

				if isReproduction? x,y 
					new_cell = :alive
				end

				row << new_cell
			end
			new_map << row
		end
		return new_map
	end


	

	def get_number_of_neighbours x,y
		neighbours = 0

		if isNeighbourTop? x,y
			neighbours +=1 
		end 
		if isNeighbourBottom? x,y
			neighbours +=1 
		end
		if isNeighbourLeft? x,y
			neighbours +=1 
		end
		if isNeighbourRight? x,y
			neighbours +=1 
		end
		
		return neighbours
	end

	def isPersisting_next_gen? x,y
		((get_number_of_neighbours x,y)==2 || (get_number_of_neighbours x,y)==3 ) && @map[x][y]==:alive

	end

	def isOvercrowding? x,y
		(get_number_of_neighbours x,y)>3 && @map[x][y]==:alive

	end

	def isReproduction? x,y
		(get_number_of_neighbours x,y)==3 && @map[x][y]==:dead

	end

	def isUnder_population? x,y
		(get_number_of_neighbours x,y)<2 && @map[x][y]==:alive

	end

	def isNeighbourTop? x,y
		(y+1<@map.length) &&(@map[x][y+1]) == :alive

	end

	def isNeighbourBottom? x,y
		isAlive = false
		if (y-1>=0)
			if(@map[x][y-1]) == :alive
				isAlive = true
			end
		end

		return isAlive
	end

	def isNeighbourLeft? x,y
		isAlive = false
		if(x-1>=0 )
			if(@map[x-1][y]) == :alive
				isAlive = true
			end
		end
		return isAlive
	end

	def isNeighbourRight? x,y
		isAlive = false
		if(x+1<@map.length)
			if(@map[x+1][y]) == :alive
				isAlive = true
			end
		end
		return isAlive
	end
end



RSpec.describe "String Calculator" do

	it "dead cell 1x1" do
		expect(GameOfLife.new([:dead]).calculate_next_gen()).to eq([[:dead]])
	end

	it "living cell 1x1" do
		expect(GameOfLife.new([:alive]).calculate_next_gen()).to eq([[:dead]])
	end

	it "dead cell 2x2" do
		expect(GameOfLife.new([[:dead,:dead],[:dead,:dead]]).calculate_next_gen()).to eq([[:dead,:dead],[:dead,:dead]])
	end

	it "living cell 2x2" do
		expect(GameOfLife.new([[:alive,:alive],[:alive,:alive]]).calculate_next_gen()).to eq([[:alive,:alive],[:alive,:alive]])
	end

	it "living cell 2x2" do
		expect(GameOfLife.new([[:alive,:dead],[:dead,:alive]]).calculate_next_gen()).to eq([[:dead,:dead],[:dead,:dead]])
	end

	it "living cell 3x3" do
		
		expect(GameOfLife.new([[:dead,:alive,:alive],[:dead,:alive,:alive],[:alive,:dead,:alive]]).calculate_next_gen()).to eq([[:dead,:alive,:alive],[:dead,:alive,:alive],[:dead,:alive,:dead]])
	end

end
