module Funk
	class World
		def initialize width = 128, height = 128
			# set up the nested map array
			# @map[row][col][cell_contents]
			@map = Array.new(width)

			for i in 0..(width-1)
				@map[i] = Array.new(height)

				for k in 0..(height-1)
					@map[i][k] = Funk::Cell.new
				end
			end

			@entities = []
		end

		def cell_at x, y
			@map[x][y]
		end

		def update input
			@entities.each do |ent|
				ent.update input
			end
		end

		def draw window
			@map.each do |row|
				row.each do |cell|
					cell.draw window
				end
			end

			@entities.each do |ent|
				ent.draw window
			end
		end
	end
end
