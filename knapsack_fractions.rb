KNAPSACK_MAX_WEIGTH = 4

items = [
	{ name: 'guitar', weight: 1, value: 1500 },
	{ name: 'laptop', weight: 3, value: 2000 },
	{ name: 'iphone', weight: 1, value: 2000 },
	{ name: 'stereo', weight: 4, value: 3000 },
	{ name: 'necklace', weight: 0.5, value: 1000 }
]

def min_weight(items, max_weight)
	min_weight = Float::INFINITY

	items.each do |item|
		if item[:weight] < min_weight
			min_weight = item[:weight]
		end
	end	

	min_weight
end

def linear_split(step, max_weight)
	(0..max_weight).step(step)
end

def knapsack(items, max_weight)
	grid = []
	step = min_weight(items, max_weight)
	split = linear_split(step, max_weight)

	items.each_with_index do |item, i|
		max_values = []
		grid << max_values

		split.each do |weight| 
			# weights index now need to be transforme using the step
			previous_item = i - 1

			if previous_item < 0
				if item[:weight] > weight
					max_values << { value: 0, items: [] }
				else
					max_values << { value: item[:value], items: [item[:name]] }
				end

				next
			end

			previous_max = grid[previous_item][weight / step]
			weight_remaning = weight - item[:weight]
			weight_remaning_index = weight_remaning / step

			if weight_remaning < 0
				max_values << previous_max
			else
				max_of_remaining = grid[previous_item][weight_remaning_index]

				previous_value = previous_max[:value]
				current_value = item[:value] + max_of_remaining[:value]

				if current_value > previous_value
					max_values << { 
						value: current_value ,
						items: [item[:name]] + max_of_remaining[:items]
					}
				else
					max_values << previous_max			
				end
			end
		end
	end

	grid[items.length - 1][max_weight / step]
end

require 'pp'
pp knapsack(items, KNAPSACK_MAX_WEIGTH)