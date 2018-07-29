require_relative './tree'

class ParseTree
	attr_reader :exp

	def self.build(exp)
		new(exp).build
	end

	def initialize(exp)
		@exp = exp
	end

	def build
		tokens = exp.split('')
		current_node = Node.new('')

		tokens.each do |token|
			if token == '('
				current_node.insert_left('')
				current_node = current_node.left
			elsif !['+', '-', '/', '*', ')'].include?(token)
				current_node.value = token.to_i
				current_node = current_node.parent
			elsif ['+', '-', '/', '*'].include?(token)
				current_node.value = token
				current_node.insert_right('')
				current_node = current_node.right
			elsif token == ')'
				current_node = current_node.parent if current_node.parent
			else
				raise StandardError
			end
		end

		current_node
	end

end

exp ='((7+3)*(5-2))'

tree = ParseTree.build(exp)
tree.to_s



