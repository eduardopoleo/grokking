# find the minumum amount of coins required
# counter argument
# 40 cents -> [25, 10, 5] works with greedy solution
# 40 cents -> [25, 20, 10, 5] wont work

def change(target, coins)
	i = 0
	current = 0
	coins_used = []

	while target != current
		coin = coins[i]
		temp = coin + current

		if temp <= target
			current	= temp
			coins_used << coin
		else
			i += 1
		end
	end	

	coins_used
end
# Assuming:
# Coins are sorted
# Theres always a way to find change.
# O(coins + target).
# the worst case scenerio being that you loop through all coins
# till you get to 1 and loop through until you reach target.

coins = [50, 25, 10, 5, 1]
p change(80, coins) # 50, 25, 5
p change(40, coins) # 25, 10, 5

coins = [25, 20, 10, 5]
p change(40, coins) # 25, 10, 5 but should be 20 20

def change_dynamic(target, coins)

end
