require '../../assert'
require './hydrothermal_vent'

INPUT = <<IPT
0,9 -> 5,9
8,0 -> 0,8
9,4 -> 3,4
2,2 -> 2,1
7,0 -> 7,4
6,4 -> 2,0
0,9 -> 2,9
3,4 -> 1,4
0,0 -> 8,8
5,5 -> 8,2
IPT

puzzle_input = File.read('./input.txt')

assert_equal "Number of the most dangerous areas isn't as expected", HydrothermalVent.new(INPUT).calculate.total_overlap, 5
assert_equal "Number of the most dangerous areas isn't as expected", HydrothermalVent.new(puzzle_input).calculate.total_overlap, 6007

assert_equal "Number of the most dangerous areas isn't as expected", HydrothermalVent.new(INPUT).calculate_with_diagonals.total_overlap, 12
assert_equal "Number of the most dangerous areas isn't as expected", HydrothermalVent.new(puzzle_input).calculate_with_diagonals.total_overlap, 19349

puts "Number of the most dangerous areas looks fine" unless failed?