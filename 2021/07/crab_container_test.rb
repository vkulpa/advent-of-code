#!/usr/bin/env ruby

basedir = File.dirname(File.expand_path(__FILE__))
$: << basedir
$: << File.expand_path('../..', basedir)

require 'assert'
require 'crab_container'

TEST_INPUT = <<IPT
16,1,2,0,4,2,7,1,2,14
IPT

puzzle_input = File.read("#{basedir}/input.txt")

assert_equal 'Most efficient position is wrong', CrabContainer.new(TEST_INPUT).align.total_fuel, 37
assert_equal 'Most efficient position is wrong', CrabContainer.new(puzzle_input).align.total_fuel, 345035

assert_equal 'Most efficient position is wrong', CrabContainer.new(TEST_INPUT).align(variable_fuel: true).total_fuel, 168
assert_equal 'Most efficient position is wrong', CrabContainer.new(puzzle_input).align(variable_fuel: true).total_fuel, 97038163

puts 'Crabs aligned at the same point with less possible fuel usage' unless failed?