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

	def evaluate
		evaluate_tree(root)
	end

	private

	def evaluate_tree(node)
		if node.left && node.right
			left_value = evaluate_tree(node.left)
			right_value = evaluate_tree(node.right)
			operation = node.value.to_sym

			left_value.send(operation, right_value)
		else
			node.value
		end
	end
end

exp ='( ( 7 + 3 ) * ( 5 - 2 ) )'

tree = ParseTree.build(exp)
tree.to_s
p tree.evaluate




