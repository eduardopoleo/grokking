# NOTE: Sequence appears in the same relative order in both words
# but not necesarily consecutive.
# This differs from the substring problem

def initialize_grid(word1, word2)
	grid = []

	# build some top rows and columns with 0 to make things easier
	for i in 0..word2.size + 1
		grid << [0] * (word1.size + 1)
	end

	grid
end

def longest_sequence(word1, word2)
	grid = initialize_grid(word1, word2)

	grid.each_with_index do |row, i|
		next if i == 0

		row.each_with_index do |cell, j|
			next if j == 0
			# the -1 compensates for the fact that the grid has 1 extra
			# columns and rows with 0
			if word1[j - 1] == word2[i - 1]
				grid[i][j] = 1 + grid[i - 1][j - 1]
			else
				grid[i][j] = [grid[i][j - 1], grid[i - 1][j]].max
			end
		end
	end

	grid
end

require 'pp'
pp longest_sequence('agcat', 'gac')

__END__
the longest string is the same algorithm but the if else statement is

if word1[j - 1] == word2[i - 1]
	grid[i][j] = 1 + grid[i - 1][j - 1]
else
	grid[i][j] = 0
end
