def dijkstra(g, source)
	parents = { }
	distances = { }
	queue = []

	g.each do |item, adj|
		parents[item] = nil
		distances[item] = Float::INFINITY
		queue << item
	end

	parents[source] = nil
	distances[source] = 0

	while queue.length > 0
		parent = lowest_distance_item(queue, distances)

		adj = g[parent]

		adj.each do |k, v|
			current_distance = distances[k]
			current_parent = parents[k]

			new_distance = distances[parent] + v

			if new_distance < current_distance
				distances[k] = new_distance
				parents[k] = parent
			end
		end
	end

	[parents, distances]
end

def path_to_target(parents, target)
	node = target
	path = [node]

	while !parents[node].nil?
		parent = parents[node]
		path << parent

		node = parent
	end

	path
end

def lowest_distance_item(queue, distances)
	min = 0
	min_index = 0

	queue.each_with_index do |e, i|
		if distances[e] <= min
			min = distances[e]
			min_index = i
		end
	end

	queue.delete_at(min_index)
end


g = {
	book: { lp: 5, poster: 0 },
	lp: { guitar: 15, drums: 20 },
	poster: { guitar: 30, drums: 35 },
	guitar: { piano: 20 },
	drums: { piano: 10 },
	piano: {}
}

parents, distances = dijkstra(g, :book)

p distances[:piano]

p path_to_target(parents, :piano)

