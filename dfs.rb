Person = Struct.new(:name, :friends, :visited)

g = {
	me: Person.new('me', [:jonas, :romeo, :juan, :vin], false),
	jonas: Person.new('jonas', [], false),
	romeo: Person.new('romeo', [], false),
	juan: Person.new('juan', [:al], false),
	vin: Person.new('vin', [:phil], false),
	phil: Person.new('phil', [:tomas], false),
	tomas: Person.new('tomas', [], false),
	al: Person.new('al', [:elend], false),
	elend: Person.new('elend', [], false)
}

def reset(g)
	g.each do |name,person|
		person.visited = false
	end
end

def dfs(g)
	person = g[:me]
	person.visited = true
	stack = [person]

	while stack.length > 0
		person = stack.pop

		p person.name
		person.visited = true

		person.friends.each do |f|
			friend = g[f]
			next if friend.visited

			stack << friend
		end
	end

	true
end

dfs(g)
reset(g)

p '$$$$$$$Recursive$$$$$$$$$$'
def dfs_recursive(person, g)
	p person.name

	person.visited = true

	person.friends.each do |f|
		friend = g[f]
		next if friend.visited
		dfs_recursive(friend, g)
	end
end

dfs_recursive(g[:me], g)
reset(g)

p '$$$$$$$$BFS$$$$$$$$$'

def bfs(g)
	person = g[:me]
	person.visited = true
	queue = [person]

	while queue.length > 0
		person = queue.shift

		p person.name
		person.visited = true

		person.friends.each do |f|
			friend = g[f]
			next if friend.visited

			queue << friend
		end
	end
end

bfs(g)