KNAPSACK_MAX_WEIGTH = 10
	
# total: amount of available lbs
# value: $ / lb

items = [
	{ name: 'quinoa', amount: 3, value: 6 },
	{ name: 'dal', amount: 5, value: 3 },
	{ name: 'rice', amount: 10, value: 1 }
]
# the dynamic programming solution won't work if we can take a fraction
# of elements. But we can use a greddy solution

def knapsack(items, bag_weight)
	outstanding_weight = bag_weight
	bag = { total: 0 }

	items.each do |item|
		break if 0 == outstanding_weight

		amount_taken = 0

		if item[:amount] <= outstanding_weight
			outstanding_weight -= item[:amount]
			amount_taken = item[:amount]
		else
			amount_taken = outstanding_weight

			outstanding_weight = 0
		end

		bag[:total] += (amount_taken * item[:value])
		bag[item[:name]] = amount_taken
	end

	bag
end

p knapsack(items, KNAPSACK_MAX_WEIGTH)


