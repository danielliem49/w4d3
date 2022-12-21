# PROBLEM 1 - depth_first_values

# Write a method, depth_first_values, that takes in the root of a binary tree. The method should return an array containing all values of the tree in depth-first order.

# Bonus: try solving this with a recursive solution AND an iterative solution!

# The node class below is used for your binary tree.

# class Node 

# 	attr_accessor :val, :left, :right

#   def initialize(val) 
#     @val = val
#     @left = null
#     @right = null
# 	end

# end

# TEST CASE 1:

# a = Node.new('a')
# b = Node.new('b')
# c = Node.new('c')
# d = Node.new('d')
# e = Node.new('e')
# f = Node.new('f')

# a.left = b
# a.right = c
# b.left = d
# b.right = e
# c.right = f

# //      a
# //    /   \
# //   b     c
# //  / \     \
# // d   e     f

# p depth_first_values(a)
# //    -> ['a', 'b', 'd', 'e', 'c', 'f']


# TEST CASE 2:

# a = Node.new('a')

# //      a

# p depth_first_values(a)
# //    -> ['a']


# TEST CASE 3:

# a = Node.new('a')
# b = Node.new('b')
# c = Node.new('c')
# d = Node.new('d')
# e = Node.new('e')

# a.right = b
# b.left = c
# c.right = d
# d.right = e

# p depth_first_values(a)
# //    -> ['a', 'b', 'c', 'd', 'e']


# TEST CASE 4:

# p depth_first_values(nil)
# //    -> []







# PROBLEM 2 - breadth_first_values

# Write a method, breadth_first_values, that takes in the root of a binary tree. The method should return an array containing all values of the tree in breadth-first order.

# The node class below is used for your binary tree.

# class Node 

# 	attr_accessor :val, :left, :right

#   def initialize(val) 
#     @val = val
#     @left = null
#     @right = null
#   end

# end

# TEST CASE 1:

# a = Node.new('a')
# b = Node.new('b')
# c = Node.new('c')
# d = Node.new('d')
# e = Node.new('e')
# f = Node.new('f')

# a.left = b
# a.right = c
# b.left = d
# b.right = e
# c.right = f

# //      a
# //    /   \
# //   b     c
# //  / \     \
# // d   e     f

# p breadth_first_values(a); 
# //    -> ['a', 'b', 'c', 'd', 'e', 'f']


# TEST CASE 2:

# a = Node.new('a')
# b = Node.new('b')
# c = Node.new('c')
# d = Node.new('d')
# e = Node.new('e')
# f = Node.new('f')
# f = Node.new('g')
# f = Node.new('h')

# a.left = b
# a.right = c
# b.left = d
# b.right = e
# c.right = f
# e.left = g
# f.right = h

# //      a
# //    /   \
# //   b     c
# //  / \     \
# // d   e     f
# //    /       \
# //   g         h

# p breadth_first_values(a); 
# //   -> ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']


# TEST CASE 3:

# a = Node.new('a')

# //      a

# p breadth_first_values(a); 
# //    -> ['a']


# TEST CASE 4:

# a = Node.new('a')
# b = Node.new('b')
# c = Node.new('c')
# d = Node.new('d')
# e = Node.new('e')
# x = Node.new('x')

# a.right = b
# b.left = c
# c.left = x
# c.right = d
# d.right = e

# //      a
# //       \
# //        b
# //       /
# //      c
# //    /  \
# //   x    d
# //         \
# //          e

# p breadth_first_values(a)
# //    -> ['a', 'b', 'c', 'x', 'd', 'e']


# TEST CASE 5:

# p breadth_first_values(nil)
# //    -> []