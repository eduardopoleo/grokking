# Binary Representation of a tree

# Using Lists. Which is horrific
# root = ['a', rb1, lb1]

# rb1 = ['b', [], lb2]
# lb2 = [d, [], []]

# lb1 = ['c', rb2, lb2]
# rb2 = [e, [], []]
# lb2 = [f, [], []]

# b = [b, [], []]
# c = [c, [], []]
# Insert d into right of c
# c = [c, [], d]
# d = [d, [], []]

# Insert right of d
# d = [d, [], e]
# e = [e, [], []]

# [
# 	'a', 
#   ['b', [], []],
#   [
#   	'c', 
#   	[],
#   	[
#   		'd',
#   	]
#   ]
# ]

# Using clases (which is great)

class Tree
	attr_accessor :left, :right, :root

	def initialize(root)
		@root = root # actual value 
		@left = nil # subtree
		@right = nil # subtree
	end

	def insert_left(node)
		if left
			t = Tree.new(node)
			t.left = self.left
			self.left = t
		else
			self.left = Tree.new(node)
		end
	end

	def insert_right(node)
		if right
			t = Tree.new(node)
			t.right = self.right
			self.right = t
		else
			self.right = Tree.new(node)
		end
	end

	def to_s
		queue = []
		queue << self

		while queue.length > 0
			tree = queue.shift
			p tree.root

			queue << tree.left if tree.left
			queue << tree.right if tree.right
		end
	end
end


a = Tree.new('a')

a.insert_left('b')
a.insert_right('c')

a.left.insert_right('d')

a.right.insert_left('e')
a.right.insert_right('f')

a.to_s