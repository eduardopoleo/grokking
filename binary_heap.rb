# Use to implement a Priority Queue.
# Interface:
# build
class BinaryHeap
	attr_reader :list, :size

	def build(alist)
		@size = alist.size
		@list = [0] + alist
		i = @size / 2

		while i > 0
			move_down(i)
			i = i - 1
		end

		self
	end

	private

	def move_down(idx)
		i = idx 
		while (i * 2) < @size
			min_idx = min_child_index(i)		

			if list[i] > list[min_idx]
				swap(i, min_idx)
			end

			i = i * 2
		end
	end

	def min_child_index(i)
		return 2 * i if (2 * i + 1) > size

		if list[2 * i] < list[2 * i + 1]
			return 2 * i
		else
			return 2 * i + 1
		end
	end

	def swap(idx1, idx2)
		temp = list[idx1]
		list[idx1] = list[idx2]
		list[idx2] = temp
	end
end

alist = [33, 14, 9, 5, 17, 27, 18, 19, 11, 21]
#=> [5, 9, 11, 14, 18, 19, 21, 33, 17, 27]

heap = BinaryHeap.new.build(alist)

p heap.list