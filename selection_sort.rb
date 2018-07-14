def find_smallest(a)
	smallest = a[0]
	smallest_idx = 0

	for i in 0...a.length
		el = a[i]
		if el < smallest
			smallest = el
			smallest_idx = i
		end
	end

	smallest_idx
end

def selection_sort(a)
	sorted_a = []

	for i in 0...a.length
		idx = find_smallest(a)
		smallest = a.delete_at(idx)
		sorted_a << smallest
	end

	sorted_a
end


a = [10, 4, 8, 3, 11, 2, -5, -2, 4]


 p selection_sort(a)


# NOTES
# O(N^2)
# => select the highest copy to another list
# => 1 + 2 + 3.. (n - 3) + (n - 2) + (n - 1) + n => n(n+1) / 2


# For loop does iteration size does not change
# even if a size changes.

# def chopping_arrays
# 	a = (0..10).to_a

# 	for i in 0...a.length
# 		puts "#{i}"
# 		a.delete_at(-1)
# 	end
# end

# chopping_arrays => 1, 2, 3 ... 10 this proves that the for loop 
# size gets locked even if the length changes