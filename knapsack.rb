KNAPSACK_MAX_WEIGTH = 4

items = [
	{ name: 'guitar', weight: 1, value: 1500 },
	{ name: 'laptop', weight: 3, value: 2000 },
	{ name: 'iphone', weight: 1, value: 2000 },
	{ name: 'stereo', weight: 4, value: 3000 }
]
# The algorithm is based on the formula
#          1  |  2  |  3  |  4
# guitar 1500  1500  1500  1500
# stereo 1500  1500  1500  3000
# laptop 1500  1500  2000  3500

# cell[i][j] = max of {
#  The previous max  (value at cell[i-weight][j]])
#  value current item + value of the remaning space => cell[i-1][weight - item[:weight]]
# }

# The rest just covers edge cases
# - if we are checking for the first item
# - if the current item weights more that the available weight on that cell

def knapsack(items, max_weight)
	grid = []

	items.each_with_index do |item, i|
		max_values = []
		grid << max_values

		# this assume integer values
		# for non integer e.g 0.5. we need to adjust the granularity (I think no need to make any other changes)
		(0..max_weight).each do |weight|
			previous_item = i - 1

			# if it's the very first item in the list
			if previous_item < 0
				if item[:weight] > weight
					max_values << { value: 0, items: [] }
				else
					max_values << { value: item[:value], items: [item[:name]] }
				end

				next
			end

			previous_max = grid[previous_item][weight]
			weight_remaning = weight - item[:weight]

			# the item weights more than the cell allows
			if weight_remaning < 0
				max_values << previous_max
			else
				max_of_remaining = grid[previous_item][weight_remaning]

				previous_value = previous_max[:value]
				current_value = item[:value] + max_of_remaining[:value]

				if current_value > previous_value
					max_values << { 
						value: current_value ,
						items: [item[:name]] + max_of_remaining[:items]
					}
				else
					max_values << previous_max # prioritize the first solution found			
				end
			end
		end
	end

	grid[items.length - 1][max_weight]
end

require 'pp'
pp knapsack(items, KNAPSACK_MAX_WEIGTH)



