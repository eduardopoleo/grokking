# This hash implementation is buggy
# manzana for some reason gets added to the wrong bin
# does not account for repeated keys but the gist of it is here.
class MyHash
	Element = Struct.new(:key, :value, :next)
	INITIAL_SIZE = 7
	LOAD_FACTOR = 0.7

	def initialize
		@size = INITIAL_SIZE
		@elements = [nil] * size
		@count = 0
	end

	def add(key, value)
		add_element(elements, key, value)
		@count += 1
		resize if needs_resizing?
	end

	def get(key)
		hashed_key = key.hash
		idx = hashed_key % size
		list_element = elements[idx]

		while list_element
			if list_element.key == key
				return list_element.value
			end

			list_element = list_element.next
		end

		return nil
	end

	private

	attr_reader :size, :elements, :count

	def add_element(elements, key, value)
		hashed_key = key.hash
		idx = hashed_key % size
		list_element = elements[idx]

		if list_element.nil?
			elements[idx] = Element.new(key, value, nil)
		else
			add_to_list(list_element, Element.new(key, value, nil))
		end
	end

	def add_to_list(initial_node, new_node)
		el = initial_node

		while el.next != nil
			el = el.next
		end

		el.next = new_node
	end

	def resize
		@size = (2 * size)
		new_elements = [nil] * size

		elements.each do |e|
			el = e

			while el
				add_element(new_elements, el.key, el.value)
				el = el.next
			end
		end
	end

	def needs_resizing?
		return false if count == 0

		(count.to_f / size) > LOAD_FACTOR
	end
end


hash = MyHash.new
hash.add(:manzana, 6)
hash.add(:pear, 3)
hash.add(:manzana, 6)
hash.add(:pear, 3)
hash.add(:pear, 3)
hash.add(:manzana, 6)
hash.add(:pear, 3)
hash.add(:pear, 3)
hash.add(:manzana, 6)
hash.add(:pear, 3)

p hash.get(:manzana)
p hash.get(:pear)
p hash.get(:banana)

require 'pp'
pp hash


