Person = Struct.new(:name, :distance, :seen, :friends)
# distance is enough if one only wants the number
# for the path we need :parent

me = Person.new('me', 0, false, [:maria, :juan, :pedro] )

maria = Person.new('maria', nil, false, [:alejandro] )
pedro = Person.new('pedro', nil, false, [:john] )
juan = Person.new('juan', nil, false, [:phil] )

alejandro = Person.new('alejandro', nil, false, [] )
john = Person.new('john', nil, false, [] )
phil = Person.new('phil', nil, false, [] )

g = {
	me: me,
	maria: maria,
	pedro: pedro,
	juan: juan,
	alejandro: alejandro,
	john: john,
	phil: phil
}

class Queue
	Node = Struct.new(:value, :next)

	attr_reader :size

	def initialize(element)
		node = Node.new(element)

		@head = node
		@tail = node
		@size = 1
	end

	def enqueue(element)
		node = Node.new(element)

		@tail.next = node
		@tail = node

		@size += 1
	end

	def dequeue
		new_head = @head.next
		old_head = @head
		@head.next = nil
		@head = new_head
		@size -= 1

		old_head
	end
end

def bfs(g, target)
	me = g[:me]

	queue = Queue.new(me)

	me.friends.each do |name|
		friend = g[name]
		friend.distance = 1

		queue.enqueue(friend)
	end

	while queue.size > 0
		person = queue.dequeue.value

		if person.name == target
			return [person.distance, person.name]
		end

		person.seen = true

		person.friends.each do |name|
			friend = g[name]
			friend.distance = person.distance + 1
			if !friend.seen
				queue.enqueue(friend)
			end
		end
	end

	return false
end

p bfs(g, 'phil')