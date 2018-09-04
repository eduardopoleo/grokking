# Total weight is 4lbs


KNAPSACK_MAX_WEIGTH = 4

items = [
	{ name: 'guitar', weight: 1, value: 1500 },
	{ name: 'stereo', weight: 4, value: 3000 },
	{ name: 'laptop', weight: 3, value: 2000 }
]

def knapsack(items, max_weight)
	grid = []

	items.each_with_index do |item, i|
		max_values = []
		grid << max_values

		(0..max_weight).each do |weight|
			previous_item = i - 1

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

			if weight_remaning < 0
				max_values << previous_max
			else
				v = item[:value] + grid[previous_item][weight_remaning][:value]
				objects = grid[previous_item][weight_remaning][:items] << item[:name]

				max_values << { value: v, items: objects}
			end
		end
	end

	grid
end

require 'pp'
pp knapsack(items, KNAPSACK_MAX_WEIGTH)



