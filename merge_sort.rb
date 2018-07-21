def merge_sort(a)
	return a if a.length < 2

	mid = a.length / 2

	b = a[0...mid]
	c = a[mid..-1]

	b = merge_sort(b)
	c = merge_sort(c)

	merge(b, c)
end

def merge(a, b)
	c = []
	while !a.empty? && !b.empty?
		if a[0] <= b[0]
			e = a.delete_at(0)
		else
			e = b.delete_at(0)
		end

		c << e
	end

	while !a.empty?
		e = a.delete_at(0)
		c << e
	end

	while !b.empty?
		e = b.delete_at(0)
		c << e
	end

	c
end

a = [5,6,3,7,3,9, -1, -25, 100]

p merge_sort(a)

