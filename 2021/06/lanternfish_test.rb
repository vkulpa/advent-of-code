#!/usr/bin/env ruby

basedir = File.expand_path('..', __FILE__)
$: << basedir
$: << File.expand_path('../..', basedir)

require 'assert'
require 'lantern_fish'

INPUT = <<IPT
3,4,3,1,2
IPT

puzzle_input = File.read("#{basedir}/input.txt")

assert_equal "Population after 18 days", LanternFish.new(INPUT).simulate(18).population, 26
assert_equal "Population after 18 days", LanternFish.new(INPUT).simulate(80).population, 5934
assert_equal "Population after 80 days", LanternFish.new(puzzle_input).simulate(80).population, 396210

assert_equal "Population after 256 days", LanternFish.new(INPUT).simulate(256).population, 26984457539
assert_equal "Population after 256 days", LanternFish.new(puzzle_input).simulate(256).population, 1770823541496

puts "LanternFish population looks fine" unless failed?