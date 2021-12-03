require '../../assert'
require '../submarine'

INPUT = <<IPT
00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010
IPT

puzzle_input = File.read('./input.txt')

assert_equal "Power consumption isn't as expected", Submarine.new(INPUT).power_consumption, 198
assert_equal "Power consumption isn't as expected", Submarine.new(puzzle_input).power_consumption, 3309596

assert_equal "Oxygen generator rating isn't as expected", Submarine.new(INPUT).life_support_rating, 230
assert_equal "Oxygen generator rating isn't as expected", Submarine.new(puzzle_input).life_support_rating, 2981085

puts "Diagnostics look fine" unless failed?