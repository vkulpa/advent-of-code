#!/usr/bin/env ruby

basedir = File.dirname(File.expand_path(__FILE__))
$: << basedir
$: << File.expand_path('../..', basedir)

require 'assert'
require 'sonar'

INPUT = <<IPT
199
200
208
210
200
207
240
269
260
263
IPT

puzzle_input = File.read("#{basedir}/input.txt")

assert_equal "Sonar measurements aren't as expected", Sonar.new(INPUT).calculate.total, 7
assert_equal "Sonar measurements aren't as expected", Sonar.new(puzzle_input).calculate.total, 1696

assert_equal "Sonar measurements aren't as expected", Sonar.new(INPUT).calculate_skip_noise.total, 5
assert_equal "Sonar measurements aren't as expected", Sonar.new(puzzle_input).calculate_skip_noise.total, 1737

puts "Sonar measurements are fine" unless failed?