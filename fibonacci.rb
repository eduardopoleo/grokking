# fibonacci
# factorial
# change problem
# knapsack
# closest substring
# DNA problem

def fib(n)
	return 0 if n == 0
	return 1 if n == 1

	fib(n - 1) + fib(n - 2)
end

# p fib(8)
# p fib(200) # breaks

def fib2(n)
	return 0 if n == 0
	return 1 if n == 1

	# dynamically build a cache from which next values depend on
	nums = [0, 1]

	(2..n).each do |idx|
		el = nums[idx - 1] + nums[idx - 2]

		nums << el
	end

	nums[-1]
end
# p fib2(8)
# p fib2(200)

# if we only care about the final numer
# this is actually the best solution.
def fib3(n)
	return 0 if n == 0
	return 1 if n == 1

	mem = [0, 1]

	(2..n).each do |idx|
		temp = mem[0] + mem[1]

		mem[0] = mem[1]
		mem[1] = temp
	end

	mem[1]
end

p fib3(12)

def fact!(n)
	return 1 if n == 0
	return 1 if n == 1

	n * fact!(n - 1)
end

# p fact!(100)

def fact2!(n)
	return 1 if n == 0
	return 1 if n == 1

	mem = 1

	(2..n).each do |e|
		mem = mem * e
	end

	mem
end

# p fact2!(10)