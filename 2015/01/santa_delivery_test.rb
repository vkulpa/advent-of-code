require '../../assert'
require './santa'

assert_equal "Santa got lost", Santa.new('(())').deliver.floor, 0
assert_equal "Santa got lost", Santa.new('()()').deliver.floor, 0

assert_equal "Santa got lost", Santa.new('(((').deliver.floor, 3
assert_equal "Santa got lost", Santa.new('(()(()(').deliver.floor, 3
assert_equal "Santa got lost", Santa.new('))(((((').deliver.floor, 3

assert_equal "Santa got lost", Santa.new('())').deliver.floor, -1

assert_equal "Santa got lost", Santa.new(')))').deliver.floor, -3
assert_equal "Santa got lost", Santa.new(')())())').deliver.floor, -3

assert_equal "Santa didn't delivered to basement on right position", Santa.new(')').deliver_to_basement.position, 1

assert_equal "Santa didn't delivered to basement on right position", Santa.new('()())').deliver_to_basement.position, 5

puts "Santa successfully finish with his delivery on time" unless failed?