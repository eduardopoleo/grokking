def binary_search_recursive(a, item, low, high)
	return nil if low > high

	mid = (low + high) / 2
	guess = a[mid]

	if guess == item
		return mid
	elsif guess > item 
		return binary_search_recursive(a, item, low, mid - 1)
	else
		return binary_search_recursive(a, item, low + 1, high)
	end
end

a = [1,3,5,6]

p binary_search_recursive(a, 1, 0, a.length - 1)
p binary_search_recursive(a, 5, 0, a.length - 1)
p binary_search_recursive(a, 6, 0, a.length - 1)
p binary_search_recursive(a, -1, 0, a.length - 1)
p binary_search_recursive(a, 10, 0, a.length - 1)

def binary_search(a, item)
	low = 0
	high = a.length - 1

	while low <= high
		mid = (low + high) / 2
		guess = a[mid]

		if guess == item
			return mid
		elsif guess > item
			high = mid - 1
		else
			low = mid + 1
		end
	end

	return nil
end

p 'NOT RECURSIVE'
p binary_search(a, 1)
p binary_search(a, 5)
p binary_search(a, 6)
p binary_search(a, -1)
p binary_search(a, 10)