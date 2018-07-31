require_relative './tree'

class ParseTree
	attr_reader :exp, :root

	def self.build(exp)
		new(exp).build
	end

	def initialize(exp)
		@exp = exp
	end

	def build
		# assumes that tokens are separated by spaces
		tokens = exp.split(' ')
		current_node = Node.new('')

		tokens.each do |token|
			if token == '('
				current_node.insert_left('')
				current_node = current_node.left
			elsif token == ')'
				# so that it does not ascend beyond the root node
				current_node = current_node.parent if current_node.parent
			elsif ['+', '-', '/', '*'].include?(token)
				current_node.value = token
				current_node.insert_right('')
				current_node = current_node.right
			elsif token =~ /\A(\d)+\z/ # integers. Gotcha
				current_node.value = token.to_i
				current_node = current_node.parent
			else # Gotcha
				raise "Not valid character '#{token}'"
			end
		end

		@root = current_node

		self
	end

	def to_s
		root.to_s
	end
end

def evaluate(node)
	return if node.nil?

	res1 = evaluate(node.left)
	res2 = evaluate(node.right)

	if res1 && res2
		operation = node.value
		return res1.send(operation, res2)
	else
		return node.value
	end
end

exp ='( ( 7 + 3 ) * ( 5 - 2 ) )'

tree = ParseTree.build(exp)
p '$$$ TREE $$$'
tree.to_s
p '$$$ EVALUATION $$$'
p evaluate(tree.root)




