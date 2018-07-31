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

# This looks like the equivalent to DFS.
# One might also write this as a method of the tree
# but it's better an external function cuz we usually do not only
# do transverals.
def preorder_transversal(root)
	return if root.nil?

	p root.value

	preorder_transversal(root.left)
	preorder_transversal(root.right)
end

preorder_transversal(root)
# => Book
# => Chapter1
# => Section 1.1
# => Section 1.2
# => Section 1.2.1
# => Section 1.2.2
# => Chapter 2
# => Section 2.1
# => Section 2.2
# => Section 2.2.1
# => Section 2.2.2
