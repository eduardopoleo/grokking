def quick_sort_in_place(a, lo, hi)
	return a if lo >= hi

	i = partitioning(a, lo, hi)

	quick_sort_in_place(a, lo, i - 1)
	quick_sort_in_place(a, i + 1, hi)
end

def partitioning(a, lo, hi)
	idx = rand(lo..hi)
	pivot = a[idx]
	i = lo
	swap(a, lo, idx)

	for j in (lo+1)..hi
		if a[j] < pivot
			swap(a, i, j)
			swap(a, i+1, j)
			i += 1
		end
	end

	i
end

def swap(a, i, j)
	temp = a[i]
	a[i] = a[j]
	a[j] = temp
end

a = [5,6,3,7,3,9, -1, -25, 100]

p quick_sort_in_place(a, 0, a.length - 1)

