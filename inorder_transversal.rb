require_relative './tree'

root = Node.new('Book')

root.insert_left('Chapter 1')
root.insert_right('Chapter 2')

root.left.insert_left('Section 1.1')
root.left.insert_right('Section 1.2')

root.left.right.insert_left('Section 1.2.1')
root.left.right.insert_right('Section 1.2.2')


root.right.insert_left('Section 2.1')
root.right.insert_right('Section 2.2')

root.right.right.insert_left('Section 2.2.1')
root.right.right.insert_right('Section 2.2.2')

def inorder_transversal(root)
	return if root.nil?

	inorder_transversal(root.left)
	p root.value
	inorder_transversal(root.right)
end

inorder_transversal(root)
# => Section 1.1
# => Chapter1
# => Section 1.2.1
# => Section 1.2
# => Section 1.2.2
# => Book
# => Section 2.1
# => Chapter 2
# => Section 2.2.1
# => Section 2.2
# => Section 2.2.2


