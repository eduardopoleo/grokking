def quick_sort(a)
	if a.length < 2
		return a
	else
		pivot = a.delete_at(0) #=> n
		less = a.select {|e| e <= pivot } #=> n
		greater = a.select { |e| e > pivot } #=> n

		return quick_sort(less) + [pivot] + quick_sort(greater) #=> n
	end
end

a = [5,6,3,7,3,9]

p quick_sort(a)

# is quick sort in place
def quick_sort_random(a)
	l = a.length
	if l < 2
		return a
	else
		idx = rand(0..l - 1)

		pivot = a.delete_at(idx)
		less = a.select { |e| e <= pivot } # new element
		greater = a.select { |e| e > pivot } # new element

		return quick_sort(less) + [pivot] + quick_sort(greater)
	end
end

a = [5,6,3,7,3,9]

p quick_sort(a)