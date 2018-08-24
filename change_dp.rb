def change(coins, money)
	min_coins = (0..money).to_a
	number_coins = money

	for m in 0..money
		for i in 0...coins.length
			number_coins = m

			coin = coins[i]
			if m == 6
				p 'error'
				p coin
				p min_coins[6]
			end

			if m >= coin
				number_coins = min_coins[m-coin] + 1
			end

			if number_coins < min_coins[m]
				min_coins[m] = number_coins
			end
		end
	end

	min_coins
end

coins = [25, 20, 10, 5]
money = 40

p change(coins, money)
