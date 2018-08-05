g = {
	book: { lp: 5, poster: 0 },
	lp: { bass: 15, drums: 20 },
	poster: { bass: 30, drums: 35 },
	bass: { piano: 30 },
	drums: { piano: 10 },
	piano: {}
}

def dijkstra(g, source)
	distances, parents = initialize_table(g, source)
	queue = PriorityQueue.new(distances.slice(source))

	while queue.size > 0
		min = queue.pop_min # { book: 0 }

		parent = min.keys.first
		neighbors = g[parent]
		parent_distance = distances[parent]

		# do we need to worry about cycles?
		neighbors.each do |name, distance|
			new_distance = parent_distance + distance

			if new_distance < distances[name]
				distances[name] = new_distance
				parents[name] = parent
			end

			queue.add(distances.slice(name))
		end
	end

	[distances, parents]
end

def initialize_table(g, source)
	distances = {}
	parents = {}

	g.each do |key, _v|
		next if g[key] == source

		distances[key] = Float::INFINITY
		parents[key] = nil
	end

	distances[source] = 0

	[distances, parents]
end

def get_path(parents, target)
	list = [target]
	parent = parents[target]

	while !parent.nil?
		list << parent
		parent = parents[parent]
	end

	list.reverse
end

class PriorityQueue
	attr_reader :size, :list

	def initialize(node)
		# { name: distance }
		@list = [{ placeholder: 0 }, node]
		@size = 1
	end

	def add(node)
		@list << node
		@size = @size + 1

		move_up(@size)
	end

	def pop_min
		swap(1, size)

		min = list.pop
		@size = @size - 1

		move_down(1)

		min
	end

	private

	def move_up(idx)
		i = idx

		while i / 2 > 0 # until we get to position 1
			if list[i].values.first < list[i/2].values.first
				swap(i, i/2)
			end

			i = i / 2
		end
	end

	def swap(i, j)
		temp = list[j]
		list[j] = list[i]
		list[i] = temp
	end

	def move_down(idx)
		i = idx

		while i * 2 <= size
			child_idx = min_child(i)

			if list[idx].values.first > list[child_idx].values.first
				swap(idx, child_idx)
			end

			i = i * 2
		end
	end

	def min_child(i)
		return 2 * i if 2 * i + 1 > size

		if list[2*i].values.first < list[2*i + 1].values.first
			return 2 * i
		else
			return 2 * i + 1
		end
	end
end

distances, parents = dijkstra(g, :book)

p get_path(parents, :piano)
