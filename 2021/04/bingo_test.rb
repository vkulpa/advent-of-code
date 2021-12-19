#!/usr/bin/env ruby

basedir = File.dirname(File.expand_path(__FILE__))
$: << basedir
$: << File.expand_path('../..', basedir)

require 'assert'
require 'bingo'

TEST_INPUT = <<IPT
7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1

22 13 17 11  0
 8  2 23  4 24
21  9 14 16  7
 6 10  3 18  5
 1 12 20 15 19

 3 15  0  2 22
 9 18 13 17  5
19  8  7 25 23
20 11 10 24  4
14 21 16 12  6

14 21 17 24  4
10 16 15  9 19
18  8 23 26 20
22 11 13  6  5
 2  0 12  3  7
IPT

puzzle_input = File.read("#{basedir}/input.txt")

assert_risen do
  Bingo.new(nil).play.score.calculate
end
assert_equal "Score of winning board is incorrect", Bingo.new(TEST_INPUT).play.score.calculate, 4512
assert_equal "Score of winning board is incorrect", Bingo.new(puzzle_input).play.score.calculate, 87456

assert_equal "Score of winning board is incorrect", Bingo.new(TEST_INPUT).play(till_end: true).score.calculate, 1924
assert_equal "Score of winning board is incorrect", Bingo.new(puzzle_input).play(till_end: true).score.calculate, 15561

puts 'Well played' unless failed?